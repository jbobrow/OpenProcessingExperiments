
int y = 0;
int speed = 10;
void setup() {
  int s1 = 400;
  size(s1,s1);
  background(255);
  smooth();
}
void draw() {
  //background(255);
  //size(400,400);
  y = y + speed; 
  if ((y > width-50) || (y < 10)) {
    speed = speed * -1;
  }
fill(random(300),random(300),random(300));
ellipse(mouseX,y,100,100);
fill(0);
ellipse(mouseX-20,y-15,16,32);
ellipse(mouseX+20,y-15,16,32);
fill(0);
arc(mouseX, y+20,50, 30, 0, PI);

float r = 0;
float g = 0;
float b = 0;
float as= random(3);
float w = random(3);
float maxs = random(100,200);
  
if (mousePressed){
    r=random(100);
    g=random(100);
    b=random(100);
    background(r,g,b);
    as= random(3);
    w = random(3);
    maxs = random(100,200);
    
  fill(255);
  rect(random(400),random(400),20,20);
  fill(255);
  rect(random(400),random(400),20,20);
  fill(255);
  rect(random(400),random(400),20,20);
  fill(255);
  rect(random(400),random(400),20,20);
  fill(255);
  rect(random(400),random(400),20,20);
  fill(255);
  rect(random(400),random(400),20,20);
  
  fill(random(300),random(300),random(300));
  ellipse(200,200,100,100);
  fill(0);
  ellipse(200-20,200-15,16,32);
  ellipse(200+20,200-15,16,32);
  fill(0);
  arc(200, 200+20,50, 30, 0, PI);
  }
}

  }
}
