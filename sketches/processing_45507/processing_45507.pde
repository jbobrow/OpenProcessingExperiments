
int x = 0;
int y = 0;

void setup(){
  size(900,500);
  background(32, 15, 54, 20);
}

void draw(){

    if (mousePressed) {
    fill(0);
  } else {
    fill(65, 211, 47, 2);
  }
 stroke(random(255),random(255),random(255),70);
  line(height/2,width/2, mouseX, mouseY);

  rect(200, 100, 100, 50);
  size(400,400);

stroke (random(0,250));
int a = 50;
while ( a < 400 ){
  fill (126, 80, 90);
  rect(300, a, 100, a);
  a = a+50;
}
  fill (97, 234, 222, 5);
  ellipse(120,450,760, 230);
  
  fill (14, 14, 41, 15);
  triangle (130, 175, 158, 120, 120,650);
  
  fill (76, 230, 50, 4);
  rect (600,300, 100, 50);
  
  fill(198, 34, 34, 5);
  triangle(200, 150, 170,120, 200,300);
}



