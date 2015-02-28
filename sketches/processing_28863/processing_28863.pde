
import processing.pdf.*;

int smileSize = 30;

void setup() {
  size(600, 600);
  smooth();
  noCursor(); //deaktiviert Kursor
}

void draw() {
  background(255); //schreib background immer wieder neu
  
 
  
  for(int x=smileSize; x<width-10; x+=smileSize+20) {
    for(int y=smileSize; y<height-10; y+=smileSize+20) {
      
      float mDist = dist(mouseX, mouseY, x, y+10); //+10 wegen mund
      if(mDist<2) mDist =2;
      if(mDist>20) mDist = 20; //begrenzung

      noStroke();
      fill(255, 239, 0, 255-mDist*15);
      ellipseMode(RADIUS);
      ellipse(x, y, smileSize, smileSize);
      
      //EYES
      noStroke();
      fill(0);
      ellipseMode(CENTER);
      ellipse(x-10, y-10, 3, 3+(10-mDist)); // augen auf & zu
      ellipse(x+10, y-10, 3, 3+(10-mDist));
      
      //MOUTH
      ellipseMode(CENTER);
      ellipse(x, y+10, 20, 20-mDist+2);
      
     
      
    }
  }
  
  //KUCHEN
  noStroke();
  fill(170,50,0);
  rectMode(CORNER);
  rect(mouseX, mouseY, 10, 10);
  fill(220, 255, 0);
  rect(mouseX, mouseY+3, 10, 3);
}


void keyPressed(){
   //Save Frame
  if (key== 's') {
    println("Frame abspeichern");
    saveFrame("screenshot-####.tif");
  }
  
  //Begin Record 
  if (key=='b'||key=='B')
  {
    beginRecord(PDF, "zeichnung.pdf");
  }
  
  //End Record
  if (key=='e'||key=='E')
  {
    endRecord();
    exit();
  }
} 

