
float x;
float y;
float radius;
float r;

void setup(){
  size(500,500);
  frameRate(50);
  smooth();
}

void draw(){
  background(255);
  
  noStroke();
  fill( 0+frameCount%250 , 200-frameCount%50 , 250-frameCount%500 );
  ellipse(x%500,y%500,20,20);
  ellipse(500-frameCount*5%500,y%500,20,20);
  x=x+5;
  y=y+5;
  ellipse(500-frameCount*5%500,500-frameCount*5%500,20,20);
  ellipse(frameCount*5%500,500-frameCount*5%500,20,20);
  
  ellipseMode(CENTER);
  fill( 0+frameCount%250 , 250-frameCount%50 , 250-frameCount%500 , 250-(250+frameCount*5)%500);
  ellipse(width/2,height/2,radius,radius);
  radius=(250+frameCount*5+5)%500;
  


}



