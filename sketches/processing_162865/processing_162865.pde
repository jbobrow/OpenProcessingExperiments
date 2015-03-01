
float yoff=0.0 ;
float counting=1 ;
PImage turkey ;
 /*@pjs preload="turkey.jpg";*/
 
void setup(){
  size(600, 500) ;
  turkey=loadImage("turkey.JPG") ;  

}

  void draw(){
   
    fill(255);
  beginShape(); 
  float xoff = 0;       
  for (float x = 0; x <= width; x += 10) {
    float y = map(noise(xoff, yoff), 0, 1, 200,300); 
    vertex(x, y); 
    xoff += 0.05;
 
  }
 
  yoff += 0.01;
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);
    for(int i=0;i<=800;i+=5)
    line(i,100,100,i);
 strokeWeight(3) ;
 counting=counting+1 ;
  if(counting==100) ;
    image(turkey, 0, 0) ;
    turkey.resize(600, 500) ;
  filter(POSTERIZE, 6) ;
 
 fill(#FFEA4B);
ellipse(0,0,200,200);

fill(#FCBA99);
rect(0, 415, 98, 200);

fill(#6CFF88);
ellipse(600,0,200,200);

fill(#DD36FF);
triangle(600, 300, 400, 500, 600, 500);
 
 image(turkey, 0, 0) ;
  tint(0, 153, 204, 126);
  image(turkey, 4, 0) ;

}



 


