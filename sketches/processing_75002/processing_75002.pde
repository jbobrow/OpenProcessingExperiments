
PImage img;

float[] xPos = new float[200];
float[] yPos = new float[200];
float[] speed = new float[200];


void setup(){
  size(500, 500);
  img = loadImage("kucice.jpg");
   
   for(int i = 0; i <xPos.length; i = i + 1){
    xPos[i] = random(width);
    yPos[i] = random(height);
    speed[i] = random(0.3);

}
  
  
}
void draw(){

  background(250, 235, 177);
 
  image(img, 0, 350);
  
   //sun
   fill(255, 205, 3);
  ellipse(mouseX, mouseY, 50, 50);
  
  //moon
  if(mousePressed){
    background(0);
    fill(255);
    ellipse(mouseX, mouseY, 50, 50);
    
    for(int i = 0; i <xPos.length; i = i + 1){
  ellipse(xPos[i], yPos[i], 5, 5);
 
 xPos[i] = xPos[i] + speed[i];
    }
      
  }
  
  
}


