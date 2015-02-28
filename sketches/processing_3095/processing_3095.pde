
void setup(){
  size(500,500);
  stroke(100);
  smooth();
  
   background(0);
  colorMode(RGB,70,20,100);

}

void draw(){
  
float x= random (height);
float y= random (height);

fill(y,y-100,250,20); 
  rect(x,y,10-second(),millis()*2);

}

void mousePressed(){
background (0);

}
void keyPressed(){
  saveFrame("palomaperez.jpg");
  println("fotgrama grabado");
  
}
  

