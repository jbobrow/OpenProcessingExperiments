

int xPos;
int yPos;

void setup() {
  size(600, 600);
  noStroke();
  xPos = width/2;
  yPos = 0;

}

void draw() {
  background(255,247,216);

fill(219,82,34);
smooth();
ellipse(xPos,yPos,100,100);
 
if (yPos > height/2){
yPos-=2;
} else if (yPos < height){
yPos+=50;
}

fill(104,87,21);
rect(0,height/2+96,600,100);
  
}




