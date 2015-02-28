
int RED = 150;
int GREEN = 60;
int BLUE = 20;
int elipseSzie = 20;
//global variables//
//variables are handy because code using same number can use a variable, if needing changed at later stage need only change the variable instead of search code//

//set up is run only once//
//fucntions run a set of commands associated with it, identified by {}//

void setup(){
  size (300,600);
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
ellipse(50, 200, 40, 50);

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
}
