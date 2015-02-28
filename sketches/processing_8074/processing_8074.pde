
color ink = color (0,0,0);


void setup (){
  size(500,500); 
background (255,255,255);
  frameRate (1200);
  fill(255,0,0);
  rect(0,0,30,30);
  fill(0);
  rect (0,30,30,30);
  fill(0,255,0);
  rect(0,60,30,30);
  fill(0,0,255);
  rect(0,90,30,30);
  fill(255,255,0);
  rect(0,120,30,30);
  fill(255,0,255);
  rect(0,150,30,30);
  fill(255,200,0);
  rect(0,180,30,30);
  fill(100,100,0);
  rect(0,210,30,30);
  fill(100,100,100);
  rect(0,240,30,30);
  fill(100,0,100);
  rect(0,270,30,30);
  fill(255,120,50);
  rect(0,300,30,30);
  fill(255,255,255);
  rect(10,310,10,10);
  fill(255,170,115);
  rect(0,330,30,30);
  
}
void draw (){

}
void mouseDragged(){
  
  fill (ink);
  stroke(ink);
  if (mouseX > 30) {
    ellipse(mouseX + 10,mouseY,15,15);
  }
}

void mouseClicked(){
 
  if(mouseX <30){
    ink = get(mouseX,mouseY);
  }
  if(mouseButton == RIGHT && mouseX < 30){
    
  }
}
 


