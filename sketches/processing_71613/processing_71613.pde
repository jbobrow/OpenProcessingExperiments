
PImage img;
PImage img2;




int value =0;






void setup() {

  size(1024,729);

  img = loadImage("Pollock.jpg");  
  img2 =loadImage("Capture.jpg");
}



void draw() {
float a;
a=5.55555;
float b;
b=3.4;
float c;
c=4.3;
float d;
d=7.2;
float e;
e=1.1;
float f;
f=9;
float g;
g=10;
float h;
h=3.4;
float i;
i=2.3;
float j;
j=1.7;


  if (mousePressed && (mouseButton == LEFT)) {
    
    img = loadImage("glitch.jpg"); 
  } 
  
  if(mousePressed && (mouseButton == RIGHT)) {
    img = loadImage("Pollock.jpg");
  }
  
  

////////////////////  
image(img, 0, 0);
  
  
  
  
  }  
void mouseDragged() 
{
  value = value + 20;
  if (value > 255) {
    value = 0;
  if (mousePressed && (mouseButton == LEFT)) {
    background(255);
    fill(0);  
    noStroke();
    ellipse(40,40,500,500);
    ellipse(800,40,500,500);
    ellipse(650,300,250,250);
    fill(255);
    ellipse(650,300,150,150);
}
}

}


