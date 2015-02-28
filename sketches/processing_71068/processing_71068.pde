
size (800,800);
background (0);

for (int a= 3; a<700; a+=40){
 for (int b=3; b<800; b+=50){
 for (int c=6; c<800; c+=60){
stroke (1);
noFill();
   stroke (random (10), random (155), random (250), 45);
   beginShape();
   curveVertex (a,a);
   curveVertex (b,c);
   curveVertex (c,c);
   curveVertex (c,a);
   curveVertex (b,c);
 
  
  
   endShape();
 
}}
}

