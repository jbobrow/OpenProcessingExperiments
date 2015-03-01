
////Triying straight lines. I embedded a for loop inside the 
//other to get the number of repetitions were multiplied

//Translate coordenates to draw ellipse in the canvas' middle 
//using pusMatrix and popMatrix

void setup(){
  size(800, 200);
  background (0);
} 
 
void draw(){
  for( int a= -1200; a<=2000; a+=100){
    for(int b= -2400; b<=1600; b+=100){
    strokeWeight(1);
    stroke(6, 160, 151);
    line( 400, 0, a, width);
    line( 400, 200, -b, -width);
  }
  }
  pushMatrix();          
  translate(400, 100);
  strokeWeight(4);
  stroke(75, 48, 12);
  fill(90, 57, 14);
  ellipse(0, 0, 20, 80);
  popMatrix();  
}
 
 
  


