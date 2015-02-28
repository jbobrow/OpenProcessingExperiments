
int space=30;

void setup() {
  size(400,400);
}

void draw() {
  background(mouseX,mouseY,100);
    frameRate(8);

  stroke(0);
  line(space,space,width-space,height-space);
  line(space,height-space,width-space,space);
  noStroke();
  fill(0,mouseX,mouseY);
  ellipse(mouseX-30,mouseY-30,50,50);
  
  if(mouseY>height/2) {
    fill(255);
    ellipse(200,200,75,75);
  }
  
  
  if((mouseX<300)&(mouseX>200)&(mouseY>50)&(mouseY<150)){
    fill(0);
    rect(0,0,400,400);
  }


  if(mouseX>300){
    frameRate(100);
    fill(40);
    rect(mouseX-60,mouseY-60,75,75);
  }
  
  if((mouseX>300)&(mouseY>250)){
    fill(255,102,0);
    arc(200, 200,75,75,0,HALF_PI);
    fill(50,60);
    rect(200,200,200,200);
  }
}
