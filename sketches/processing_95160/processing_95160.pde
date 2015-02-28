
int ke;
int eye;
 
float r = 100;
float g = 150;
float b = 200;
float a = 150;
  
float diam = 500;
float x = 250;
float y = 250; 
 
void setup () {
  frameRate (24);
  size (500,500);
  smooth ();
}
 
 
void draw () {
background(0);
stroke(0);
fill(r, g, b, a);
//rect(x, y, diam, diam);
x = int(random(250, 250));
y = int(random(250, 250));
r = int(random(0, 255));
g = int(random(0, 255));
b = int(random(0, 255));
diam = int(random(2, 500));
stroke(255);
 
  //body
  //background (255);
  fill (255,145,21);
  ellipse (CENTER);
  ellipse (ke, mouseY,110,110,7);
   
  //head
  fill (255);
  ellipseMode (CENTER);
  ellipse (ke, mouseY-50,60,60);
  
  //nose
  fill(0);
  ellipseMode (CENTER);
  ellipse (ke, mouseY-40,8,8); 
   
   //eyes
  fill (0);
  ellipse (ke-30, mouseY-50,eye,eye+10);
  ellipse (ke+30, mouseY-50,eye,eye+10);
  ellipse (ke-30, mouseY-50,eye-5,eye-5);
  ellipse (ke+30, mouseY-50,eye-5,eye-5);
  
  //mouth
  fill (r,120,120);
  ellipse (ke, mouseY-30,10,15);
   
//eyes
  ellipse (ke-28, mouseY-50,20,20);
  ellipse (ke+28,mouseY-50,20,20);
   
  //ears
  fill (175);
  ellipse (ke-45, mouseY,25,15);
  ellipse (ke+45, mouseY,25,15);
   
 // line (ke-30, mouseY-75,ke-45, mouseY-90);
 // line (ke+30, mouseY-75,ke+45, mouseY-90);
   
  //legs
  //line (ke-19, mouseY+16,ke-30,mouseY+30);
 // line (ke+19,mouseY+16,ke+30, mouseY+30);
 
 //feet  
 ellipse (ke-40, mouseY+40,32,32);
  ellipse (ke+40, mouseY+40,32,32);
 
 
 //hat
 fill(255,145,21);
 triangle (ke+35, mouseY-75,ke-35,mouseY-75,ke, mouseY-90);
   
 
ke++;
}
 
void mousePressed() {
  eye = int(random(20, 50));
}




