
PImage a;
PImage b;
PImage c;
PImage d;

void setup() {
  size(640, 480);
  smooth();
 
  
  a = loadImage("eyes.png");
  b = loadImage("eyes2.png");
  c= loadImage ("smile1.png");
  d = loadImage("star.png");
 
}

  void draw (){
    background (255);
  
    smooth ();
    
    eye(240,210,45,50);
    

}
void eye( float posX, float posY, int x, int y) {
float d1 = dist(posX, posY, 15, 15);
float mx = constrain(mouseX, posX - 15, posX + 15);
float my = constrain(mouseY, posY - 15, posY + 15);
fill(255);

ellipse(posX, posY, x * 2 - 10, y * 2 - 10);
fill(0, 174, 239);
ellipse(mx, my, x, y);
fill(0);
stroke(10, 100, 205);
ellipse(mx, my, x/2, y/2);
fill(255, 90);
noStroke();
ellipse(mx - (x/4), my - (y/4), x/3, y/3);

eye2(380,210,45,50);
    

}
void eye2( float posX, float posY, int x, int y) {
float d1 = dist(posX, posY, 15, 15);
float mx = constrain(mouseX, posX - 15, posX + 15);
float my = constrain(mouseY, posY - 15, posY + 15);
fill(255);

ellipse(posX, posY, x * 2 - 10, y * 2 - 10);
fill(0, 174, 239);
ellipse(mx, my, x, y);
fill(0);
stroke(10, 100, 205);
ellipse(mx, my, x/2, y/2);
fill(255, 90);
noStroke();
ellipse(mx - (x/4), my - (y/4), x/3, y/3);


PImage d;
  d= loadImage ("star.png");
  image (d,mouseX, mouseY);

  PImage a;
  a= loadImage ("eyes.png");
  image (a, 173, 90);
  
  PImage c;
  c= loadImage ("smile1.png");
  image (c, 190, 300);
  
   stroke (0);
    strokeWeight (10);
  ellipse(240,200,90,120);
  
   stroke (0);
   strokeWeight (10);
  ellipse(380,200,90,120);
  
  strokeWeight (1);
  stroke (255);
  
  
  if(mousePressed) {
   
    
    //left blink
    stroke (0);
    strokeWeight (10);
    fill (0);
    ellipse(240,200,90,120);
   
    //right blink
    stroke (0);
    strokeWeight (10);
    fill (0);
    ellipse(380,200,90,120);
    
   
 
 
 
}
  
  }


