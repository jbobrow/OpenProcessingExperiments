
PImage baby;
float x,y,directionX,directionY;
float easing;
float dx;
float dy;

void setup(){
  size(600,600);
  smooth();
  directionX = 2;
  directionY = 5;
  x = 0;
  y = 400;

  baby = loadImage("baby_face.jpg");

}
  
void draw(){
  stroke(255);
  background(0);
    image(baby,x,y); 
   x+= directionX;
   y+= directionY;


  if(y > height){ // bounce on walls, used to add speed, possibly spin
  // use multiplication so with each addition there is more increase
   directionY = -directionY*2;}
     
   if(x > width){
   directionX = -directionX*2;}
   
   if(y < 0){
   directionY = -directionY*1.5;}

   if(x < 0){
   directionX = directionX*1.5;}

}

void mousePressed(){
  directionX = mouseX - x;
  directionY = mouseY - y;
  x = x + dx * easing;
  y = y + dy * easing;
  image(baby,x,y);  
}


