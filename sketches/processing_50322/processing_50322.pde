
float xpos = 0;

void setup(){
  size(500,500);
}

void draw(){
  background(255);

  
  for(int i=0; i<10; i+=random(10)){
    for(int j=0; j<10; j+=random(10)){
      ellipse(mouseX + random(10)-5+i,mouseY + random(10)-5+j,random(80),random(80));
      //stroke(255, 255-(random(100)+mouseY/5), 255-(random(50)+mouseY/5));
      drawWavyLine(mouseX,mouseY, random(200)+mouseX, random(100),random(100));
    }
  }
}

void drawWavyLine(float x1, float y1, float x2, float nodeWidth, float nodeHeight){  
  for(int i=0; i<(x2-x1)/nodeWidth; i+=2){
      bezier(x1+i*nodeWidth,y1, x1+i*nodeWidth+10,y1-nodeHeight, x1+i*nodeWidth+20,y1-nodeHeight,  x1+i*nodeWidth+30,y1);
      bezier(x1+i*nodeWidth+30,y1, x1+i*nodeWidth+40,y1+nodeHeight, x1+i*nodeWidth+50,y1+nodeHeight,  x1+i*nodeWidth+60,y1);
  }
}
