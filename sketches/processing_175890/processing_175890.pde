

void setup(){
  size( 300,300);
  background (255);
  frameRate (10);
}

int x=10;
int y=10;
int a=300;
int b=300;
int fix=1;
void draw (){
  strokeWeight (1);
 background (0);
fill(255,255,52);
ellipse (x,150,random (50), 50);
 x=x+10;
if (x>300){
 x=10;
}
 fill(150,163,85);
 ellipse (150,b,random (50),50);
b=b-10;
  if (b< 10){
  b=300;
  }
fill(255,155,152);
ellipse (150,y,random (50), 50);
 y=y+10;
if (y>300){
 y=0;
}
 fill(100,132,285);
 ellipse (a,150,random (50), 50);
a=a-10;
  if (a<10){
  a=300;
  }
}  

  void keyPressed (){
    if ( key== 's'){
    frameRate ( fix+5 ); 
  } else if ( key=='f'){
    frameRate ( fix-5);
  }
}

