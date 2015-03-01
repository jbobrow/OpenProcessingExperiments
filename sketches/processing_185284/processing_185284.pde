
int x,y;
float xIntheBox;
float yIntheBox;
float cR,cG,cB;

void setup(){ 
 size (640,480); 
}

void draw (){ //updated every frame
  background(255);

  noFill();
  rect(144,108,216,150);
 
  //map(value, start1,stop1, start2, stop2)
  x = mouseX;
  y = mouseY;
  
  xIntheBox = map(x, 0,639, 154,350);
  yIntheBox = map(y,0,479, 118, 108+140); 
  
  fill(cR,cG,cB);
  ellipse(xIntheBox,yIntheBox, 20,20);
  
}

//event function 
void mousePressed(){
    cR = random(255);
    cG = random(255);
    cB = random(255);
    
}
