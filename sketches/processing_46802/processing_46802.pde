

// press mouse to pause
// press 's' to save jpg


void setup(){
  
  size(500,500);
  smooth();
  background(0);
  frameRate(20);
 
  
}



void draw(){
  
  fill(0,40);
  rect(0,0,width,height);
 
 for (int x=10; x< width +70; x +=70){
   for (int y=10; y< height +70; y +=70){
 doubleP(x,y,tan((frameCount)/60.0)*random(0.5));
 }
 }
 
 
}



void doubleP (int x, int y, float s){
  pushMatrix();
  translate(x,y);
  scale(s);
  fill(dist(x,y,mouseX,pmouseX),dist(x,y,mouseY,pmouseY),0);
  ellipse(x,y,100,100);
  fill(random(255),random(255),0);
  ellipse(x,y,100/2,100/2);
  popMatrix();
}

boolean bStop;
void mousePressed()
{
  bStop = !bStop;
  if (bStop)
    noLoop();
  else
    loop();
}

void keyPressed() {
  if (key == 's') { saveFrame("Screenshot-####.jpg");}
    }



