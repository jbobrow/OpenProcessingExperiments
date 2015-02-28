
int currentPage = 0; //sets first page
int newX = 0; //sets x value
int newY = 0; //sets y value
int currentPlayer = 1; //sets player's turn
int rVal = 0; //sets red piece
int bVal = 255; //sets blue piece
int player1Score = 0; //player one score
int player2Score = 0; //player two score
boolean infoButton = true; //determines showing info button
boolean startGame = true; //draws grid
PImage homeScreen; //home screen image
PImage startButton; //start button image
PImage infoTwo; //information page button
PImage resetButton; //reset button
PImage scoreButtons; //score button


void setup(){
  size(1000, 900); //canvas size
  background(153); //grid background color
  homeScreen = loadImage("Screen.png"); //start screen image
  startButton = loadImage("Start.png"); //start button image
  infoTwo = loadImage("Info.png"); //instruction page image
  resetButton = loadImage("Reset.png"); //reset button image
  scoreButtons = loadImage("scorebuttons.png"); //score button image
}

void draw(){
  if(infoButton == true){  ////checks if info button is pressed
    infoPage(); //call infoPage func
  } 
  if(currentPage == 0){
    background(255); //start screen background
    image(homeScreen, 100, 100); //connect tree image
    image(startButton, 300, 460); //start button
    image(infoTwo, 250, 550); //info button
    textSize(30); //intro text size
    fill(0); //text color
    text("Created by Bennett Rivera and Brent Wong.", 170, 700); //creator text
    homePage();
  }
  else if(currentPage == 1){
    infoButton = false;
    grid(); // call grid function
    image(resetButton, 908, 805); //reset button
    image(scoreButtons, 433, 5);
  }
  else if(currentPage == 2){
    infoPage(); //call infoPage func
  }
  else if(currentPage == 3){
    scorePage(); //call scorePage function
  }
  else if(currentPage == 4){
    bluePage();
  }
}

void homePage(){
   fill(255); //start screen background
}

void infoPage(){
  background(0); //info page background
  fill(255); //text color
  textSize(50); //text size
  text("Connect Tree Instructions", 200, 150); //game instructions
  textSize(20); //text size
  text("- Click on the square where you want to place your piece.", 200, 200); //game instructions
  text("  - Click in the lowest square available.", 200, 225); //game instructions
  text("- To win get three of your pieces in a row.", 200, 275); //game instructions
  text("  - Click on the button of your piece color.", 200, 300); //game instructions
  text("- To reset, click the black star with the R.", 200, 350); //game instructions
  textSize(50); //text size
  fill(74, 229, 14); //text color
  text("Click anywhere to go back. <--", 125, 600); //game instructions
}

void gamePieces(){
  fill(rVal, 0, bVal); //blue
  strokeWeight(0); //lines
  ellipse(mouseX, mouseY, 180, 180); //circle  
}

void grid(){
  if(startGame == true){ //checks if start button is pressed
    background(153);  //grid background
    startGame = false; //checks if start button isn't pressed
  }
  strokeWeight(5); //grid line thickness
  line(250, 0, 250, 955); //y grid line
  line(500, 0, 500, 955); //y grid line
  line(750, 0, 750, 955); //y grid line
  line(0, 225, 1000, 225); //x grid line
  line(0, 450, 1000, 450); //x grid line
  line(0, 675, 1000, 675); //x grid line
}

void scorePage(){
  background(255, 0, 0); //red screen
  fill(255); //fill color white
  textSize(30); //text size
  text("Click anywhere to go back.", 350, 800); //instructions
  textSize(90); //text size
  text("Red Player Wins!", 150, 450); //winning text
}

void bluePage(){
  background(0, 0, 255); //blue background
  fill(255); //text color
  textSize(30); //text size
  text("Click anywhere to go back.", 350, 800); //instructions
  textSize(90); //text size
  text("Blue Player Wins!", 150, 450); //winning text
}

void mousePressed(){
  if(currentPage == 0 && mouseX > 300 && mouseX < 634 && mouseY > 460 && mouseY < 531){
    currentPage = 1; //start page set
  }
  else if(currentPage == 0 && mouseX > 250 && mouseX < 682 && mouseY >550 && mouseY < 614){ 
    currentPage = 2; //game page change
  }
  else if(currentPage == 2 && mouseX > 0 && mouseX < 1000 && mouseY > 0 && mouseY < 900){
    currentPage = 0; //info page change
  }
  else if(currentPage == 1 && mouseX > 908 && mouseX < 1013 && mouseY > 805 && mouseY < 900){
    startGame = true;
  }
    //blue button
  else if(currentPage == 1 && mouseX > 433 && mouseX < 501.5 && mouseY > 5 && mouseY < 36){
    currentPage = 4;
    //println("here");
  }
  else if(currentPage == 4 && mouseX > 0 && mouseX <1000 && mouseY >0 && mouseY <900){
    currentPage = 1;
    startGame = true;
  }
  //redbutton
  else if(currentPage == 1 && mouseX > 502 && mouseX < 570.5 && mouseY > 5 && mouseY < 36){
    currentPage = 3;
    player1Score = player1Score + 1;
  } 
  else if(currentPage == 3 && mouseX > 0 && mouseX <1000 && mouseY >0 && mouseY <900){
    currentPage = 1;
    startGame = true;
  }
  else if(currentPage == 1 && currentPlayer == 1){
   // currentPage =  currentPage;
    fill(255, 0, 0); //red
    strokeWeight(0); //lines
    newX = mouseX; //current x value stored into new x value
    newY = mouseY; //current y value stored into new y value
    ellipse(newX, newY, 180, 180); //new circle
    currentPlayer = - currentPlayer; //switch color
  }
  else if(currentPage == 1 && currentPlayer == -1){
    //currentPage =  - currentPage;
    fill(0, 0, 255); //blue
    strokeWeight(0); //lines
    newX = mouseX; //current x value stored into new x value
    newY = mouseY; //current y value stored into new y value
    ellipse(newX, newY, 180, 180); //new circle
    currentPlayer = - currentPlayer; //switch color
  }
}

