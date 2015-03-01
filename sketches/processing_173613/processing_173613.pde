

size (800,800);

background (0);
 
 
for (int a= 3; a<700; a+=40){
 for (int b=3; b<800; b+=50){
 for (int c=6; c<800; c+=60){
stroke (181);
noFill();
   stroke (random (1810), random (300), random (181), 60);
   beginShape();
   curveVertex (b,b);
   curveVertex (a,c);
   curveVertex (c,b);
   curveVertex (c,c);
   
   
   endShape();
   
}}
  
}


for(int i =0; i <height; i+=60) {
 fill(0, 0, 0, 250);
rect(0, i, width, 10);
fill(0, 0, 0, 300);
rect(i, 0, 10, height);
}


