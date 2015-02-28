
void setup(){
  size(500,300);
  frameRate(24);
}

void draw(){
  background(13,mouseY,113);
  fill(44,144,34);
  
  beginShape();
  vertex(50,290);
  vertex(450,290);
  vertex(250,10);
  endShape();
  
  
  fill(mouseX,44,670);
  beginShape();
  vertex(250,250);
  vertex(300,125);
  vertex(200,125);
  vertex(250,250);
  endShape();
  
  fill(218,18,18);
   beginShape();
  vertex(425,20);
  vertex(470,40);
  vertex(470,80);
  vertex(425,100);
  vertex(380,80);
  vertex(380,40);
  vertex(425,20);
   endShape();
   
    fill(218,18,18);
   beginShape();
  vertex(70,20);
  vertex(110,40);
  vertex(110,80);
  vertex(70,100);
  vertex(30,80);
  vertex(30,40);
  vertex(70,20);
   endShape();
}


