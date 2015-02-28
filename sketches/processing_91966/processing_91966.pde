
void setup() {
  size(300, 400, P3D);
}

void draw() {
  background(255);
  translate(width/2, height*3/5, 0);
  noStroke();
  
  ambientLight(100, 100, 100);
  lightSpecular(204, 204, 204);
  directionalLight(100, 100, 100, 0, 0, -1);
  specular(255, 255, 255);
  shininess(5.0);

  rotateX(radians(((mouseY/(float)height)*180)-90));
  rotateY(radians(((mouseX/(float)height)*180)-90));

  //swing
  pushMatrix();
    translate(0, 40, -22);
    pushMatrix();
      translate(-75, -170, 0);
      scale(1, 70, 1);
      fill(0);
      box(5);
      translate(150, 0, 0);
      box(5);
    popMatrix();
    scale(15, 1, 6);
    box(10);
  popMatrix();
  
  //body
  pushMatrix();
    scale(1.5, 1.3, 1);
    fill(183, 224, 31);
    box(50);
    noFill();
    translate(-15, -5, 0);
    for (int i=0;i<3;i++) {
      pushMatrix();
        translate(15*i, 0, 25);
        //buttons
        fill(255);
          if (mousePressed==true) {
            fill(random(255), random(255), random(255));
          }
        box(5);
      popMatrix();
    }
  popMatrix();

  //neck
  pushMatrix();
    translate(0, -37, 0);
    scale(7, 1, 5);
    fill(255, 147, 38);
    box(10);
  popMatrix();

  //head
  translate(0, -80, 0);

  pushMatrix();
    fill(183, 224, 31);
    scale(2.1, 1.5, 1);
    box(50);
  popMatrix();

  pushMatrix();
    translate(0, -55, 0);
    scale(.2, 1.7, .2);
    fill(255, 147, 38);
    box(20);
  popMatrix();

  pushMatrix();
    translate(0, -80, 0);
    rotateZ(15);
    fill(15, 170, 177);
    if (mousePressed==true) {
      fill(random(255), random(255), random(255));
      rotateX(sin(frameCount/5));
    }
    box(10);
  popMatrix();

  //eyes.
  pushMatrix();
    translate(-25, 0, 20);
    fill(255);
    if (mousePressed==true) {
      for(int i=0;i<=5;i+=1){
        scale(1,1-0.1*i,1);
      }
    }
    box(20);
    translate(0, 0, 5);
    fill(15, 170, 177);
    box(15);
    translate(50, 0, -5);
    fill(255);
    box(20);
    translate(0, 0, 5);
    fill(15, 170, 177);
    box(15);
  popMatrix();
  
  //arms&shoulders;
  translate(-55, 80, 0);
  
  pushMatrix();
    rotateZ(PI/6);
    translate(0, -10, 0);
 
    pushMatrix();
      translate(0, -10, 0);
      rotateZ(-PI/6);
      scale(1, 1, 1.3);
      fill(235, 38, 93);
      box(22);
    popMatrix();
    
    rotateZ(-sin(frameCount/10));
 
    pushMatrix();
      rotateZ(PI/10);
      translate(0, 10, 0);
      scale(.4, 2, .5);
      fill(183, 224, 31);
      box(20);
    popMatrix();
    
    translate(-10, 35, 0);
    scale(.4, 1, .5);
    fill(15, 170, 177);
    box(20);
  popMatrix();

  translate(110, 0, 0);

  pushMatrix();
    rotateZ(-PI/6);
    translate(0, -10, 0);
    pushMatrix();
      translate(0, -10, 0);
      rotateZ(PI/6);
      scale(1, 1, 1.3);
      fill(235,38,93);
      box(22);
    popMatrix();
    
    rotateZ(sin(frameCount/10));
    
    pushMatrix();
      rotateZ(-PI/10);
      translate(0, 10, 0);
      scale(.4, 2, .5);
      fill(183, 224, 31);
      box(20);
    popMatrix();
    
    translate(8, 35, 0);
    scale(.4, 1, .5);
    fill(15, 170, 177);
    box(20);
  popMatrix();

  //legs
  translate(-70, 30, 0);

  pushMatrix();
    rotateX(sin(frameCount/11));
    pushMatrix();
      translate(0, 0, 10);
      scale(.6, .3, 1.4);
      fill(183, 224, 31);
      box(20);
    popMatrix();
    translate(0, 20, 30);
    pushMatrix();
      translate(0, 20, 0);
      fill(15, 170, 177);
      box(15);
    popMatrix();
    scale(.3, 2.3, .6);
    fill(183, 224, 31);
    box(20);
  popMatrix();

  translate(30, 0, 0);

  pushMatrix();
    rotateX(sin(frameCount/11));
    pushMatrix();
      translate(0, 0, 10);
      scale(.6, .3, 1.4);
      fill(183, 224, 31);
      box(20);
    popMatrix();
    translate(0, 20, 30);
      pushMatrix();
      translate(0, 20, 0);
      fill(15, 170, 177);
      box(15);
    popMatrix();
    scale(.3, 2.3, .6);
    fill(183, 224, 31);
    box(20);
  popMatrix();
}

