
void setup(){

  size(800,800);
}
 
void draw(){ 
float alpha = mouseX;
float beta = mouseY;
  
background(115,161,216);
stroke(0,5,0);
//TWIG//
fill(46,31,10);
rect(00, 88, 105, 9);
 
 
//BODY//
fill(103,57,19);
//owl-body//
ellipse(alpha+50, beta+60, 50, 65);
 
//EARS//
fill(70,32,1);
//owl-ear-right//
triangle(alpha+41, beta+3, alpha+37, beta+12, alpha+46, beta+10);
//owl-ear-left//
triangle(alpha+58, beta+3, alpha+54, beta+10, alpha+63, beta+12);
 
 
//HEAD//
fill(103,57,19);
//owl-head//
ellipse(alpha+50, beta+19, 32, 23);
 
//owl-eyes//
stroke(0,0,0);
line(alpha+42, beta+17, alpha+47, beta+15);
line(alpha+53, beta+15, alpha+58, beta+17);
 
//what we in swedish call "näbb"//
fill(183,124,6);
triangle(alpha+50, beta+25, alpha+45, beta+21, alpha+55, beta+21);
 
 
//FEET//
fill(70,32,1);
//owl-feet//
ellipse(alpha+40, beta+92, 10, 7);
ellipse(alpha+60, beta+92, 10, 7);
 
 
//WINGS//
noStroke();
fill(70,32,1);
//owl-wing-right//
ellipse(alpha+33, beta+63, 20, 45);
 
//owl-wing-right//
ellipse(alpha+66, beta+63, 20, 45);

}



