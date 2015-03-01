
float r1;
float r2;
float r3;
float r4;
float r5;
int speed;


void setup(){
  size(700,700);
  background(255);
}

void draw(){
  
  stroke(random(140,250),30);
  strokeWeight(random(2));
  line(330,313,-15,random(700));
  line(330,313,710,random(700));
  line(330,313,random(700),-10);
  line(330,313,random(700),710);
  
  r1=random(500);
  noStroke();
  fill(random(240,250),random(120,130),random(150,220));
  ellipseMode(CENTER);
  ellipse(330,313,r1,r1);
  
  r2=random(400);
  noStroke();
  fill(random(140,150),random(220,250),random(220,250));
  ellipseMode(CENTER);
  ellipse(330,313,r2,r2);

  
  r3=random(260);
  noStroke();
  fill(random(140,150),random(120,150),random(220,250));
  ellipseMode(CENTER);
  ellipse(504,485,260,260);

  fill(random(140,150),random(220,250),random(120,150));
  ellipseMode(CENTER);
  ellipse(504,485,r3,r3);
  
  frameRate(15);
  
}


