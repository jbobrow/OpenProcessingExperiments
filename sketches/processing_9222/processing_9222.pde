
int x= 100;
int y= 200;


void setup() {
 size(500,500); 
 background(0);
}

void draw() {
  //monster body
  stroke(0);
  fill(20,160,98,138);
  ellipse(350,350,200,150);
  noFill();
  //monster head
  stroke(5);
  fill(120,60,98,138);
  ellipse(150,200,150,200);
  noFill();
  
  //monster neck
  stroke(5);
  fill(120,40,198,138);
  quad(250,250, 230,240, 260,260, 300,280);
  noFill();
  
  //monster leggs
  stroke(5);
  fill(20,40,198,138);
  rect(350,350, 20,10);
  noFill();
  
  
  //monster ears
  stroke(5);
  fill(20,60,98,38);
  ellipse(200,100,40,100);
  noFill();
  
  stroke(5);
  fill(20,60,98,38);
  ellipse(100,100,40,80);
  noFill();
  //monster mouth
  stroke(5);
  fill(220,60,98,100);
  ellipse(150,220,130,70);
  noFill();
  //monster eyebrows!
  stroke(30);
  fill(20,60,98,38);
  line(140,150,125,125);
  noFill();
  
  stroke(30);
  fill(20,60,98,38);
  line(140,150,170,120);
  noFill();
  
  //Monster eyes
  stroke(50);
  fill(20,90,108,100);
  ellipse(120,150,10,10);
  noFill();
  
  stroke(50);
  fill(20,90,108,100);
  ellipse(160,150,10,10);
  noFill();
  
  //monster nose
  stroke(50);
  fill(20,90,108,100);
  triangle(130,180, 140,160, 160,180);
  noFill();
}

