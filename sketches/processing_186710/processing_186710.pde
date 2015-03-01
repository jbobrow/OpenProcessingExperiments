

    
 float x1 = 0;
 float y1 = random(0,height);
 
  float y2 = 0;
 float x2 = random(0,width);
 
 
  float x3 = width;
 float y3 = random(0,height);

void setup(){
  size(1700,1000);
  background(0,0,0);
  


  
}

void draw(){
 

   
  fill(255,103,0,0);
stroke(0,0,0,0);
  point(x1,y1);
  point(x2,y2);
  point(x3,y3);
  

 


 

   
 x1 = x1 + 7;
 y2 = y2 + 7;
 x3 = x3 - 7 ;
 
  
 if( x1>= width ){
   
   x1= 0;
   y1 = random(0,height);
 }
  if( y2>= height ){
   
   y2 = 0;
   x2 = random(0,width);  
 }
 
 
 
 if( x3 <= 0 ){
   
   
   x3 = width;
   y3 = random(0,500);
   
 }
 
 
 
if (dist(x1, y1, x2, y2) <= 200){
    stroke(255,103,0);
  beginShape();
vertex(x1, y1);
vertex(x2, y2);
vertex(x1, y1-7);


endShape();
   



}




if (dist(x2, y2, x3, y3) <= 200){
  stroke(0,167,178);
  beginShape(LINES);
vertex(x2, y2);
vertex(x3, y3);
endShape();
 
}


if ((dist(x2, y2, x3, y3) <= 700) & (dist(x1, y1, x3, y3) <= 700)) {
 

  beginShape(TRIANGLES);
vertex(x1, y1);
vertex(x2, y2);
vertex(x3, y3);

endShape();
 
}


if ((dist(x2, y2, x3, y3) <= 300) & (dist(x1, y1, x3, y3) <= 300)) {
 
stroke(0,239,255);
  beginShape(TRIANGLES);
vertex(x1, y1);
vertex(x2, y2);
vertex(x3, y3);

endShape();
 
}





}
  


