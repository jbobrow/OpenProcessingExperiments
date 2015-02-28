
//Sarah Anderson, seanders
//ems HW6 timer, applet version
//timing structure code borrowed from Golan Levin's "Simple Fuse"
//click anywhere to begin


boolean bClicked;
int clickTime;
int clockTime=5000;
int cloudTime=2000;
int totalTime = clockTime + cloudTime;
float pRot;



void setup()
{
size(400,400); 
smooth();
bClicked= false;
background(50);
}

void draw()
{
  
drawClock();  
//rotHand();
//mushCloud();
  if(bClicked){
    int elapsed = millis() - clickTime;
    
    if(elapsed < clockTime){
      pRot = map(elapsed, 0, clockTime, 0, 90);
      rotHand();  
    }
    else if (elapsed < totalTime){
    
    mushCloud();  
    }
    else{
      bClicked=false;  
    }
  }
  else{
    background(50);
    drawClock();  
  }

}

void drawClock()
{
//text
fill(255);
textSize(20);
text ("click anywhere to start countdown", 20, 50);
//clockface 
stroke(0);  
fill(255);
strokeWeight(20);  
ellipse(400,400,600,600);
//black dots
strokeWeight(2);
fill(0);
ellipse(160, 400, 70, 30);
pushMatrix();
translate(200,280);
rotate(radians(30));
ellipse(0,0,70,30);
popMatrix();
pushMatrix();
translate(280,200);
rotate(radians(60));
ellipse(0,0,70,30);
popMatrix();
stroke(255,0,0);
//red dot
fill(255,0,0);
ellipse(400,160, 30,70);
//hour hand
fill(0);
stroke(0);
quad(380,410,390,280,400,280,400,400);
}

void rotHand()
{
 
fill(0);
stroke(0);
pushMatrix();
translate(400,400);
rotate(radians(pRot));//borrowed from Adrianne Blossom "homework 4.3"
quad(0,20,-170,10,-170,-10,0,-20);
popMatrix();

}

void mushCloud()
{
PImage img;
img = loadImage("Mushroom_Cloud_by_LogicalOperator.jpg");
image(img,0,0);
image(img, 0, 0, width, height);
}

void mousePressed()
{
bClicked=true;
clickTime= millis();
}

