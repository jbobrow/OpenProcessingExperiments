
int x;
int y;
float xIntheBox;
float yIntheBox;
float cR,cG,cB;

void setup(){
size(640,480); 
  
}

void draw(){
 background(190);
 fill(255,255,255);
 //map(value, start1,stop1,start2,stop2,);
 x = mouseX;
 y = mouseY;
 xIntheBox = map(x, 0, 639, 144, 360);  
 yIntheBox = map(y, 0, 479, 150, 108+150);
 //println(frameRate);
 
 fill(255,0,0);
 rect(144,108,216,150); 
 ellipse(xIntheBox,yIntheBox,20,20);
}

// mouseX and mouseY to follow mouse.


void mousePressed(){
 background(255,255,0);
 cR = random(255);
 cB = random(255);
 cG = random(255);
 fill(cR,cB,cG);
 ellipse(xIntheBox,yIntheBox,20,20);
}
