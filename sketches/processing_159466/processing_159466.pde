
int startX=0; 
int startZ=0;
float xspeed=1;
int x;


void setup(){

size(700,250);
frameRate(50);
smooth();
}

void draw(){
// draw background; black and white strips
if(keyCode == UP){
background(255);
}
  
else {
  for(int y =0; y<700; y+=24){
  noStroke();
  fill(255);
  rect(y+12,0,12,height);
fill(0); 
rect(y,0,12,height);
}
}

//move rects
move();
rects();

}

void move(){
x+=xspeed; //increment x

//check if hit sides;
if(x>width-50 || x<0){
xspeed *= -1;
}
}

void rects(){
  noStroke();
  
  //yellow rect
  fill(251,251,0);
rect(x,50,50,25);
  
  //blue rect
  fill(0,0,160);
rect(x,150,50,25);
  
}


