
  void setup(){
  size(600,600);
  smooth();
  frameRate(60);
}
 
void draw(){
  if(mousePressed)
  {
  translate(mouseX,mouseY); 
  background(random(255),random(255),random(255));
      strokeWeight(10);
    ellipse( 0,0, 200, 200 );  
    int position =mouseX;
    if (position/10 < 0)
    {
     position= -position; 
    }
    strokeWeight(position/10);
    ellipse(30,-40, random(15), random(15) );
    ellipse( -30,-40, 10, 10 ); 
    triangle(0,10,5,10,2.5,5);
    
beginShape(TRIANGLES);
vertex(-50, 40);
vertex(-20,40);
vertex(-30, 100);
vertex(20, 40);
vertex(50, 40);
vertex(30,100);
endShape();
  rotate( frameCount );
  
  line(80,80,width,height);
 
}
else  background(255);
           
}

