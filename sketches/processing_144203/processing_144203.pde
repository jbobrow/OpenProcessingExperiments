
int currentPage = 0; //currentpage is zero
PImage olympicstart; //image olympicstart 
PImage info; //image infobutton
PImage OlympicRings; //image olympicrings
PImage Arrowkeys; //image arrowkeys 
PImage skier; //image skier
PImage ResetButton;
float gates; // float variable is 1st gates 
float gates2; // float variable is 2nd gates
float gates3; //float variable for 3rd gates
int time = 0; //time starts at 0
boolean showGates = true; //showgates is true
boolean showGates2 = true; //showgates2 is true
boolean showGates3 = true; //showgates2 is true
float gatesx = 0; //gatesx is set at 0 
float gatesy = 0; //gatesy is set at 0
float gatesx2 = 0; //gatesx is set at 0 
float gatesy2 = 0; //gatesy is set at 0 
float gatesx3 = 0; //gatesx is set at 0 
float gatesy3 = 0; //gatesy is set at 0
int xPos = 225; //starting position for x 
int yPos = -125; //starting position for y
int levels = 0; //levels is set at 0 
boolean finishline = false; //finishline is false
boolean stopTime = false; //stoptime is false 
boolean restartPage = false; //restartpage is false 



void setup(){
  size(650, 825); //canvas size
  olympicstart = loadImage("olympicstart.png"); //make image appear
  info = loadImage("info.png"); //make image appear
  OlympicRings = loadImage("OlympicRings.png"); //make image appear
  Arrowkeys = loadImage("Arrowkeys.png"); //make image appear 
  skier = loadImage("skier.png"); //make image appear 
  ResetButton = loadImage("ResetButton.png"); //make image appear 
}

void draw(){
  background(255); //background color is white 
  if(currentPage == 0){  //if statement when currentpage is 0 
    image(olympicstart, 20, 300); //olympicstart image location
    image(info, 550, 750); //info image location
  }
    else if(currentPage == 1){ //if the page is at 1 then...
      drawLevelOne(); //drawlevelone function
      image(info, 550, 750);// info image location
      image(ResetButton, 10, 10, 200, 165);
      gates(); //gates function
      gates2(); //gates function
      gates3(); //gates fucntion
      if(time>100){ 
        skier(); //skier function 
      }
    }  
    else if(currentPage == 3){ //if the page is at 3 then....
        information(); //information function 
        image(info, 550, 750);// info image location
    }
   if(levels==11){ //if levels equals 11 then.....
     finishline = true;  //finshline equals true 
   }  
   if(restartPage == true){ //if restartpage equals true then....
      showGates = true; //showgates equals true 
      showGates2 = true; //showgates2 equals true 
      showGates3 = true; //showgates3 equals true 
      time = 0; //time is equal to 0 
      xPos = 225; //x position equals 225
      yPos = -125; //y position equals -125 
      finishline = false; //finish line equals false 
      levels = 0; //levels is equal to 0 
      restartPage = false; //restartpage equals false 
      stopTime = false; //stopTime equals false 
    }  
}

void drawLevelOne(){
  background(255); //background color is white
  noFill(); //doesnt fill inside of the object 
  rect(530,30,100,30); //draw rectangle 
  fill(0); //set color to black
  if(stopTime==false){
    time = time + 1; //everytime the timer is used it adds one to itself 
  }
  if(time>100){
    text("Time: " +(time/50.0),550,50); // the location and speed of timer 
    
  } 
  if(showGates == true){ //if showgates is true then....
    gatesx = random(25, 300); // location of gatesx is random
    gatesy = random(125, 300); //location of gatesy is random
    showGates = false; //if the statement isnt true then it becomes false 
  }    
  if(showGates2 == true){ //if showgates is true then....
    gatesx2 = random(25, 100); // location of gatesx is random
    gatesy2 = random(400, 500); //location of gatesy is random
    showGates2 = false; //if the statement isnt true then it becomes false 
  }
  if(showGates3 == true){ //if showgates is true then....
    gatesx3 = random(25, 300); // location of gatesx is random
    gatesy3 = random(750, 750); //location of gatesy is random
    showGates3 = false; //if the statement isnt true then it becomes false
  } 
  if(finishline == true){
      stroke(0); //stroke color is black 
      strokeWeight(10); //stroke size is 10 
      line(0, 750, 650, 750); //finish line
  }    
}

void gates(){ 
  strokeWeight(2); //size is 2 
  fill(234, 129, 17); //set to orange 
  rect(gatesx, gatesy, 50, 25); //draw left main rectangle 
  rect(gatesx+300 , gatesy, 50, 25); //draw right main rectangle
  image(OlympicRings, gatesx, gatesy, 50, 25); //image size 
  image(OlympicRings, gatesx+300, gatesy, 50, 25); //image size  
  stroke(0, 0, 255); //set to blue  
  line(gatesx, gatesy+50, gatesx, gatesy); // draw left leg 
  line(gatesx+50, gatesy, gatesx+50, gatesy+50); //draw right leg
  line(gatesx+300, gatesy+50, gatesx+300, gatesy);  //draw left leg 2
  line(gatesx+350, gatesy, gatesx+350, gatesy+50);  //draw right leg 2 
}

