
PImage fun;
PImage der;
PImage map;
int x1;
int y1;
int tri=255;
int tri2=255;
int tri3=255;
int tri4=255;
int count=0;
int speed=3;
float gix;
float giy;
int tag=3;


void setup(){
  size(800,800);
  x1=width/2;
  y1=height/2;
  gix=random(0,800);
  giy=random(0,400);
  map = loadImage("map.jpg");
  fun = loadImage("funghi.png");
}

void draw(){
  imageMode(CORNER);

if(count==0 && !mousePressed)
{
  tri=255;
  tri2=255;
  tri3=255;
  tri4=255;
}

count = (count + 1)%20;

  image(map,0,0,800,800);
  
  
  noStroke();
  fill(tri);
  triangle(400,515,448,601,350,601);
  fill(tri2);
  triangle(350,601,263,652,350,702);
  fill(tri3);
  triangle(350,702,400,790,448,702);
  fill(tri4);
  triangle(448,601,539,652,448,702);
  
  
  
  imageMode(CENTER);
  image(fun,x1,y1,100,100);
  
  if(mouseX>350 && mouseX<448 && mouseY>400 && mouseY<601)
  {
          if(mousePressed)
          {
            y1-=speed;
            tri=0;
          }
  }
  
    if(mouseX>263 && mouseX<350 && mouseY>601 && mouseY<702)
  {
          if(mousePressed)
          {
            x1-=speed;
            tri2=0;
          }
  }
  
    if(mouseX>448 && mouseX<652 && mouseY>601 && mouseY<702)
  {
          if(mousePressed)
          {
            x1+=speed;
            tri4=0;
          }
  }
  
    if(mouseX>350 && mouseX<448 && mouseY>702 && mouseY<790)
  {
          if(mousePressed)
          {
            y1+=speed;
            tri3=0;
          }
  }

}


