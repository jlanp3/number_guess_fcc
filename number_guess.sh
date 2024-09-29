#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=number_guess --tuples-only -c"

RAN=$((1 + $RANDOM % 1000))

echo "Enter your username:"
read USERNAME 

USER_ID=$($PSQL "SELECT u_id FROM users WHERE name='$USERNAME';")

if [[ -z $USER_ID ]]
then
 echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  USER=$($PSQL "SELECT name FROM users WHERE u_id=$USER_ID;")
  BEST_GAME=$($PSQL "SELECT MIN(best_game) FROM stats WHERE u_id='$USER_ID';")
  GAMES_PLAYED=$($PSQL "SELECT COUNT(u_id) FROM stats WHERE u_id='$USER_ID';")
  echo -e "Welcome back, $(echo $USER! | sed -r 's/^ *| *$//g') You have played $(echo $GAMES_PLAYED | sed -r 's/^ *| *$//g') games, and your best game took $(echo $BEST_GAME | sed -r 's/^ *| *$//g') guesses.\n"
fi

echo "Guess the secret number between 1 and 1000:"

NUM=0
COUNT=0

while [[ ! $RAN -eq $NUM ]]
do
  read NUM
  if [[ ! $NUM =~ ^[0-9]+$ ]]
  then
    NUM=0
    echo "That is not an integer, guess again:"
  elif [[ $NUM -eq $RAN ]]
  then
    BEST_GAME=$(( COUNT += 1)) 
    if [[ -z $USER_ID ]]
    then
      INSERT_USER=$($PSQL "INSERT INTO users(name) VALUES('$USERNAME');")
      USER_ID=$($PSQL "SELECT u_id FROM users WHERE name='$USERNAME';")  
    fi
    INSERT_STATS=$($PSQL "INSERT INTO stats(best_game, u_id) VALUES($BEST_GAME, $USER_ID);")
    echo You guessed it in $COUNT tries. The secret number was $RAN. Nice job!
  elif [[ $NUM -gt $RAN ]]
  then
    echo "It's lower than that, guess again:"
  elif [[ $NUM -lt $RAN ]]
  then
    echo "It's higher than that, guess again:"
  fi
  COUNT=$(( COUNT += 1)) 
done