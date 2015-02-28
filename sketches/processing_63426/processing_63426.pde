

int st;
float x = 0.0;
float y = 0.0;
float easing = .01;
int spacing = 500;
int fl=255;
float theta; 

void setup() {
  smooth();
  size(1000,800);
  background(255);
}
void draw() {

  fill(fl);
  for(int i=20;i<width+500;i+=spacing) {
    for(int j=20;j<height+500;j+=spacing) {   
      
      float targetX = mouseX;
      float targetY = mouseY;
      x += (targetX-x)*easing;
      y += (targetY-y)*easing;
      float mouseDist = dist(x,y,i,j);
      stroke(0,0,0,mouseDist);
      if (mousePressed==true){fill(0);stroke(255,255,255,mouseDist);}
               
      strokeWeight(mouseDist/20);
      delay(0);

      ellipse(i,j,mouseDist,mouseDist);   
      
    }
  }    
  for(int i=0;i<width/2;i+=40) {
    strokeWeight(5);
    stroke(255);
    line(i,sqrt(i),width/2,height/6);
  }
  stroke(random(0,255));
  strokeWeight(5);
  for(int i=width/2;i<width;i+=50) {
    line(i,sqrt(i),width/2,height/6);
  }

}         

   
//void mouseClicked() {
//  if (fl==255)fl=0;
//} 
    // Whenever we get back here, we "pop" in order to restore the previous matrix state
    
//    // Repeat the same thing, only branch off to the "left" this time!
//    pushMatrix();
//    rotate(-theta);
//    ellipse(0, 0, 0, -h);
//    translate(0, -h);
//    branch(h);
//    popMatrix();


