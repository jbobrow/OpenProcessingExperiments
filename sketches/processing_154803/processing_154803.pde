
int x = 250;
int y = 600;
int r = 40;
int r2 = 60;
int r3 = 80;
int r4 = 100;
int r5 = 120;
int r6 = 140;
float theta = 0.1;
float theta2 = 0.1;
float theta3 = 0.1;
float theta4 = 0.1;
float theta5 = 0.1;
float theta6 = 0.1;


void setup(){
  size(500, 1000);
  smooth();
  background(0);
}

void draw(){
  background(0);
  noStroke();
  fill(50, 200, 240);
  ellipse(x, y, 20, 20);
  fill(240, 240, 48);
  ellipse(x+r*cos(theta), y+r*sin(theta), 10, 10);
   ellipse(x+r2*cos(theta2), y+r2*sin(theta2), 10, 10);
    ellipse(x+r3*cos(theta3), y+r3*sin(theta3), 10, 10);
     ellipse(x+r4*cos(theta4), y+r4*sin(theta4), 10, 10);
      ellipse(x+r5*cos(theta5), y+r*sin(theta5), 10, 10);
       ellipse(x+r6*cos(theta6), y+r*sin(theta6), 10, 10);
     
      
  
  theta += 0.1;
  theta2 += 0.2;
  theta3 += 0.3;
  theta4 += 0.4;
  theta5 += 0.3;
  theta6 += 0.2;
}

void keyPressed(){
  switch(keyCode){
    case 't':
    y -= 1;
    break;
    case 'f':
    x -= 1;
    break;
    case 'h':
    x += 1;
    break;
    case 'b':
    y += 1;
    break;
  }
}


  int mx;
  int my;
void mousePressed(){
  stroke(255);
  strokeWeight(10);
  line(x, y, x, y-100);
}
    


