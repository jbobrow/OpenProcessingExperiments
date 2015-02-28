
PImage img;
int y;
int mouse_Pressed = 0;
float alp = 0;
float colour =255;
int transparency =80;
int maxDistance=150;
float offset = 0;
float easing = 0.05;

void setup() {
  size(600, 600, P3D);
  img = loadImage("hsp.jpg");
  background(img);
  noStroke();
}

void draw() {
  background(img);
  
  image(img, 0, 0); 
  float dx = (mouseX-img.width/2) - offset;
  offset += dx * easing; 
  tint(255, 126);  
  image(img, offset, 0);


 

  String s = "Sorry I didn't finish my homework yesterday:P";
  fill(255);
  textSize(26); 
  text(s, 10, 300, 700, 980);  
  noFill();
  stroke (155);
  

  for (int gridY=0; gridY<height; gridY=gridY+25) {
  for (int gridX=0; gridX<width; gridX=gridX+25) {

      float diameter;

      PVector mousePos;

      mousePos = new PVector (mouseX, mouseY);

      PVector shapePos;

      shapePos = new PVector(gridX, gridY);
      diameter = dist(mousePos.x, mousePos.y, shapePos.x, shapePos.y);
      diameter = diameter*40/maxDistance;
      pushMatrix();

      
      translate(gridX, gridY, 0);

      
      ellipse (0, 0, diameter, diameter);
      
      popMatrix();
  }
      
    }
   
  }


void mousePressed() {
  mouse_Pressed =mouse_Pressed+1;
}



