
void setup (){
  size(700,280);
  background(255);
}

void draw(){
  stamp();
  translate(200,0);
  stamp();
  translate(200,0);
  stamp();
}

void stamp(){
  smooth();
  int x =150;
  int y =150;
  float circle1 = random (20,30);
  float circle2 = random(5,15);
  
  strokeWeight(1);
  fill(238,245,52);
  rect(x-37,y-37,x-75,y-75);
  fill(232,21,35);
  ellipse(x,y, circle1,circle1);
  strokeWeight(3);
  line(x,y-45,x,y-90);
  strokeWeight(1);
  fill(0,109,240);
  arc(x+1,y-37, 75,75, PI,2*PI);
  triangle(x-37,y-33, x-37,y+30, x-70,y+30);
  triangle(x+38,y-33, x+38,y+30, x+70,y+30);
  quad(x-34,y+38, x-22,y+38, x-15,y+60, x-42,y+60);
  quad(x+34,y+38, x+22,y+38, x+15,y+60, x+42,y+60);
  fill(255);
  ellipse(x-22,y-50, 8,8);
  ellipse(x+22,y-50, 8,8);
  strokeWeight(3);
  line(x-18,y-42, x+18,y-42);
  strokeWeight(1);
  fill(232,21,35);
  ellipse(x,y-95,circle2,circle2);
}
