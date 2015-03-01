
void setup(){
 size(500,500);
background(255);
smooth();

}

void draw(){
  fill(255,30);

 pushMatrix();
/*noStroke();
colorMode(HSB, 100);
for (int l = 0; l < 100; l++) {
for (int j = 0; j < 100; j++) {
  point(l, j);
  stroke(l, j, 100);
*/ 
    translate(50,250);
    /*
  colorMode(HSB,100);
    for (int a=1; a<100; a++){
      for(int b=1; b<100; b++){
        point(a,b);
    float farbe=map(color(a,b),0,100,0,2*PI);
    */
    noFill();
   stroke(0,5);
float sec=map(second(),1,59,0,2*PI);
rotate(sec);
triangle(0,0,-60,-110,-120,-150);
      

popMatrix();

pushMatrix();
stroke(255);
fill(0,10);
translate(250,250);
float sek=map(second(),1,59,0,2*PI);
rotate(sek);
triangle(0,0,-60,-70,-60,-95);
popMatrix();

pushMatrix();
stroke(0,5);
noFill();
translate(450,250);
float stu=map(second(),1,59,0,2*PI);
rotate(stu);
triangle(0,0,-60,-95,-90,-110);
popMatrix();

pushMatrix();
stroke(0,10);
noFill();
translate(375,250);
float stun=map(second(),1,59,0,2*PI);
rotate(stun);
triangle(0,0,-150,-180,-180,-200);
popMatrix();

pushMatrix();
stroke(0,10);
noFill();
translate(125,250);
float stund=map(second(),1,59,0,2*PI);
rotate(stund);
triangle(0,0,-80,-110,-115,-200);
popMatrix();
/*
pushMatrix();
fill(230,10);
noStroke();
translate(0,mouseY);
ellipse(0,0,50,50);
ellipse(75,0,50,50);
ellipse(150,0,50,50);
ellipse(225,0,50,50);
ellipse(300,0,50,50);
ellipse(325,0,50,50);
ellipse(400,0,50,50);
ellipse(425,0,50,50);
ellipse(500,0,50,50);
popMatrix();
*/


}

