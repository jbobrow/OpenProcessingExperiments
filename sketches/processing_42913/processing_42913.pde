
int value = 0;

void setup(){
  size(600,600);
}
 
void draw() {
  
    background (255);
   fill(value);
  ellipse(mouseX,mouseY,30,30);
  noStroke();
  
  fill(200);
  rect(0,0,10,600);
  rect(0,0,600,10);
  rect(590,0,10,600);
  rect(0,590,600,10);
  rect(50,100,60,300);
  rect(170, 200, 600, 100);
  rect(400,420, 200, 200);
  rect(450, 0, 70, 150);
  rect(100,100, 200, 50);
  rect(170,200, 100, 250);
  rect(0, 500, 150, 70);

  
 fill(150, 250);
 rect(550, 300, 50, 120);
 
if((mouseX >550) && (mouseY >300) && (mouseY <420)){
 level2();

   
}
}
 void level2(){
    background(255);
    fill(200);
  rect(0,0,10,600);
  rect(0,0,600,10);
  rect(590,0,10,600);
  rect(0,590,600,10);
  rect(50,100,60,300);
  rect(170, 200, 600, 100);
  rect(200,420, 400, 50);
  rect(450, 0, 70, 150);
  rect(100,100, 200, 50);
 
  rect(0, 500, 150, 70);
  
  
  }
    








