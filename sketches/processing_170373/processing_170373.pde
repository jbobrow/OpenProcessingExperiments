


size (400, 400);
colorMode(HSB, 360, 256, 256);
background(0);
smooth();
translate(200, 200);

for (int k= 0; k < 40; k++) {
    if(k == stroke/10){
       stroke(255);
    }
 
   
   
  rotate(PI/18);
  stroke(10 *k, 255,100, 150);
  ellipse(0, 50, 400, 0);
  
  
}




