
size(500,500);
smooth();
background(255);
float verticalx=0;
translate(250,250);
stroke(1);
  
for (float i=0; i<500;i=i+1) {

  
  fill(random(255),random(255),random(255),random(100));
  rotate(0.1);
  ellipse(i,0, verticalx, verticalx);
   
  if (verticalx==verticalx) { 
    verticalx=verticalx+.1;
     
   
  }

   
}
