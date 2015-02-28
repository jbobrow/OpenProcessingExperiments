
float move=0;
float xbounce=random(5,20);
int stack=0;

void setup(){
  size(800,600);
  background(255);
  frameRate(8);
  
  
}

void draw(){
  background(0);
  
  move=move+xbounce;
  
   if (move >= 300){
     xbounce=xbounce*-1;
   }
   if( move <=0 ){
     xbounce=xbounce*-1;
   }

while(stack < width){
  fill(0,255,255,random(20,100));
  noStroke();
  rect(0+stack,600,random(10,100),random(-move));
  fill(255,255,0,random(50,100));
  rect(0+stack,0,random(10,100),random(move));
  stack=stack+20;
}
  
stack=0;
}


