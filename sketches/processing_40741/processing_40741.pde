
void setup() {
  size(400,400);
  background(255);
  smooth();
}

void draw() {
 
  noStroke();
  fill(255,160);
  rect(0,0, width, height);
  
  if(mousePressed){ 
    fill(0);
    rect(0,0,width,height);
    
    noFill();
    strokeWeight(3);
    stroke(255);
    line(mouseX-18,mouseY-15,mouseX-5,mouseY-20);
    line(mouseX+18,mouseY-15,mouseX+5,mouseY-20);
    //bocca
    line(mouseX-10,mouseY+21,mouseX-5,mouseY+26);
    line(mouseX-5,mouseY+26,mouseX,mouseY+21);
    line(mouseX,mouseY+21,mouseX+5,mouseY+26);
    line(mouseX+5,mouseY+26,mouseX+10,mouseY+21);
    //ellipse(100,100,mouseX,50);
    rect(mouseX/2-10,mouseY-150,100,100);
 
}
  fill(0);
  ellipse(mouseX-10, mouseY-5, 10, 10);
    ellipse(mouseX+10, mouseY-5, 10, 10);
    noFill();
    stroke(0);
    strokeWeight(2);
    ellipse(mouseX, mouseY, 60, 60);
    arc(mouseX, mouseY+10, 25, 15, 0, PI);
    rect(mouseX/2,mouseY-100,30,30);
    //line(mouseX-100,mouseY-75,mouseX-90,mouseY-80);
    
}



