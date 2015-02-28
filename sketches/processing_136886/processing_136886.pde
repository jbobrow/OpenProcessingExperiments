
//I want creat a intelligent object that can move by themselv and change directions
//What I want to express is the course of life..Which you start from somewhere and
//you end at the place you don't know..also, you life begin with blank white, and end
//with messy colors and your footprints...
//you can click to set another beginning.....

int a=400;
int b=300;
int i=1;
int j=1;
int moving1=5;
int moving2=5;

void setup(){
 size(800,600);
 colorMode(HSB,width,height,100);
 background(width,0,100); 
 noFill();
  
}


void draw(){ 
///press the mouse to set another beginning 
if (mousePressed == true){
//  noLoop();
  a=mouseX;
  b=mouseY;
}

//drawing the basic shapes
 stroke(a,b,random(50,80),30);
 rect(0,0,a,b);
 rect(0,b,a,height);
 rect(a,0,width,b); 
 rect(a,b,width,height); 
 stroke(a,b,random(50,80));
 ellipse(a,b,random(40,50),random(40,50));
 
//make the circle moving
  a=a+i*moving1;
  b=b+j*moving2;
  
//make the circle bouncing 
  if (a>=width || a<=5){i=-1*i; moving1=int(random(5,9));
  } else if (b>=height || b<=5) {j=-1*j;moving2=int(random(5,10));
}
}

//press Delete or Backspace to clean the drawings
void keyReleased( ){
  if(key==DELETE||key==BACKSPACE){
  background(width,0,100); 
}
}
