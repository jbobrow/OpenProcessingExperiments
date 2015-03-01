
float amplada, alcada, ndibuix;
int estat=1;

void setup(){
  size(600,600);
  ndibuix= 30;
  amplada= width/ndibuix;
  alcada= height/ndibuix;
  smooth();
  ellipseMode(CORNER);
  background(255,203,139);
}

void draw(){
  background(255,203,139);
  if(estat==2){
  for (int j= 0; j< ndibuix; j++){
    for(int i= 0; i< ndibuix; i++){
      
      fill(255,0,0);
      rect(i*amplada, j*alcada, amplada, alcada/2);
      fill(20);
      ellipse(i*amplada+3, j*alcada+6, amplada/3, alcada/3);
      ellipse(i*amplada+12, j*alcada+6, amplada/3, alcada/3);
   }
  }
 }
 
 else{
   for (int j= 0; j< ndibuix; j++){
    for(int i= 0; i<=j; i++){
      
      fill(255,0,0);
      rect(i*amplada, j*alcada, amplada, alcada/2);
      fill(20);
      ellipse(i*amplada+3, j*alcada+6, amplada/3, alcada/3);
      ellipse(i*amplada+12, j*alcada+6, amplada/3, alcada/3);
    }
   }
 }
}

void keyPressed() {
  if (key == 'm') {
    estat = 2;}
  
    else{
     estat = 1;}
    
}
