
void setup(){
  size(screen.width,screen.height);
  background(255);
  smooth();
}

void draw (){
str(true);
  float x= random (width);
  float y= random (height);
  stroke(mouseX);
  strokeWeight(3);
  fill(90);
  float t= noise(10,212);
  float alfa= random(212,237);
 stroke(mouseY);  
  strokeWeight(2);   
  float z = random(width);  
  float r = random(height);  
  float g = random (15,45); 
  float b= random (20,30);
  fill(r,g,alfa);
  ellipse(x, y, second(), second());
  
str (false); 
 rect (x, y, millis()%20, millis()%30);  
lineas(mouseX,mouseY);
}

void lineas(float x,float y ) {
 fill(185);
 stroke(12);
 pushMatrix();
  {
    translate(x,y);
 line(20,x,50,y);       //lineas k cubren figuras al mover el mouse
   popMatrix();
}}

//sensacion de achurado sobre las manchas de pintura

