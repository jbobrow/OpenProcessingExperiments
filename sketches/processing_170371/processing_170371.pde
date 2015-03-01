
size (400, 400);
colorMode(HSB, 360, 256, 256);
background(0);
smooth();
translate(200, 200);

for (int k= 0; k < 40; k++) {
 
  rotate(PI/18);
  stroke(10 *k, 255, 300, 255);
  ellipse(0, 50, 400, 0);
   if(k<=width/2){
      fill(10);  
    }else{   
      fill(100);   
    }
    
   


   
 
 
    fill(255);

}






