
String mode = "selection"; 
int firstGuess; 
int secondGuess;
int doorRevealed; 
int winningDoor; 
int gamesPlayed = 1;
int x = 1;
int winAutStick = 0;
int loseAutStick = 0;
int winAutSwitch = 0;
int loseAutSwitch = 0;
int win = 0;
int lose = 0;
int winStickPercent = int(100/(1+loseAutStick/winAutStick));
int winSwitchPercent = int(100/(1+loseAutSwitch/winAutSwitch));
void setup(){
     size(500, 500); 
     textAlign(CENTER);
}
void draw(){
     background(255);
     //add code here for what ALWAYS needs drawing
     fill(0);
     //text("mode:" + mode, 200, 200);
     //text("firstGuess:" + firstGuess, 200, 250);
     //text("secondGuess:" + secondGuess, 200, 300);
     //text("doorRevealed:" + doorRevealed, 200, 350);
     //text("winningDoor:" + winningDoor, 200, 400);
       int winStickPercent = int(100/(1+loseAutStick/winAutStick));
       int winSwitchPercent = int(100/(1+loseAutSwitch/winAutSwitch));
     if(mode == "selection"){
     
       fill(255,0,0);
       rect(0,0,250,500);
       fill(0,255,0);
       rect(250,0,250,500);
     }
     else if(mode == "initialize"){
          firstGuess = -1; 
          secondGuess = -1; 
          doorRevealed = -1; 
          winningDoor = int(random(1, 4)); 
            text("wins:" + win, 150,490);
     text("losses:" + lose, 250,490);   
          mode = "firstGuess"; 
     }else if(mode == "firstGuess"){
          
          fill(255,0,0);
          rect(50,50,100,200);
          fill(0,255,0);
          rect(200,50,100,200);
          fill(0,0,255);
          rect(350,50,100,200);
            text("wins:" + win, 150,490);
     text("losses:" + lose, 250,490);   
     }else if(mode == "secondGuess"){
          //this while loop is for revealing a door that the prize is not behind
          //DO NOT CHANGE THIS CODE
          //but you will need to USE the doorRevealed variable in your drawing code
           text("wins:" + win, 150,490);
           text("losses:" + lose, 250,490);       
          while(doorRevealed == -1 || doorRevealed == winningDoor || doorRevealed == firstGuess){
               doorRevealed = int(random(1, 4)); 
            
          }
          fill(255, 255,0);
          if (firstGuess == 1) {
            noFill();
            strokeWeight(5);
            stroke(255,255,0);
            rect(50,50,100,200);}
            else if(firstGuess == 2) {
            strokeWeight(5);
            noFill();
            stroke(255,255,0);
            rect(200,50,100,200);}
            else {
            noFill();
            strokeWeight(5);
            stroke(255,255,0);
            rect(350,50,100,200);}
           noStroke();
          if (doorRevealed == 1) {
                 fill(128);
                 rect( 50,50,100,200);
                 fill(0,255,0);
                 rect(200,50,100,200);
                 fill(0,0,255);
                 rect(350,50,100,200);}
         else if (doorRevealed == 2) {
                 fill(255, 0, 0);
                 rect( 50,50,100,200);
                 fill(128);
                 rect(200,50,100,200);
                 fill(0,0,255);
                 rect(350,50,100,200);
         } else if (doorRevealed == 3) {
                 fill(255,0,0);
                 rect( 50,50,100,200);
                 fill(0,255,0);
                 rect(200,50,100,200);
                 fill(128);
                 rect(350,50,100,200);
          
          }
          
     }else if(mode == "winOrLose"){
          //add drawing code here
       text("wins:" + win, 150,490);
     text("losses:" + lose, 250,490);       
      
      if (secondGuess == 1 && winningDoor == 1) {
         fill(255,255,0);
         rect(50,50,100,200);
         fill(128);
         rect(200,50,100,200);
         rect(350,50,100,200);
         fill(0);
         win = win + 1;
         text("You Win!",200,350);
     }
     else if(secondGuess == 1 && winningDoor == 2) {
         fill(255,0,0);
         rect(50,50,100,200);
         fill(255,255,0);
         rect(200,50,100,200);
         fill(128);
         rect(350,50,100,200);
       lose = lose + 1;
       fill(0);  
       text("You Lose",200,350);}  
         else if(secondGuess == 1 && winningDoor == 3) {
         fill(255,0,0);
         rect(50,50,100,200);
         fill(128);
         rect(200,50,100,200);
         fill(255,255,0);
         rect(350,50,100,200);
         lose = lose + 1;
       fill(0);  
       text("You Lose",200,350);}  
         else if(secondGuess == 2 && winningDoor == 1) {
         fill(255,255,0);
         rect(50,50,100,200);
         fill(255,0,0);
         rect(200,50,100,200);
         fill(128);
         rect(350,50,100,200);
       lose = lose + 1;
       fill(0);  
       text("You Lose",200,350);}  
         else if(secondGuess == 2 && winningDoor == 2) {
         fill(128);
         rect(50,50,100,200);
         fill(255,255,0);
         rect(200,50,100,200);
         fill(128);
         rect(350,50,100,200);
                win = win + 1;
       fill(0);  
       text("You Win",200,350);}  
         else if(secondGuess == 2 && winningDoor == 3) {
         fill(128);
         rect(50,50,100,200);
         fill(255,0,0);
         rect(200,50,100,200);
         fill(255,255,0);
lose = lose + 1;
         rect(350,50,100,200);
       fill(0);  
       text("You Lose",200,350);}  
         else if(secondGuess == 3 && winningDoor == 1) {
         fill(255,255,0);
         rect(50,50,100,200);
         fill(128);
         rect(200,50,100,200);
         fill(255,0,0);
         rect(350,50,100,200);
       fill(0);  
     lose = lose + 1;  
     text("You Lose",200,350);}  
         else if(secondGuess == 3 && winningDoor == 2) {
         fill(128);
         rect(50,50,100,200);
         fill(255,255,0);
         rect(200,50,100,200);
         fill(255,0,0);
         rect(350,50,100,200);
       fill(0);  
     lose = lose + 1;  
     text("You Lose",200,350);}  
         else if(secondGuess == 3 && winningDoor == 3) {
         fill(128);
         rect(50,50,100,200);
         fill(128);
         rect(200,50,100,200);
         fill(255,255,0);
         rect(350,50,100,200);
       win = win + 1;
       fill(0);  
       text("You Win",200,350);}  
     }
     else if (mode == "automated"){
          fill(0);
          firstGuess = int(random(1, 4)); 
          secondGuess = -1; 
          doorRevealed = -1; 
          winningDoor = int(random(1, 4)); 
           text("wins by Sticking:" + winAutStick, 430,450);
           text("loses by Sticking:" + loseAutStick,310,475);
           text("wins by Switching:" + winAutSwitch, 180, 450);
           text("loses by Switching:" + loseAutSwitch, 60, 475); 
           text("win% by sticking:" + winStickPercent, 180, 490);
           text("win% by switching:" + winSwitchPercent, 310, 490);
          mode = "firstGuessAut"; 
          
     }
     else if (mode == "firstGuessAut"){
         fill(0);
            text("wins by Sticking:" + winAutStick, 430,450);
           text("loses by Sticking:" + loseAutStick,310,475);
           text("wins by Switching:" + winAutSwitch, 180, 450);
           text("loses by Switching:" + loseAutSwitch, 60, 475);
           text("win% by sticking:" + winStickPercent, 180, 490);
           text("win% by switching:" + winSwitchPercent, 310, 490); 
       while(doorRevealed == -1 || doorRevealed == winningDoor || doorRevealed == firstGuess){
               doorRevealed = int(random(1, 4));
       if (x < 1000){
     secondGuess = firstGuess;
     mode = "winOrLoseAut";
     }else {
     while(secondGuess == -1 || secondGuess == doorRevealed|| secondGuess ==firstGuess){
         secondGuess = int(random(1,4));
         
     }
     mode = "winOrLoseAut";
       }
    }
  }else if (mode == "winOrLoseAut"){
  text("wins by Sticking:" + winAutStick, 430,450);
  text("loses by Sticking:" + loseAutStick,310,475);
  text("wins by Switching:" + winAutSwitch, 180, 450);
  text("loses by Switching:" + loseAutSwitch, 60, 475); 
  text("win% by sticking:" + winStickPercent, 180, 490);
  text("win% by switching:" + winSwitchPercent, 310, 490);
  if (secondGuess == winningDoor){
  x = x + 1;
  if (x < 1000){
  
  winAutStick = winAutStick + 1;
  mode = "automated";
  }else if (2000 > x && x > 1000){
  winAutSwitch = winAutSwitch + 1;
  mode = "automated"; } else {
  text("wins by Sticking:" + winAutStick, 430,450);
  text("loses by Sticking:" + loseAutStick,310,475);
  text("wins by Switching:" + winAutSwitch, 180, 450);
  text("loses by Switching:" + loseAutSwitch, 60, 475); 
  text("win% by sticking:" + winStickPercent, 180, 490);
  text("win% by switching:" + winSwitchPercent, 310, 490);
  }
  }
  else {
  x = x + 1;
  if (x < 1000){
  
  loseAutStick = loseAutStick + 1;
  mode = "automated";
  }
  else if (2000 > x && x > 1000  ){
  loseAutSwitch = loseAutSwitch + 1;
  mode = "automated"; } else {
  text("wins by Sticking:" + winAutStick, 430,450);
  text("loses by Sticking:" + loseAutStick,310,475);
  text("wins by Switching:" + winAutSwitch, 180, 450);
  text("loses by Switching:" + loseAutSwitch, 60, 475);
  text("win% by sticking:" + winStickPercent, 180, 490);
  text("win% by switching:" + winSwitchPercent, 310, 490);
  } 
  }
  
  }
}
  


  
  




