
void setup(){

  
println(radiusValue + areaText + circleArea(5) + areaC + circleC(5));

background(0);
size(200,200);
}


void draw(){


//responsive singing circle 
  fill(random(215,255)); 
  circleDraw(100,100,10);
  fill(0);
  circleDraw(100,100,30);
}




  String radiusValue = "When the radius is 5, ";
  String areaText = "the Area is "; 
  String areaC = " and the circumference is "; 
  
 //area circle 
  float circleArea(float r){
  float A = PI*(r*r);
  return A;
}


 //circumfrence of circle  
 float circleC( float r){
  float C = 2*PI*r;
  return C;
}


//draw circle 
 void circleDraw(int x, int y, int r){
  ellipse(x, y, mouseX - 2*r, mouseY - 2*r);
 }


