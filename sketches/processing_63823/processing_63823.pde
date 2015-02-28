
// *** Übung 2.4

int xPos = 1;
int yPos = 1;
int speed = 5;
int yspeed = 15;


void setup (){
  size(500,500);
  background (255);
  fill(0);
  smooth();
}

void draw (){
  
  //fill(255, 255, 255, 20);
  //rect(0, 0, 500, 500);
  
 
  
  xPos = xPos + speed;
  if (xPos >= width || xPos < 0 ){
    speed = speed * (-1);
  }
  
    yPos = yPos + yspeed; 
   if (yPos >= height || yPos < 0 ){
    yspeed = yspeed * (-1);}
    line(random(xPos),yPos,random(xPos),random(xPos));
}




void mouseReleased(){
  saveFrame("ball2.png");
} 

