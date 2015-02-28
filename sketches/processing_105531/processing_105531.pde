
void setup(){
  size(640,640);
  noFill();
  float offset=20; 
}

void draw(){
  
  for (float posx=0;posx<9;posx++){
    for(float posy=0;posy<9;posy++){
      star(80*(posx+0.5),80*(posy+0.5));
    }
  }
    
}

void star(float x,float y){
  //scale(scaler);
  noStroke();
  fill(255,255,0);
  beginShape();
  vertex(x,y-40);
  vertex(x-25,y+40);
  vertex(x+40,y-10);
  vertex(x-40,y-10);
  vertex(x+25,y+40);
  vertex(x,y-40);
  endShape();
}
