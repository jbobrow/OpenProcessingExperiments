
int xPos = 1;
int yPos = 1;
int xCount = 19;
int yCount = 11;

void setup () {
  // frameRate(900);
  size(600,600);
  smooth();
 
}
 
 void draw() {
  
     background(0);
     noFill();  
     stroke(50,200,250);
     strokeWeight(20);
     ellipse(xPos,yPos,30,30);
     xPos = xPos + xCount; // index x positon by 1
     if(xPos >= 600 || xPos <= 0) {
        xCount= -xCount; //reverse when you hit the far edge 
     }

     yPos = round(yPos +(yCount*1.2)); // index y positon by 1
     if(yPos >= 600|| yPos <= 0) {
        yCount= -yCount; //reverse when you hit the far edge 
     }
  }
