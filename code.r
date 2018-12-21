# This looping is just a trick to work the game without clicking everytime on "RUN"
while(TRUE){
  
  # -> Cleans Screen
  screenClear = function(){
    cat("\014")
  }
  
  # -> Reads player's choice
  gameWorking = function(player){
    while (p == 0){
      z = TRUE
      while(z){
        screenClear()
        print(game_ambient)
        user_input = readline(prompt = (paste("- > [", player[k], "] Select the cordinates you want (Ex: 2,3): ")))
        # Treats the selected row to get it like a number
        x = as.numeric(substring(user_input, 1, 1))
        # Treats the selected column to get it like a number
        y = as.numeric(substring(user_input, 3, 3))
        # Puts a 'X' to the selected place
        if(game_ambient[x,y] == 'X' || game_ambient[x,y] == 'O'){
          z = TRUE
        }
        else{z = FALSE}
      }
      if(k == 1){
        game_ambient[x,y] = 'X'
      }
      if(k == 2){
        game_ambient[x,y] = 'O'
      }
      
      # -> Checks if someone won the game
      gameStatus(game_ambient[1:3,1:3], player[k])
      
      # Turns to another player
      k = k + 1
      if (k == 3){
        k = 1
      }
    }
  }
  
  # -> Checks if someone won the game
  gameStatus = function(game_ambient, player){
    p = 0
    count = 0
    # Verifying Rows
    for (j in 1:3){
      for (i in 1:3){
        if (game_ambient[j,i] == "X"){
          count = count + 1
        }
      }
      if (count == 3){
        p = 1
      }
      else {count = 0}
    }
    for (j in 1:3){
      for (i in 1:3){
        if (game_ambient[j,i] == "O"){
          count = count + 1
        }
      }
      if (count == 3){
        p = 1
      }
      else {count = 0}
    }
    # Verifying Columns
    for (j in 1:3){
      for (i in 1:3){
        if (game_ambient[i,j] == "X"){
          count = count + 1
        }
      }
      if (count == 3){
        p = 1
      }
      else {count = 0}
    }
    for (j in 1:3){
      for (i in 1:3){
        if (game_ambient[i,j] == "O"){
          count = count + 1
        }
      }
      if (count == 3){
        p = 1
      }
      else {count = 0}
    }
    # Verifying First Diagonal
    for (i in 1:3){
      if (game_ambient[i,i] == "X"){
        count = count + 1
      }
    }
    if (count == 3){
      p = 1
    }
    else {count = 0}
    for (i in 1:3){
      if (game_ambient[i,i] == "O"){
        count = count + 1
      }
    }
    if (count == 3){
      p = 1
    }
    else {count = 0}
    # Verifying Second Diagonal
    if (game_ambient[1,3] == "X" && game_ambient[2,2] == "X" && game_ambient[3,1] == "X"){
        count = 3
    }
    if (count == 3){
      p = 1
    }
    else {count = 0}
    if (game_ambient[1,3] == "O" && game_ambient[2,2] == "O" && game_ambient[3,1] == "O"){
      count = 3
    }
    if (count == 3){
      p = 1
    }
    else {count = 0}
    # Print the winner on screen
    if (p == 1){
      screenClear()
      print(game_ambient)
      print(paste('[', player[k], '] won the game'))
      stop('GAME FINISHED!')
    }
    # Verifies and prints if no one wins the game
    for (j in 1:3){
      for (i in 1:3){
        if (game_ambient[j,i] == "X" || game_ambient[j,i] == "O"){
          count = count + 1
        }
      }
    }
    if (count == 9){
      screenClear()
      print(game_ambient)
      print(paste("There's no winner"))
      stop('GAME FINISHED!')
    }
    else {count = 0}
  }
  
  # -> That's the main looping of the program
  while(TRUE){
    # -> Starting Parameters of Game Ambient
    ambient = c(' ')
    game_ambient = matrix(ambient, ncol = 3, nrow = 3)
    
    # -> Players Selection
    k = 1
    player = c('')
    screenClear()
    while (k <= 2){
      name_input = readline(prompt = (paste(" Player", k, ": ")))
      name_input = as.array(name_input)
      player[k] = name_input
      k = k + 1
    }
    if (k == 3){
      k = 1
    }
    # -> This looping is responsible for the game working
    while (TRUE){
      gameWorking(player)
    }
  }
}
