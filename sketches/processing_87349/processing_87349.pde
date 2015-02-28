
int posX = 50;
int dirX = 0;
int RED = 150;
int GREEN = 60;
int BLUE = 20;
int ellipseSize = 20;
//global variables//
//variables are handy because code using same number can use a variable, if needing changed at later stage need only change the variable instead of search code//

//set up is run only once//
//fucntions run a set of commands associated with it, identified by {}//

void setup(){
  size (600, 400);
  background(RED, GREEN, BLUE);
}

void draw(){
  background(RED, GREEN, BLUE);
  //refreshes background each loop//
  println(mouseX + " " + mouseY);
  //USED TO CHECK IF PROGRAM RUNNING CORRECCTLY. ALSO USING MOUSE X,Y TRACKS PIXEL LOCATION OF MOUSE CURSOR// 
  //fill(40);//
  noStroke();
rect(50, 100, 65, 300);
animator();
ellipse(posX, mouseX, ellipseSize, ellipseSize);

//first 2 numbers refer to the start location on xy axis//
//fill can be rgb or hex values or a single gradient and must come before the doe shape to be filled//
//can use variables to determine H an W.//

strokeWeight(6);
stroke(255, 150, 200); //4th value = transparency//
line(40, 50, 260, 500);

if(mouseY < width/2 && mouseY < height/2){
  fill(255,0,0,50);
}else if(mouseX > width/2 && mouseY < height/2){
  fill(0,255,0);
}
else if(mouseX < width/2 && mouseY > height/2){
  fill(50,50,50);
}
else if(mouseX > width/2 && mouseY > height/2){
  fill(30,30,30);
}
}

void animator() {
  if (posX >= width-ellipseSize/2) { //does not switch the direction of the ellipse. something else needed?//
    dirX = 1;
  }
  if (posX <= ellipseSize/2) {
    dirX = 0;
  }
  if (dirX == 1) {
    posX = posX - 5;
  }
  else {
    posX = posX + 5;
  }
}
//open animation//

//if position of X is greater than or equal to the width minus half the size of ellipse then the direction of X equals 1//
//if the position of X is less or equal to half the size of elipse direction of X equals 0//
//if direction of X equals 1 then position of X equals the X postion minus 5//
//else then the position of X equals position of X plus 5//
