
PImage ed01;
PImage ed02;
PImage st01;
PImage st02;
PImage main;
//face
PImage body;
//image load

void setup() { 
  size (600,600);
  noStroke(); 
  smooth();
  ed01 = loadImage ("2.png");
  ed02 = loadImage ("1.png");
  st01 = loadImage ("3.png");   
  st02 = loadImage ("open1.PNG");
  main = loadImage ("main.PNG"); 
  body = loadImage ("phone.png");
} 


void draw() {
  ip(100,100,1,0,1,1,0);
  ip(100,400,1,0,1,2,0);
  ip(400,100,1,0,1,3,0);
  ip(400,400,1,0,1,4,0);
}

//class ip
void ip (int ipX,int ipY, float s,float r,int c, int face, float fr)
{
  pushMatrix();
  translate(ipX,ipY);
  scale(s);
  rotate(radians(r));
  fill(c,50,0);
  smooth();
  beginShape();
  image(body,0,0,100,150);
  if(face==1)
  {
    image(ed01,15,25,70,100);
  }
  else if(face==2) 
  {
    image(ed02,15,25,70,100);
  }
  else if(face==3)
  {
    image(st01,15,25,70,100);
  }
  else if(face==4)
  {
    image(st02,15,25,70,100);
  }
  endShape();
  popMatrix();
}


