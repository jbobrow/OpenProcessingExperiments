
void setup(){
  //Init
  size(1000,750);
  background(150,150,150);
  smooth();  
  
  //Draw wavy lines
  strokeWeight(10);
  noFill();
  for(float y = -20; y < 900; y+=7){
    stroke(255, 255-(random(100)+y/5), 255-(random(50)+y/5));
    drawWavyLine(0,y, 1000, 30,20);
  } 
}
  
void drawWavyLine(float x1, float y1, float x2, float nodeWidth, float nodeHeight){  
  for(int i=0; i<(x2-x1)/nodeWidth; i+=2){
      bezier(x1+i*nodeWidth,y1, x1+i*nodeWidth+10,y1-nodeHeight, x1+i*nodeWidth+20,y1-nodeHeight,  x1+i*nodeWidth+30,y1);
      bezier(x1+i*nodeWidth+30,y1, x1+i*nodeWidth+40,y1+nodeHeight, x1+i*nodeWidth+50,y1+nodeHeight,  x1+i*nodeWidth+60,y1);
  }
}
