
void setup() {
  size(400, 400);
  smooth();
}
 
void draw() {
 
  fill(0, 20);
  noStroke();
  rect(0, 0, width, height);
 if(mousePressed){
   frameRate(30);
   
 fill(250);
    ellipse(mouseX,300,50,50);
    ellipse(mouseX/2,300,50,50);
    ellipse(mouseX/3,300,50,50);
    ellipse(mouseX/6,300,50,50);
    
     ellipse(300,mouseY,50,50);
    ellipse(300,mouseY/2,50,50);
    ellipse(300,mouseY/6,50,50);
  }else{
    frameRate(10);
     stroke(255,210,0);
  ellipse(200, 200, mouseX, mouseX);
}
}
