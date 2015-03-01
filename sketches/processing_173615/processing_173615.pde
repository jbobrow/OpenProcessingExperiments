

 size (800, 800);    //ancho y alto  (width y height)
 background (0);     // color   


 noStroke();
 
 for( int i=0; i < width; i= i+ 50) {       // int es para variable entera 

 fill ( 255,300,22,20);
 
 ellipse (width/2, height/2, 500, i);  //WIDTH ANCHO Y HEIGHT ALTO
 }
 
 
 
  fill (255, 300, 22, 20);
  ellipse (50, 50, 300, 300);
 ellipse (750, 750, 300,300);
 ellipse (50, 750,300, 300) ;
 ellipse (750, 50, 300, 300);
 

for (int a= 3; a<700; a+=100){
 for (int b=3; b<800; b+=200){
 for (int c=6; c<800; c+=5){
   
stroke (181);
noFill();

   stroke (255, 300, 22, 10);
   beginShape();
   curveVertex (b,b);
   curveVertex (a,c);
  curveVertex (c,b);
   curveVertex (c,c);
   
   
   endShape();
   
}}
  
}




