



void setup (){

size (800,800);

background (0);
 
 for (int i=0; i<height; i+=20){ 

for (int t=0; t<width; t+=20) {
  fill (random (0,255),80);
  ellipse (t,i, 10,10);
  
  
}
}


noStroke ();
for (int i=8; i<1100; i+=70){ 

  fill(150,150,250,20);
  ellipse (400,400, i,i);
  
  fill (250,50,90,80);
  rect (i,i,80,80);
  
  fill (250,255,0,90);
  rect (i,i,i,i);
   
  fill (0,255,250,40);
  rect (i,0,i,i);
   
     
  fill (140,0,255,20);
  rect (0,i,i,i);
  
  
}



}


