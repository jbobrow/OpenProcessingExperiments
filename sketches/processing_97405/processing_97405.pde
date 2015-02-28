
float angle;
int frame;
int x =250;

void setup() {
  size(400, 400);
  strokeWeight(6);
}

void draw() {
   background(130,210,250);
    if(mousePressed){
    angle = (PI+frame)*0.02;
  }else{
    
  angle =random(-1, 1)*0.04;
  }
  //cloud background
  fill(255,100);
  noStroke();
  ellipse(x,height/4,50,50);
  ellipse(x+25,height/4,60,60);
  ellipse(x+50,height/4,50,50);
  
  ellipse(x-100,height*3/4,50,50);
  ellipse(x+25-100,height*3/4,60,60);
  ellipse(x+50-100,height*3/4,50,50);
  x++;
  if(x>width){
    x =0;
  }
  
  pushMatrix();
  translate(mouseX, mouseY);
  scale(1.5);
  rotate(angle);
 
  AnT();
  popMatrix();
  frame ++;
}
void AnT() {

  //+
  stroke(mouseX/2, mouseY/2, 200);
  line(-20, 0, 20, 0);
  line(0, -20, 0, 20);

  //A

  stroke(200, mouseX/2, mouseY/2);
  line(-65, 0, -55, 0);
  line(-60, -20, -70, 20);
  line(-60, -20, -50, 20);

  //T
  stroke(mouseX/2, 200, mouseY/2);
  line(50, -20, 50, 20);
  line(40, -20, 60, -20);
}
