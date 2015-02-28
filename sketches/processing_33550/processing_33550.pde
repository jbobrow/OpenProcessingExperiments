
//Elizabeth Clare
//August 9th 2011
//Square Face



float xPosLeft;
float yPosLeft;
float xPosRight;
float yPosRight;
boolean EyesOpen = true;
int lash= 10;
float lashGap= 100/(lash-1);
void setup() {
size(400,400);
smooth();
}

void draw() {
  background(#444444);
  fill(255);
  rect(40,40,120,120);
  rect(240,40,120,120);
  
  
  
  
  fill(#215463);
  ellipse(xPosLeft, yPosLeft, 20, 20);
  ellipse(xPosRight, yPosRight, 20, 20);
  
  xPosLeft = constrain(mouseX, width/8, 3*width/8);
  yPosLeft = constrain(mouseY, height/8, 3*height/8);
  
  xPosRight = constrain(mouseX, 5*width/8, 7*width/8);
  yPosRight = constrain(mouseY, height/8, 3*height/8);


  if (mousePressed) {
    fill(#444444);
    rect(40,40,120,120);
    rect(240,40,120,120);
    //line(40,160,40,250);
    for(int i=0; i<lash; i++){
      bezier (40+lashGap*i,160,70+lashGap*i,160,30+lashGap*i,250,60+lashGap*i,250); 
      bezier(240+lashGap*i,160,270+lashGap*i,160,230+lashGap*i,250,260+lashGap*i,250);
    }
//    bezier (40,160,70,160,30,250,60,250);
//    bezier (90,160,120,160,80,250,110,250);
//    bezier (140,160,170,160,130,250,160,250);

     // bezier(240,160,270,160,230,250,260,250);
   }
  else {
    fill(#215463);
  }

}

void mouseReleased() {
 EyesOpen = !EyesOpen;
}

