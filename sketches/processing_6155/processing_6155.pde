
int x;
int y;
PImage mypic;
PImage youpic;


void setup(){
  size(400,400);
 mypic= loadImage("1.jpg");
 youpic= loadImage("2.jpg");

}

void draw(){
background(255);
y=0;
while(y<400){
  x=0;
  while(x<400){
   
  tint(225,random(225),30,60);
  image (mypic,x,y);
  
  if (mousePressed){
     image (youpic,x,y);
     tint(random(255),random(225),random(225),random(225));
   }

    x=x+80;
  }
    y=y+80;
  }
}

