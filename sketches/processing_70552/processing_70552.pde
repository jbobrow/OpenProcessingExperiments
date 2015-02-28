
float angle = 0;
float loops = 0;
boolean clicked = false;
boolean whites = false;
int clickedX, clickedY;

void setup() {
  size (500, 500);
  background(255);
  smooth();
  strokeWeight(2);
  noCursor();
}
 
 
void draw() {
  //background(255,255,255);
  
  int x = mouseX;
  int y = mouseY;
  float hy = noise(mouseX,mouseY)/10;
  
  fill(255,255,255);
  noStroke();
  ellipse(x, y, 60+hy*50, 60+hy*50);
  noFill();
  stroke(0);
  //outer
  arc(x, y, 50+hy*50, 50+hy*50, angle, angle + 1);
  arc(x, y, 50+hy*50, 50+hy*50, angle-PI, angle + 1-PI);
  line(x+20*cos(angle),y+20*sin(angle),x+30*cos(angle),y+30*sin(angle));
  line(x+20*cos(angle+1),y+20*sin(angle+1),x+30*cos(angle+1),y+30*sin(angle+1));
  arc(x, y, 60+hy*50, 60+hy*50, angle, angle + 1);
  arc(x, y, 60+hy*50, 60+hy*50, angle-PI, angle + 1-PI);
  line(x+20*cos(angle-PI),y+20*sin(angle-PI),x+30*cos(angle-PI),y+30*sin(angle-PI));
  line(x+20*cos(angle + 1-PI),y+20*sin(angle + 1-PI),x+30*cos(angle + 1-PI),y+30*sin(angle + 1-PI));
  
  //inner
  arc(x, y, 18+hy*50, 18+hy*50, 2*PI-angle,2*PI-angle + 1);
  arc(x, y, 18+hy*50, 18+hy*50, 2*PI - angle-PI, 2*PI-angle + 1-PI);
  
  line(x-10, y, x+10, y);
  line(x, y+10, x, y-10);
  
  
  angle += hy;
  
  loops += noise(x,y)*5;
  
  if (whites){
    stroke(255,255,255);
  } else {
    stroke(0,0,0);
  }
  for(float i = loops; i < loops + 10; i += 1){
    ellipse(clickedX,clickedY,i*10,i*10);
  }
  stroke(0,0,0);
  
  if (clicked){
    if (loops > 100){
      clicked = !clicked;
      loops = 0;
      clickedX = mouseX;
      clickedY = mouseY;
    }
  }
}

void mousePressed(){
  if (!clicked){
    clicked = !clicked;
    whites = !whites;
  }
}
