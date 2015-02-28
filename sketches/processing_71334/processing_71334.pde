
float p = 0, q = 1000, x, y, r = 20;
float cir2;
float cir1;
int num = 6;
int counter;

void setup() {
  size(600,600);
  background(255);
  smooth();
  noFill();
  frameRate(1000);

}
 
void draw() {
  strokeWeight(1);
   stroke(31,255,189);//colors
  x = 300+ 173 *cos(r)-50*cos(r*155/77);
  y = 300+ 173*sin(r)-50*sin(r*155/77);
  if(p > 0)
    line(p, q, x, y);
  else background(255);
  p = x;
  q = y;
  r+= PI/40;
}
 
void mouseDragged() {
  if (key == '1')
  {
  for (int i = 0; i < num ; i++) {
    pushMatrix();
    translate(width/2+80*sin(cir1 + i), height/2+80*cos(cir1 + i));
    rotate(cir2);
    stroke(31,255,random(189));//colors
    fill(i * 360 / num, 100, 100, 80);
    ellipse(5, 5, 10, 5);
    popMatrix();
  }
 
  cir1 += 0.01;
  cir2 += 0.05;
  }
  if (key == '2')
  {
  for (int i = 0; i < num ; i++) {
    pushMatrix();
    translate(width/2+150*sin(cir1 + i), height/2+150*cos(cir1 + i));
    rotate(cir2);
    fill(i * 360 / num, 5, 55, 155);
    ellipse(0, 0, 80, 30);
    popMatrix();
  }
 
  cir1 += 0.01;
  cir2 += 0.05;
}
  if (key == '3')
  {
  for (int i = 0; i < num ; i++) {
    pushMatrix();
    translate(width/2+60*sin(cir1 + i), height/2+60*cos(cir1 + i));
    rotate(cir2);
    fill(i * 360 / num, 100, 55, 150);
    ellipse(0, 0, 10, 30);
    popMatrix();
  }
 
  cir1 += 0.072;
  cir2 += 0.05;

}
  if (key == '4')
  {
  for (int i = 0; i < num ; i++) {
    pushMatrix();
    translate(width/2+180*sin(cir1 + i), height/2+180*cos(cir1 + i));
    rotate(cir2);
     stroke(255);//colors
    fill(i * 360 / num, 55, 55, 55);
    ellipse(50, 50, 10, 10);
    popMatrix();
  }
 
  cir1 += 0.072;
  cir2 += 0.05;
}
}
//backgound
void keyPressed() {
  if (key == 'q') {
  background(240);
  
}
}
void keyTyped() {
    
  if (key==' '){background (255);}
  
}


