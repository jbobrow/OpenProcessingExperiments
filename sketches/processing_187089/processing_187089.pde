
int w,h;


void setup (){
  size (1000,600);
  colorMode (HSB, 255);
  smooth ();
  noFill();
  background (255);
   
}

void draw(){
  stroke(random(255),random(255),random(255)); 
}
  void mouseMoved(){
    ellipseMode(CENTER);
  //for (int i = 0; i < 100; i++) {
  //float w = random(-50.50);}
    ellipse(width/4,height/4,mouseX,mouseX);
    ellipse((width/4)*3,height/4,mouseX,mouseX);
    ellipse(width/4,(height/4)*3,mouseX,mouseX);
    ellipse((width/4)*3,(height/4)*3,mouseX,mouseX);
    ellipse(width/2,height/2,mouseX,mouseX);
    ellipse(width/2,height/2,(mouseX)/2,(mouseY)/2);
  }


