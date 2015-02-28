
PImage body;
PImage bodyBottom;
PImage face1;
PImage face2;
PImage leftArm;
PImage rightArm;
PImage leftLeg;
PImage rightLeg;
PImage donut;

void setup(){
  size(480,640);
  background(255);
  body = loadImage("body.png");
  bodyBottom = loadImage("body_bottom.png");
  face1 = loadImage("face1.png");
  face2 = loadImage("face2.png");
  leftArm = loadImage("left_arm.png");
  rightArm = loadImage("right_arm.png");
  leftLeg = loadImage("left_leg.png");
  rightLeg = loadImage("right_leg.png");
  donut = loadImage("donut50.png");
}

void draw(){
//  fill(255, 15);
//  rect(0, 0, width, height);
  float x1= map(mouseX, 0, width, -1.8, 0);
  float y1= map(mouseY, 0, height, -1,0);
  
  
  image(donut,random(0,480),random(0,640));
  if(x1 > -0.8){
    image(face1,162,24);
  } 
  else{
    image(face2,162,24);
    }
  pushMatrix();
    translate(294 ,258);
    rotate(PI/-4*x1);
    image(rightArm,-25,-148);
  popMatrix();
  pushMatrix();
    translate(270,431);
    rotate(PI/4 * y1);
    image(rightLeg,-14,-62);
  popMatrix();
  image(bodyBottom,154,289);
  pushMatrix();
    translate(260,430);
    rotate(PI/-4* y1);
    image(leftLeg,-130,-31);
  popMatrix();
  image(body,148,196);
  pushMatrix();
    translate(186,267);
    rotate(PI/4*x1);
    image(leftArm,-leftArm.width+24,-leftArm.height+24);
  popMatrix();
  
  println(x1);
}


