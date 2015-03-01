

//scoNow=1;//Why???????don't scoNow++;

PImage fun;
PImage map;

PFont sco;

int x1;
int y1;
int tri=255;
int tri2=255;
int tri3=255;
int tri4=255;

int count=0;

float gix;
float giy;
//for test
int gifixX;
int gifixY;
//
int tag=1;


int scoNow=0;
int speed=3;

////////////////////////////////////////////

void setup(){
  size(800,800);
  x1=width/2;
  y1=height/2;

//test  
  gifixX=150;
  gifixY=150;
  
  gix=random(0,800);
  giy=random(0,400);
  map = loadImage("map.jpg");
  fun = loadImage("funghi.png");
  sco = loadFont("AppleBraille-Pinpoint6Dot-48.vlw");
}

//////////////////////////////////////////////

void draw(){
  //reset imagemode
 imageMode(CORNER); 
 
//time to recover the buttom
if(count==0 && !mousePressed)
{
  tri=255;
  tri2=255;
  tri3=255;
  tri4=255;
}
count = (count + 1)%20;

//print map
  image(map,0,0,800,800);

//score print  
  fill(255);
  textFont(sco,50);
  textAlign(LEFT,TOP);
  text("Score:"+scoNow,5,5);
  
  
//nav print  
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
  
 //funghi print 
  image(fun,x1,y1,100,100);
  nav();
  
  //eat other funghi
  eat();
  

}




void nav(){
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


void eat(){
    if(y1>gifixY-50 && y1<gifixY+50 && x1>gifixX-50 && x1<gifixY+50)
    {
      scoNow=1;//Why???????don't scoNow++;
    }
 //other funghi
  
//  for(int num=0;num<tag;num++)
//  {
    //println("HI"+num);
  
//      gix=x1+random(-200,200);
//      giy=y1+random(-200,200);
      if(tag!=scoNow)
      {
        image(fun,gifixX,gifixY,100,100);
      }
      
//  }
}


