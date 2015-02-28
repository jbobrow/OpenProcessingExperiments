
//Mark Pineda ULTISPHERE.

Ultisphere B;
fnt A;


void setup()
{
  size(600,600,P3D);
  smooth();
  fill(0);
  /*void f()
 { PFont font;
  font = loadFont("ComicSansMS-15.vlw");
  textFont(font);
  text("Click mouse to reset size!",100,100);} */ 
  B = new Ultisphere();
  B.x = 300;
  B.y = 300;
  B.z = 2;
  B.r = 30;
  B.c1 = 255;
  B.frate = 30;
  
  A = new fnt();
  
  
  
}

void draw()
{
  
  background(160,153,94);
  //stroke(255);
  //fill(0);  
 // rect(0,0, 600,600);
  B.show();
  B.progress();
  println(B.z);
  
  if(mousePressed == true)
  {
    B.x = 300;
    B.y = 300;
    B.z = 2;
    B.x = pmouseX+5;
    B.y = pmouseY+5;
    B.c1 = round(random(255));
    B.c2 = round(random(255));
    B.c3 = round(random(255));  
    background(round(random(255,255))); 
  }
  A.f();
  
  if(B.x == 0)
  {
    B.x = 600;
    B.y = 0;
  }
  if(B.y == 600)
  {
    B.y = 0;
    B.x = 0;
  }
  if(B.z > 450)
  {
    B.z = 50;
  }
  
  //text("Click mouse to reset size!",100,100);
}

class Ultisphere 
{
  float sp; //speed
  float r; //radius
  int x,y; // leftright, updown, forawrd/back
  int c1,c2,c3; // color
  float z;
  float frate; //frame rate
  
  void show()
  {
    fill(c1,c2,c3);
    noStroke();
    lights();
    translate(x,y,z);
    sphere(r);
  }
  
  void progress()
  {
    frameRate(frate);
    pushMatrix();
    rotateX(x);
    rotateY(y);
    rotateZ(z);
    x = pmouseX+round(random(2,-2)); 
    y = pmouseY+round(random(3,-3));
    z = z + random(2,5);
    popMatrix();
  }
}

class fnt
{
   void f()
 {  
  text("Click mouse to reset size and change color!",-100,-60);} 
}


    
  

