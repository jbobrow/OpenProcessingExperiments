
//function
void setup(){
  background(255);
  noStroke();
  smooth();
  size(500,500);
//frameRate(10);
for(int i=0; i<4; i++){
  
  drawCircles();
 
}
}

void draw(){
  rect(mouseX,mouseY,500,500);
  for(int i=0; i<2; i++){
    drawCircles();
    
}
}
void drawCircles(){
fill(random(255),random(255),random(255),random(255));
ellipse(200,100,random(10,100),random(10,100));
ellipse(300,100,random(10,100),random(10,100));
ellipse(250,250,random(300,100),random(10,100));


    
  }

