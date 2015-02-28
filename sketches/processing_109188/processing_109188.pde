
/*Rachel Moeller
EMS2 GIF
*/

int     nFramesInLoop = 120;
int     nElapsedFrames;
boolean bRecording; 
PImage img;

void setup() {
  size (500, 470); 
  bRecording = false;
  nElapsedFrames = 0; 
  
  img=loadImage("ThemImageS.jpg");
}

void keyPressed() {
  bRecording = true;
  nElapsedFrames = 0; 
}

void draw() {
 
  // Compute a percentage (0...1) representing where we are in the loop.
  float percentCompleteFraction = 0; 
  if (bRecording) {
    percentCompleteFraction = (float) nElapsedFrames / (float)nFramesInLoop;
  } else {
    percentCompleteFraction = (float) (frameCount % nFramesInLoop) / (float)nFramesInLoop;
  }
 
  // Render the design, based on that percentage. 
  renderMyDesign (percentCompleteFraction);
 
  // If we're recording the output, save the frame to a file. 
  if (bRecording) {
    saveFrame("output/myname-loop-" + nf(nElapsedFrames,4) + ".png");
    nElapsedFrames++; 
    if (nElapsedFrames >= nFramesInLoop) {
      bRecording = false;
    }
  }
}
 
 void renderMyDesign (float percent) {
  background (200);
  image(img,0,0);
  
  smooth(); 
  stroke (0,0,0); 
  strokeWeight (4);

  
  //draw ant's head and body
  fill(255);
  ellipse(200,height/2,100,100);//head
  ellipse(300,(height/2)+(percent*2)*PI,100,100);
  ellipse(400,(height/2)-(percent*2)*PI,100,100);
  noFill();

  //urms
  //front
  strokeWeight(4);
  line(200*percent,(height/2)+100,260,((height/2)+30)+(percent*2)*PI);//left
  line(205*percent,(height/2)+100,330,((height/2)+40)+(percent*2)*PI);//right
  
  //back
  line(370,(height/2)+100,380,((height/2)+45)-(percent*2)*PI);//left
  line(460,(height/2)+100,430,((height/2)+40)-(percent*2)*PI);//right
  
  //draw eyes
  
  fill(0);
  ellipse(180,(height/2)+10,10*(percent*2),10*(percent*2));//left eye
  ellipse(220,(height/2)+10,10*(percent*2),10*(percent*2));//right eye
  noFill();
  
  //antennae
  line(170,(height/2)-40,170,(height/2)-80);//left
  line(230,(height/2)-40,230,(height/2)-80);//right
  
  //ends of antennae
  arc(180,(height/2)-80,20,20,PI,TWO_PI);//left
  arc(240,(height/2)-80,20,20,PI,TWO_PI);//right
  
  //mouth
  line(190-(percent*10),(height/2)+30,210+(percent*10),(height/2)+30);
  
  
  //little guy
  //head
  strokeWeight(2);
  fill(255);
  ellipse(200*percent,(height/2)+90,20,20);
  //eyes
  fill(0);
  ellipse(196*percent,(height/2)+90,5*percent,5*percent);
  ellipse(205*percent,(height/2)+90,5*percent,5*percent);
  //mouth
  ellipse(200*percent,height/2+95,3*percent,3*percent);
  
  
  
  
 
  
 }
  



