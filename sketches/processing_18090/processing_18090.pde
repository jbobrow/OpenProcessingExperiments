
//dynamic pattern

void setup(){
  size(250,250);
  background(0);
  smooth();
  frameRate(15);
}

void draw(){
  noFill();
 
    for(int i=0; i<250; i+=15){
      stroke(0,i,random(255),100);
      strokeWeight(i/100);
  bezier(i,250,i*2,0,0,i*2,i,0);
    }
    
    for(int i=0; i<250; i+=20){
      stroke(i,i,255,100);
      strokeWeight(i/100);
  bezier(125,125,0,i*1.5,i*1.5,0,125,125);
    }
    
}

void keyPressed(){
  if (key=='p'){
    saveFrame("dynamic.png");
  }
}

