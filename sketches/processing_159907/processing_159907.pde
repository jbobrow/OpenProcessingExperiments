
size(800, 600);
  background(0);
  float a = 7;
float p = 0.0;

 for (float b = 0; b < 800; b = b + .2) {
 float x = 300+sin(a)*350;
 //a = a + .25;

  line(b, x, b, x);
  
  //line(b, x, b, x);
  
  a = a + 14;
  p = p +.89;
  //if(x<500){
   strokeWeight(10);
    stroke(p/1.6, 2*p/4.1-300, 20+3*b/9.7);
   

 }
  for (float b = 0; b < 800; b = b + .2) {
 float x = 300+sin(a)*350;
 //a = a + .25;

  line(b, x, b, x);
  
  //line(b, x, b, x);
  
  a = a + 14;
  p = p +.89;
  //if(x<500){
   strokeWeight(sin(a/b)+3);
    stroke(p/1.6, 2*p/4.1-300, 20+3*b/9.7);
   
 }
 
float d = 7;
float g = 0.0;
//
// for (float b = 0; b < 800; b = b + 4) {
// float x = 300+sin(d)*70;
//d = d + .25;
//
//  line(b, x, b, x);
//  
//  d = d + 29;
//  g = g +.89;
//  //if(x<500){
//   strokeWeight(16);
//    //stroke(g/1.6, 2*g/4.1-300, 20+3*b/10);
//    //stroke(b/1.58, 2*g/4.4-300, 20+3*b/9.7);
//   //stroke(b,2*x-300,20+3*b);
//    stroke(b/2,2*x-380,20+4*b);
// }
 for (float b = 0; b < 800; b = b + 19) {
 float x = 300+sin(d)*275;
d = d + .5;

  line(b, x, b, x);
  
  d = d + 29;
  g = g +.89;
  if(x<500){
   strokeWeight(35);
    //stroke(g/1.6, 2*g/4.1-300, 20+3*b/10);
    //stroke(b/1.58, 2*g/4.4-300, 20+3*b/9.7);
   stroke(b,2*x-300,20+3*b);
    //stroke(b/2,2*x-380,20+4*b);
 }
 }



