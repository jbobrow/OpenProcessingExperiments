



size (800,800);
background (0);


for (int a= 3; a<700; a+=40){
 for (int b=3; b<800; b+=50){
 for (int c=6; c<800; c+=60){
stroke (1);
noFill();
   stroke (random (150), random (255), random (0), 50);
   beginShape();
   curveVertex (b,b);
   curveVertex (c,c);
   curveVertex (c,b);
   curveVertex (b,a);
  
  
   endShape();
  
}}
 
}


