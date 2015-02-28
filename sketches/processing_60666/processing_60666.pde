
int x = 50;
int y = 50;
int w = 100;
int h = 75;
 
void setup() {
  size(200, 200);
  background(255);
}
 
void draw() {
 
  fill(240,220,230,30);
  rect(0,0,200,200);
  stroke(0);
  line(width/2,0,width/2,height);
  line(0,height/2,width,height/2);
   

  if (mouseX <= width/2 && mouseY <= height/2) {
    fill(120,10,40);
    noStroke();
    rect(0,0,100,100);
  }
   if (mouseX > width/2 && mouseY <= height/2) {
    fill(120,10,40);
    noStroke();
    rect(100,0,100,100);
  }
   if (mouseX <= width/2 && mouseY > height/2) {
    fill(120,10,40);
    noStroke();
    rect(0,100,100,100);
  }
   if (mouseX > width/2 && mouseY > height/2) {
    fill(120,10,40);
    noStroke();
    rect(100,100,100,100);
  }
  
  
  
}


