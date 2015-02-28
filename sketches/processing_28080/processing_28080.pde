
//smilySpectrum


void setup(){
  
  size(500, 500);
  smooth();
  
  background(random(0,255), random(0,255), random(0,255), random(255));
  

for (int i = 0; i < 515; i = i+30) {
  for (int j = 0; j < 515; j = j+30) {
      smilyFace(i, j, 10);
  }
  
}


}

void draw()
{
 
  if(key == 'e')
  {

  for (int i = 0; i < 515; i = i+30) {
    for (int j = 0; j < 515; j = j+30) {
      
      smilyFace(i, j, 10);
     
  }
  
}
    
  }
  
  
}

void smilyFace(float xpos, float ypos, float faceSize){
  
//void draw loop

 float ep = random(0, 4);
 float rNum = random(1, 3);
 
  if(faceSize/ep < faceSize*random(3)){
    
  fill(random(250), random(250), random(250), 255);
  ellipse(xpos, ypos, faceSize*rNum, faceSize*rNum);
  strokeWeight(3);
  
//  line(xpos - (faceSize/ep), ypos - (faceSize/random(8)), xpos - (faceSize/ep), ypos + (faceSize/random(8)));
//  line(xpos + (faceSize/ep), ypos - (faceSize/random(8)), xpos + (faceSize/ep), ypos + (faceSize/random(8)));

  line(xpos - (faceSize/ep), ypos - (faceSize/8), xpos - (faceSize/ep), ypos + (faceSize/8));
  line(xpos + (faceSize/ep), ypos - (faceSize/8), xpos + (faceSize/ep), ypos + (faceSize/8));
  arc(xpos, ypos + (faceSize/ep), 10, 10, 0, PI);
  
  }
  
}

