
//Rainbow by James Ye
// 9/17/10
void setup() {
  size (1000,1000);
  background(0);
  noStroke();
}

void draw() {

  fill(0,0);
  ellipse(mouseX,mouseY,50,50);
  fill(random(0,255),random(0,255),random(0,255),30);
  ellipse(mouseX,random(0,1000),50,50);
  
  
  if (mousePressed && (mouseButton == LEFT)) {
     fill(random(0,255),random(0,255),random(0,255));
     ellipse(mouseX,mouseY,50,50); }
   else if(mouseButton == RIGHT) {
     fill(0);
     ellipse(mouseX,mouseY,100,100);} 
  else{
     fill(0,0);
     ellipse(mouseX,mouseY,50,50);
    
 }
}


