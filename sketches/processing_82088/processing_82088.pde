
import processing.pdf.*;

void setup (){                                                                                                                                      size();
size(800,800);
beginRecord (PDF,"circulitos.pdf");
background(255);
strokeWeight(2);
}

void draw (){
for(int i=0;i<width;i+=40){ //original: =20
for(int a=0;a<width;a+=5){ //original: =20 
  
  fill(242,86,24,50); // original: use randoms 
  ellipse(a,i,50,30); //original:(a,i,50,30)
 fill(0);
  point(100,50); //original: (50,50)
 
}  
}
endRecord();  
}
                                                                                                                                                                                                       

