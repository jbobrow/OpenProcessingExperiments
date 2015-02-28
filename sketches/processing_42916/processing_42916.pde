
int value = 0;

void setup(){
  size(600,600);
}
 
void draw() {
  
    background (255);
   fill(value);
  ellipse(mouseX,mouseY,30,30);
  noStroke();
  
   //background(255);
    fill(200);
  rect(0,0,10,600);
  rect(0,0,600,10);
  rect(590,0,10,600);
  rect(0,590,600,10);
  rect(50,100,60,300);
 
  rect(150, 200, 600, 100);
  rect(200,420, 400, 35);
  rect(110,150, 50, 400);
 
  rect(150,510, 400,40);
  rect(450, 0, 70, 150);
  rect(100,100, 60, 50);
  rect(220,0, 60, 140);
  rect(330, 60, 60, 150);
  
  //rect(0, 500, 150, 70);
}

