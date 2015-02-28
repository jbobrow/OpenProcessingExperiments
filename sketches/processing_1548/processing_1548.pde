


void setup(){
  size(260,430);
  noStroke();//üçgenleri kesmek için çizgileri yokettim.

  background(211,49,49);
}
void draw(){
  fill(5,5,5);
  rect(25,65,60,140);
  rect(85,5,140,60);
  rect(50,270,55,160);
  rect(105,205,50,220);
  rect(168,205,80,210);
  rect(72,206,13,5);
  rect(85,193,25,13);
 
  fill(219,222,221);
  rect(155,200,13,5);
  rect(72,193,13,13);
  rect(110,85,128,108);

  fill(211,49,49);//üçgenlerin göünmemesi için renk arka planla aynı.
  rect(105,270,10,160);
  triangle(20, 200, 5, 50, 30,45);//karelerin kenarlaını kesmeek için üçgenler çizdim.
  triangle(85, 2, 225, 2, 225, 8);
  triangle(104, 270, 104, 206, 110, 206);
  triangle(110,193,110,85,117,85);
  triangle(132,170,136,123,235,127);
  triangle(229,126,243,126,238,193);
  triangle(228,85,243,85,243,193);
 
 
 

}
 


