

// press '0' to pause
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
  
  for (int x=0; x<=width; x+= 100){
    for (int y=0; y<=width; y+= 100){
      float gross = random(0,2);
      float richtung = mouseX;
          pacMan(x,y,gross,richtung);
          }
        }
 

}

void pacMan (int x, int y, float s, float r){
  pushMatrix();
  translate(x,y);
  scale(s);
  rotate(r);
  stroke(0);
  fill(255,255,0);
  ellipse(50,50,60,60);
  fill(0);
  ellipse(50,35,8,8);
  arc(50,50,60,60,-0.8,0.8);
  popMatrix();
}



boolean bStop;
void keyPressed() {
  if (key == 's') { saveFrame("Screenshot-####.jpg");}
  if (key == '0') 
  {
  bStop = !bStop;
  if (bStop)
    noLoop();
  else
    loop();
        }
    }



