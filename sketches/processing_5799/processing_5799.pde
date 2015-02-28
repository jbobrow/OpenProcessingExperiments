
PShape bite1, bite2, bite3, bite4, bite5, bite6, bite7, bite8;
PShape base1, sprinkles;

PImage mouth;

float x, y;

void setup(){
  size(480, 320);
  background(104);
  smooth();
  
  //load bitten shapes
  bite1 = loadShape("bite1.svg");
  bite2 = loadShape("bite2.svg");
  bite3 = loadShape("bite3.svg");
  bite4 = loadShape("bite4.svg");
  bite5 = loadShape("bite5.svg");
  bite6 = loadShape("bite6.svg");
  bite7 = loadShape("bite7.svg");
  bite8 = loadShape("bite8.svg");
  base1 = loadShape("base1.svg");
  sprinkles = loadShape("sprinkles1.svg");
  //load bg
  mouth = loadImage("mouth.png");
}//end setup

void draw(){
  background(204);
  mouth1(0,0); //function for mouth, serves as background

  if (mouseX > width/2){ //bitten donut
    bites();
  }
  else {
    regular(); //fatty donut
  }

}//end draw


//function for fading mouth bg
void mouth1(int x, int y) { 

float fade = map(mouseX, 0, 480, 10, 255);
 tint(fade); 
 image(mouth, x, y);
}//end mouth

//function for bitten donut 
void bites() {
float move = random(-2, 2);
if ( (mouseX > width/2) && (mouseX < 270)){
shape(bite1, width/2+move, height/2);
shapeMode(CENTER); }

else if ( (mouseX > 270) && (mouseX < 300)){
shape(bite2, width/2+move, height/2);
shapeMode(CENTER); }

else if ( (mouseX > 300) && (mouseX < 330)){
shape(bite3, width/2+move, height/2);
shapeMode(CENTER); }

else if ( (mouseX > 330) && (mouseX < 360)){
shape(bite4, width/2+move, height/2);
shapeMode(CENTER); }

else if ( (mouseX > 360) && (mouseX < 390)){
shape(bite5, width/2+move, height/2);
shapeMode(CENTER); }

else if ( (mouseX > 390) && (mouseX < 420)){
shape(bite6, width/2+move, height/2);
shapeMode(CENTER); }

else if ( (mouseX > 420) && (mouseX < 450)){
shape(bite7, width/2+move, height/2);
shapeMode(CENTER); }


else if (mouseX > 450){
shape(bite8, width/2+move, height/2);
shapeMode(CENTER); }

}//end bite

//function for regular donut
void regular() {
float move = random(-2, 2);
//float sizing = map(mouseX, 0, 240, 800, 400);
float sizing = map(mouseX, 0, 240, 2.0, 1.0); //2.0 to 1.0 is the scale

//shape(base1, width/2, height/2, sizing, sizing);
shape(base1, width/2, height/2, base1.width*sizing, base1.height*sizing); 
shapeMode(CENTER);

////when cursor is @ lower half of screen, sprinkles move
if (mouseY > height/2) {
shape(sprinkles, width/2+move, height/2 + move, sprinkles.width*sizing, sprinkles.height*sizing); 
shapeMode(CENTER);}
else {
shape(sprinkles, width/2, height/2, sprinkles.width*sizing, sprinkles.height*sizing); 
shapeMode(CENTER);}

}//end regular



  
  

