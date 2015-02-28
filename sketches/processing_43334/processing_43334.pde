
Eye myEye;
Eye myEye1;

Eye[] eyes= new Eye[200];


void setup() {
  size(600, 600);
  
  for(int i=0; i<200;i++){
    eyes[i] = new Eye((int)random(10), (int)random(160), (int)random(15), (int)random(105));
    fill(255);
    line((int)random(10), (int)random(160), (int)random(15), (int)random(105));
  }
  
  //declare x, y, speed, size
  myEye = new Eye (3, 50, 3, (int)random(100));
  myEye1 = new Eye (45, 35, 7, (int)random(40));
}

void draw() {
  background(0);
  
  fill(255);
  
  
  myEye.moveObject();
  myEye.displayEye();
  
  myEye1.moveObject();
  myEye1.displayEye();
  
  for(int i=0; i<200;i++){
    eyes[i].displayEye();
    eyes[i].moveObject();
    
  }
}

/* FOR NEXT WEEK CREATE A NEW CLASS THAT IS NOT BOUNCING, CLASS THAT KJIGGLES, FOLLOWS A MOUSE ?? 
FOLLOWS A KINECT MOUSE ?? AWESOME
LOOK AT OPEN PROCESSING SEE CLASSES ?
*/

/*DA CLASS*/

class Eye {
  int xPos;
  int yPos;
  int eyeSpeedx;
  int eyeSpeedy;
  int eyeScale;
  PFont font;
  
  
  
  Eye (int x, int y, int ss, int scaleEye ) {
    xPos = x*(int)random(3);
    yPos = y*(int)random(3);
    eyeSpeedx = ss;
    eyeSpeedy = (int)random(4);
    eyeScale = scaleEye;
    font = loadFont("Bule-48.vlw");
    
  }

  void moveObject() {
    xPos += eyeSpeedx;
    yPos += eyeSpeedy;

    if ((xPos >= width) || (xPos <= 0)) {
      eyeSpeedx *= -1;
    }
    if ((yPos >= height) || (yPos <= 0)) {
      eyeSpeedy *= -1;
    }
    
    if(mouseX - xPos < 50 && mouseY - yPos < 50){
      xPos = mouseX + (int)random(6);
    }
    
    if(mouseX - xPos < 50 && mouseY - yPos < 50){
      yPos = mouseY - (int)random(6);
    }
  }

  void displayEye() {
    
//    textFont(font);
//    text("P", xPos, yPos, eyeScale);
      
      fill(0, 255, 0);
      ellipse(xPos, yPos, eyeScale, eyeScale);
      
      fill(255, 0, 0);
      ellipse(xPos, yPos, eyeScale/2, eyeScale/2);
      
      
    
//    ellipse(xPos, yPos, eyeScale, eyeScale);
//    fill(255, 0, 0);
//    ellipse(xPos, yPos, eyeScale, eyeScale);
  }
}













             
                                
