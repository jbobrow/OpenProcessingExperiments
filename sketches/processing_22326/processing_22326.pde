
float x,y;
int speed;

void setup(){
  size(600,600);
  fill(75, 45, 175);
  x = 0;
  y = 0;
}


void draw(){
  
  speed = abs(pmouseX - mouseX);
  
  rect(0,0,width, height);
  ellipse(x,y,speed,speed);
  x = mouseX;
  y = mouseY;
  
  strokeWeight(5);
//option below confines ellipse to specific area
  x = constrain(x, 0, 600);
  y = constrain(y, 0, 600);
  
 //option below confines ellipse to the center 
  //x = constrain(x, 300, 300);
  //y = constrain(y, 300, 300);
  
  rect(mouseX,mouseY,100,300);
  
  
  translate(100,150);
}
void mouseReleased(){
  fill (random(255), random(255),random(255));
}

