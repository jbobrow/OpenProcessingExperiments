
int yPos = 5;
int spe = 5; // spe = speed
boolean direction = true; // true = going down, false = going up

void setup(){
  size(600,600);
  background(25, 193, 23);
  fill(255);
  line(0, height/2, width, height/2); // tried to make tennis court
}
void draw(){
  frameRate(100);
  background(25, 193, 23);
  fill(255);
  line(0, height/2, width, height/2);
  fill(239, 255, 31);
  noStroke();
  ellipse(height/2, yPos, 50, 50);

if  (direction == true && yPos >= 5) {
  yPos +=spe; 
}
  if (yPos >= height){
   direction = false; }
   
   if (direction == false && yPos <= height){
     yPos -=spe;}
     
     if (yPos <= 5){
    direction = true;
  }
}