void mousePressed(){
     
  
  if(mode == "selection"){
  if(mouseX >0 && mouseX<250 && mouseY >0 && mouseY<500){
   {mode = "initialize";} 
  }
  else if(mouseX >250 && mouseX <500 && mouseY >0 && mouseY <500)
  {
   {mode = "automated";} 
  }
  }
  
  else if(mode == "firstGuess"){
          //add code to check for mouse clicks here
           if(mouseX >50 && mouseX < 150 && mouseY > 50 && mouseY < 200)
           {
            firstGuess = 1;
            mode = "secondGuess";
           }
            else if(mouseX >200 && mouseX < 300 && mouseY > 50 && mouseY < 200)
            {
            firstGuess = 2;
            mode = "secondGuess";
            }
            else if(mouseX >350 && mouseX < 450 && mouseY > 50 && mouseY < 200){
            firstGuess = 3;
            mode = "secondGuess";
            } 
           
           
     }else if(mode == "secondGuess"){
       if(doorRevealed != 1 && mouseX > 50 && mouseX < 150 && mouseY > 50 && mouseY < 200){
           secondGuess = 1; 
           mode = "winOrLose"; 
       } else if (doorRevealed != 2 && mouseX >200 && mouseX < 300 && mouseY > 50 && mouseY < 200){
           secondGuess = 2;
           mode = "win0rLose";
       } else if (doorRevealed != 3 && mouseX >350 && mouseX < 450 && mouseY > 50 && mouseY < 200){
           secondGuess = 3;
           mode = "winOrLose";
       }
       
       
   
     }else if(mode == "winOrLose"){
          //add code to check for mouse clicks here
          
     }
}

//kristiancharb@gmail.com
