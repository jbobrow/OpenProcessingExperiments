
int radi=20;

void setup() {
  size (600, 600);
  stroke(255, 255, 255);
  smooth();
  ellipseMode(CENTER);
  background(0);
}

void draw(){
  //fill(0,0,0,1);
  //rect(0,0,width,height);
  noFill();
  for(int x=radi; x<width/2; x+=radi*2){
  float rand=random(-mouseX/50, mouseX/50);
 /* if(mouseX<width/4){
    rand=.00f;
  }
  else if(mouseX<width/4+(width/4)){
    rand=.01f;
  }
  else if(mouseX<width/4+2*(width/4)){
    rand=.02f;
  }
  else {
    rand=.03f;
  }*/
  stroke(rand*3+100,rand*3+50,rand*3);
  pushMatrix();
  translate(width/2+rand,height/2+rand);
  rotate(radians((frameCount+rand)60+rand));
  ellipse(x,x,radi+rand,radi+rand);
  popMatrix();
  pushMatrix();
  translate(width/2+rand,height/2+rand);
  rotate(radians((-frameCount+rand)60));
  ellipse(x+radi,x+radi,radi+rand,radi+rand);
  popMatrix();
  System.out.println(rand);
  }
}
