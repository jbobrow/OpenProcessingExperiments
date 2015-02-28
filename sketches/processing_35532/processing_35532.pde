
void setup(){
  size(300,300);
  
}

void draw(){
  background(0,200-mouseY,255-mouseY);
//sun
  noStroke();
  fill(255,255-mouseY,0);
  ellipse(width/3,mouseY,30,30);
//moon 
  fill(170);
  ellipse(width*2/3,height-mouseY,20,20);
//grass  
  fill(0,130-mouseY/2,20);
  rect(0,height*2/3,width,height*2/3);
 //house 
  fill(255-mouseY,0,0);
  rect(width/2,height*2/3-80,80,80);
 //roof 
  fill(0,0,0);
  triangle (190,90, 130,120, 250,120);
 //door 
  fill(255,255,255-mouseY);
  rect(width/2+20,height*2/3-60,40,60);
 //shadow 
  fill(0,100-mouseY/2,0);
  quad(width/2,height*2/3,width/2+80,height*2/3,width,height,width-80,height);
}

