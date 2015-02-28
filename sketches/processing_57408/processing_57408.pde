
int x=150;
PImage polkadots; 
int speed = 1;
 
 
void setup() {
  size(800, 300);
  smooth();
  strokeWeight(1);
  //background(255, 204, 0); //background colour
  polkadots = loadImage("polka.jpg");
  
}
void draw()
{
 
  if (keyPressed) {
    x=x+speed;
  }
 
  if (x>width) {
    x=0;
  }
 


  background(255, 204, 0); //background colour
  image(polkadots,0,0);
  
  
  //HEAD

 
 if (x<width/2){
   
  stroke(0);
  fill(0);
  arc(x, 117, 75, 75, 0.6, 6); 
  strokeWeight(3);
  stroke(255, 255, 255);
  line(x-5, 105, x+2, 100);
 }
 
 if (x>width/2){
  speed = speed+1; 
   
  stroke(255);
  fill(255);
  arc(x, 117, 75, 75, 0.6, 6); 
  strokeWeight(3);
  stroke(0);
  ellipse(x-5,105,15,15);
  
 }
 
 
  //NECK
  strokeWeight(2);
  fill(205, 205, 193);
  rect(x-10, 160, 20, 5); //(x,y, width, height)
  rect(x-10, 170, 20, 5);
  rect(x-10, 180, 20, 5);
 
  strokeWeight(3);
  stroke(255, 255, 255);
  //BODY
  fill(0);
  triangle(x-75, 190, x, 255, x+75, 190);
 
 
 
  //WHEELS
  strokeWeight(2); //stroke thickness
  ellipse(x-15, 260, 17, 17);
  ellipse(x+15, 260, 17, 17);
 
 
 
  //ARMS
  line(x+66, 200, x+110, 210);
  line(x+62, 205, x+107, 215);
  line(x+111, 212,x+114, 180);
  line(x+114, 212, x+117, 180);
  fill(255, 153, 18);
  ellipse(x+112, 212, 10, 10);
  ellipse(x+115, 180, 11, 11);
 
  line(x-64, 202, x-106, 220);
  line(x-61, 207, x-104, 225);
  line(x-105, 223, x-90, 245);
  line(x-108, 223, x-93, 245);
  fill(255, 153, 18);
  ellipse(x-90, 250, 11, 11);
  ellipse(x-105, 223, 10, 10);
 
  stroke(200, 10, 10);
 
  if (mousePressed) {
    line(x+115, 180, mouseX, mouseY);
    float mx = mouseX/2;
    line(x+115, 180, mx, mouseY);
    
  }
}


