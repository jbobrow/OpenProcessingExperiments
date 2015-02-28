
void setup(){
  size(500,500);
  noStroke();
  smooth();
  background(255);
  
}

void draw(){
  //background(chooseColor());
  //background(230,.01);
  /*
  fill(chooseColor());
  triangle(0,0, width,0,  width/2,height);
  fill(chooseColor());
  triangle(0,height, width,height, width/2,0);
  fill(chooseColor());
  triangle(0,0, width/2,height,  0,height);
  fill(chooseColor());
  triangle(width,0, width,height, width/2,height);
  fill(color(random(200,255), 80));
  rect(0,0, width, height);
  */
  tileShape(0,0, width, height);
  delay(80);
}

//tile a space in shape
void tileShape(int xStart, int yStart, int xEnd, int yEnd){
  int len = 30;
  int lenbit = len/2;
  for(int yIdx = yStart; yIdx <= yEnd; yIdx+= (2*len)){
    for(int xIdx = xStart; xIdx <= xEnd; xIdx+= len){
     fill(chooseColor());
     //down triangle
     triangle(xIdx -lenbit,yIdx,  xIdx +lenbit,yIdx,  xIdx, yIdx+len);
     //up triangle
     fill(chooseColor());
     triangle(xIdx,yIdx+len,  xIdx+len,yIdx+len,  xIdx+lenbit, yIdx);
     
     //Row 2
     //downr triangle
     fill(chooseColor());
     //triangle(xIdx - lenbit, yIdx+len,  xIdx +lenbit, yIdx+len,  xIdx, yIdx+ (2*len));
      triangle(xIdx , yIdx+len,  xIdx +len, yIdx+len,  xIdx+lenbit, yIdx+ (2*len));
    
     
     //up triangle
     fill(chooseColor());
     triangle(xIdx-lenbit,yIdx+(2*len),  xIdx+lenbit,yIdx+(2*len),  xIdx, yIdx+len);
    }
      
  }
  
  
  
  
  
}
//return a random color grey with a transparency
color chooseColor()
{
  return color(random(200,255),20);
}