void gates2(){
  strokeWeight(2); //size is 2 
  rect(gatesx2, gatesy2, 50, 25); //draw left main rectangle 
  rect(gatesx2+300 , gatesy2, 50, 25); //draw right main rectangle
  image(OlympicRings, gatesx2, gatesy2, 50, 25); //image size 
  image(OlympicRings, gatesx2+300, gatesy2, 50, 25); //image size 
  line(gatesx2, gatesy2+50, gatesx2, gatesy2); // draw left leg 
  line(gatesx2+50, gatesy2, gatesx2+50, gatesy2+50); //draw right leg
  line(gatesx2+300, gatesy2+50, gatesx2+300, gatesy2);  //draw left leg 2
  line(gatesx2+350, gatesy2, gatesx2+350, gatesy2+50);  //draw right leg 2 
}

void gates3(){
  strokeWeight(2); //size is 2 
  rect(gatesx3, gatesy3, 50, 25); //draw left main rectangle 
  rect(gatesx3+300 , gatesy3, 50, 25); //draw right main rectangle
  image(OlympicRings, gatesx3, gatesy3, 50, 25); //image size 
  image(OlympicRings, gatesx3+300, gatesy3, 50, 25); //image size 
  line(gatesx3, gatesy3+50, gatesx3, gatesy3); // draw left leg 
  line(gatesx3+50, gatesy3, gatesx3+50, gatesy3+50); //draw right leg
  line(gatesx3+300, gatesy3+50, gatesx3+300, gatesy3);  //draw left leg 2
  line(gatesx3+350, gatesy3, gatesx3+350, gatesy3+50);  //draw right leg 2
} 
  
void information(){
  background(0); //background color is black 
  image(Arrowkeys, 220, 250, 200, 120); //image location and size 
  text("INSTRUCTIONS", 280, 180); //Instructions location 
  text("Left Key = Ski Left", 100, 340); //left key = ski left location 
  text("Right Key = SKi Right", 440, 340); //right key = ski right location 
  text("Up Key = Slow Down", 270, 230); //up key = slow down location 
  text("Down Key = Speed Up", 260, 400); //down key = speed up location 
  text("CLICK AGAIN TO GO BACK TO START", 350,790); //click again to go back to start location 
}

void skier(){
  image(skier, xPos, yPos, 200, 150); //skier size and location 
  yPos = yPos + 7; // adding 7 to y position every time 
  if(yPos>700&&levels>10){ //if y position is greater than 800 and if levels is greater than 10 then.... 
    yPos = 750; // y position equals 800 
    stopTime = true; //pause time equals true 
  }
  if(yPos>825){ //if y position is greater than 925 then.....
    yPos = -125; //y position is equal to -125 
    showGates = true; //showgates equals ture 
    showGates2 = true; //showgates2 equals true 
    showGates3 = true; // showgates3 equals true 
    levels = levels + 1; //levels equals levels plus 1 
  }
}

void keyPressed(){
  if (key == CODED) { //if the keys are equal to coded then....
    if (keyCode == RIGHT){ //if keycode is equal to right then....
      xPos = xPos + 20; //add 10 to x position everytime
      yPos = yPos - 3; //add 10 to x position everytime 
    }
      else if(keyCode == LEFT){ //or if keycode is equal to left then....
        xPos = xPos - 20; //minus 10 to x position everytime
        yPos = yPos - 3; //minus 10 to x position everytime 
      }
      else if(keyCode == DOWN){ //or if keycode is equal to down then....
        yPos = yPos + 3; //add 3 to y position everytime
      }
      else if(keyCode == UP){ //or if keycode is equal to up then....
        yPos = yPos - 3; //minus 3 to y position everytime
      }
  }
}
  
  
void mousePressed(){
  if(currentPage == 0 && mouseX >20 && mouseX < 633 && mouseY > 293 && mouseY < 593 ){ //if current page is 0 then you can click on the olympicstart area
    currentPage = 1; //go to page 1 
  }
  if(currentPage == 0 && mouseX >570 && mouseX <610 && mouseY >760 && mouseY <800){ // if the current page is 0 then you can click on the imfo button area
    currentPage = 3; //go to page 3 
  }
    else if(currentPage == 3 && mouseX >570 && mouseX <610 && mouseY >760 && mouseY <800){ //if the current page is 3 then you can click on the imfo button area
      currentPage = 0; //go to page 0 
    }  
    else if(currentPage == 1 && mouseX >570 && mouseX <610 && mouseY >760 && mouseY <800){ //if the current page is 1 then you can click on the imfo button area
      fill(255); //set to white 
      currentPage = 3; //go to page 3 
    }
    else if(currentPage == 1 && mouseX >10 && mouseX <210 && mouseY >10 && mouseY <175){ //if the current page is 1 then you can click on the imfo button area
       restartPage = true;
    }
}  




