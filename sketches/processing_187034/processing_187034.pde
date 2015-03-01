
//Jenny Na
//DMS 110
//DUE 2.24.2015
//for function
//pattern line
//source: http://www.openprocessing.org/sketch/186852-created by Nick Kreuter
// http://www.openprocessing.org/sketch/186803-created by Su Hyun Nam 

void setup(){
  size(480,360);
}
 
void draw(){ background(255,255,255);
  for(int i = 0; i<width; i = i + 1){ //initialize,condition,code,expression
  for(int j = 0; j<height; j = j + 1){
  noStroke();

  fill(i*70,j*50,66);
  rect(i*80,j*60,50,50);
 fill(i*50, j*20,80);
  ellipse(i*75,j*60,40,40);
  
 
  }
}
}
