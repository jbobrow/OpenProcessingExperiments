
void setup(){
  size(800,300);
  background(255);
  smooth();

  noStroke();
  fill(208, 19, 69);
  int r = 324/2;
  
  for(int i = 0 ; i < 3 ; i++)
  {
    float theta = map(i,0,3,0,TWO_PI);
    float delta = theta + (TWO_PI / (2 * 3));
    arc(width/2,height/2,r,r,theta,delta);
  }

  fill(255);
  stroke(208, 19, 69);
  strokeWeight(5);
  ellipse(width/2,height/2,r/5,r/5);
 
} 

void mouseClicked(){

    link("http://www.cobaltbombalphaomega.com");
}
