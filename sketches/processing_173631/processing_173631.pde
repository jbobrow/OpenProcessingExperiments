
//import processing.pdf.*;


float a= 0.5;
size(800,800);
//beginRecord(PDF,"gusanos.pdf");
background(#FFB758);


for (int i=-10; i<height; i+=25) {
for (int j=-10;j<width;j+=25){
  fill(random(255),random(30),random(200),random(300));

  strokeWeight (a);
  a=a+0.005;
  stroke(0);
  smooth();
  rect (j,i,20,30,30);
}
}
//endRecord();


