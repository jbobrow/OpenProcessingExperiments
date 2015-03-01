

float diX;
float diY;
float rectX;
float rectY;
float step;
float colorM;
float colorY;
float colorZ;
float motion;

void setup(){
  
  size(500,500); // canvas size
  frameRate(60);
  
  
}


void draw(){

 
    
  background(255);
  
  colorM = map(mouseX, 0, width, 0.6, 0.7); //map mouse xy to color range
  colorY = map(mouseX, 0, height, 0.6, 0.7);
  colorZ = colorM + colorY;
  
  
  
  diX = 250 - mouseX;//distance from mouse to center
  diY = 250 - mouseY;
  
  if (diX < 0) {//make negative positive
    diX = -diX; } 
  if (diY < 0) {
    diY = -diY; } 
  
rectMode(CENTER);

for (float i = 2000; i > 0; i = i - 50) {//draw 40 squares
  
  step = i/200;//set how much more every square below moves
  
  if (mousePressed == true){ //press mouse to change distance
 
  
  //for (float motion = 0; motion < 10; motion +=  1) { 
  i = i - 100;
 // i = i - motion;
  println(motion);
  
}
  
  noStroke();
  fill(mouseX/2 + step*30, mouseY/2 + step*30, mouseX - mouseY/3 - step*30);
  
  if  (mouseX > 250) {//set rectX with step
    rectX = mouseX + diX * step;} else {
      rectX = mouseX - diX * step;}
  if  (mouseY > 250) {//set rectY with step
    rectY = mouseY + diY * step;} else {
      rectY = mouseY - diY * step;}
  rect(rectX, rectY, i, i);

}
}


