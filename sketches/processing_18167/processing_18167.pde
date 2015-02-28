
void setup(){
  size(540,333);
  smooth();
  noStroke();
}

void draw(){

  background(255);
  pushMatrix();
    translate(width/2,height/2);
    fill(0,0,0);
    drawStar();
  popMatrix();
 
  pushMatrix();
    translate(mouseX,height/2);
    rotate(TWO_PI * frameCount / 1000);
    translate(0,70);
    fill(0,0,0);
    drawStar();
  popMatrix();
  
}

void drawStar(){

  float r = 2000;
  int numSpokes = 180;
  
  for(int i = 0 ; i < numSpokes ; i++)
  {
    //0からPIまでやるよ
    float t0 = map(i,0,numSpokes-1,0,TWO_PI);
    //一回の処理で進むdeltaPi 
    float t1 = t0 + (TWO_PI / (2 * numSpokes) );
    arc(0,0,r,r,t0,t1);
  }
}
