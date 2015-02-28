
void setup(){
  size(600,600);
  background(0);
  frameRate(4);
}

void draw (){
  noStroke();
  background(255,200,200);
  for (int i = 0; i < width ; i = i + 100){
  for (int j = 0; j < height ; j = j + 100){
  fill(255,random(0,255));
  rect(i+50,j+50,20,20);
  }
  }
  stroke(255,random(100,255));
  strokeWeight(random(0.1,1));
  for (int i = 0; i < width ; i = i + 100){
  for (int j = 0; j < height ; j = j + 100){
    line(mouseX,mouseY,i+60,j+60);
    }
  }
}
 void mousePressed() {
   background(random(200,255),random(200,255),random(200,255));
   fill(255);
   ellipse (mouseX,mouseY,100,100);
    fill(255,50);
   ellipse (mouseX,mouseY,150,150);
   ellipse (mouseX,mouseY,200,200);
   ellipse (mouseX,mouseY,250,250);
   ellipse (mouseX,mouseY,300,300);
   
 }
