
//import processing.pdf.*;


size (600,600);
//beginRecord (PDF,"textura de alambres.pdf");
background(0);

for(int x=-10; x<700; x=x+35){
 // smooth (10);
 fill(x,2,x,5);
 // strokeWeight (0.70);
stroke(0);
 
 for(int y=-10; y<700; y=y+35){
  
   strokeWeight (0.90);
   stroke (200,x,x,70);
   ellipse(x,y,250,250);
   
   strokeWeight (0.70);
  ellipse(x,y*5,x,250);  
 }
}
