
/*************************************************************************************
* Assignment #2
* Kelli Breeden
* kbreeden@brynmawr.edu
* CS 110 - Section 2
* Submitted 2/7/2012
*
* This sketch provides a horizon of sky and grass. When the mouse is clicked on the
* ground, flowers are drawn proportional to their position with the horizon. When
* the mouse is clicked in the sky area, clouds are drawn. These are also proportional
* to the horizon, with the smallest being those closest to the horizon, and the
* largest being nearest to the top of the window. These proportions should apply
* regardless of the window size.
**************************************************************************************/

void setup() {
  size(800,500);
  smooth();
  noStroke();
  background(0,120,10); //ground color
  fill(0,167,255); 
  rect(0,0,width,height/2); //sky
}

void draw() {}

void mousePressed(){
  if(mouseY<height/2){
    //designates the proportions of the clouds
    if(mouseY<height/5){
      drawcloud (1,1);
    }
    else if (mouseY>height/3){
      drawcloud(2,2);
    }  
    else if (mouseY>height/5 && mouseY<height/3){
      drawcloud(1.5,1.5);
    }
  }
  else if (mouseY>height/2){
    //designates the scaling of the flowers
    if(mouseY<(height*3)/5){
      drawflower (mouseX,mouseY,int(5),2,2);
    }
    else if (mouseY>(height*6)/7){
      drawflower (mouseX,mouseY,int(5),1,1);
    }  
    else if (mouseY>(height*3)/5 && mouseY<(height*6)/7){
      drawflower (mouseX,mouseY,int(5),1.5,1.5);
    }
  }
}

//draws clouds of nested ellipses over varying sizes based on variables
//scaleX and scaleY
void drawcloud (float scaleX, float scaleY){
  fill(255);
  noStroke();
  ellipse(mouseX,mouseY,75/scaleX,50/scaleY);
  ellipse(mouseX+(40/scaleX),mouseY-(15/scaleY),75/scaleX,50/scaleY);
  ellipse(mouseX-(50/scaleX),mouseY-(15/scaleY),75/scaleX,50/scaleY);
  ellipse(mouseX-(30/scaleX),mouseY-(40/scaleY),75/scaleX,50/scaleY);
  ellipse(mouseX+(20/scaleX),mouseY-(45/scaleY),75/scaleX,50/scaleY);
}

//draws flowers of varying sizes based on variables scaleW and scaleZ
void drawflower(int centerX,int centerY, int n, float scaleW, float scaleZ) {
  float angle = 2*PI/n;  // n determines number of petals
  for (int i=0; i<n; i++) {
    stroke(110,0,149);
    fill(130,0,167,100);
    ellipse(centerX+(15/scaleW)*cos(angle*i), centerY+(15/scaleZ)*sin(angle*i), 30/scaleW, 30/scaleZ);
  }
}

