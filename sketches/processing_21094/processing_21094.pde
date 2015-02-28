
void setup(){
  smooth();
  size(800,800);
  frameRate(2);
   background(0);
   
}
  void draw(){ 
   

  for(int i=0; i<81;i++){
    stroke(50,99);
    line(400,400,i*10,0);
    line(400,400,0,i*10);
    line(400,400,800,i*10);
    line(400,400,i*10,800);
  }
  
  for(int j=0; j<650; j+=10){
   noFill();
   stroke(0,0,255);
   strokeWeight(1);
   ellipse(525,450,j+2,j+2);
   stroke(255,0,0);
   ellipse(275,450,j+2,j+2);
   stroke(0,255,0);
   ellipse(400,300,j+2,j+2);
      
  }
 
}

