
float delta = 3;
float r = 17;
float pi = 100;
float burnPart = 10;
float a=0;


void setup() {
  size(600, 600, P3D);
}

void draw() {
  background(#C4F0EC);
  //blue head
  pushMatrix();
  translate(300, 103, 0);
  noStroke();
  fill(#D86A02);
  sphere(70);
  popMatrix();

  //white face
  pushMatrix();
  fill(255);
  translate(300, 128, 17);
  noStroke();
  fill(255-a);
  sphere(58);
  popMatrix();


  //right eye
  pushMatrix();
  translate(320, 137, 80);
  noStroke();
  fill(0);
  sphere(4);

  stroke(#FF8D00);
  strokeWeight(5);

  for (float z = 0; z < 1.5; z+=5) {
    for (float deg = 0; deg < 360; deg += delta) {
      float theta = radians(deg);
      float x = r * cos(theta);
      float y = r * sin(theta);
      point(x, y, z);
    }
  }
  popMatrix();


  //left eye
  pushMatrix();
  translate(280, 137, 80);
  noStroke();
  fill(0);
  sphere(4);


  stroke(#FF8D00);
  strokeWeight(5);


  for (float z = 0; z < 1.5; z+=5) {
    for (float deg = 0; deg < 360; deg += delta) {
      float theta = radians(deg);
      float x = r * cos(theta);
      float y = r * sin(theta);
      point(x, y, z);
    }
  }
  popMatrix();

  //mouth

  pushMatrix();

  noFill();
  beginShape();
  translate(300, 300, 0);
  vertex(-20, -130, 80);
  bezierVertex(-5, -115, 80, 5, -115, 80, 20, -130, 80);
  endShape();


  popMatrix();

  //body
  pushMatrix();

  fill(255-a,253-a,209-a);
  noStroke();
  translate(300, 220, 0);
  scale(1.3, 2, 1);
  sphere(50);

  popMatrix();
  
  //right arm
  pushMatrix();
  
  fill(255-a,253-a,209-a);
  noStroke();
  translate(370, 185, 0);
  rotateZ(radians(30+a));
  scale(3, 0.1, 1);
  sphere(40);
  
  
  popMatrix();
  
  //left arm
   pushMatrix();
  
  fill(255-a,253-a,209-a);
  noStroke();
  translate(230, 185, 0);
  rotateZ(radians(-30-a));
  scale(3, 0.1, 1);
  sphere(40);
  
  popMatrix();

  //right leg
  pushMatrix();
  
  fill(255-a,253-a,209-a);
  noStroke();
  translate(330, 270,0);
  scale(0.4, 4,1);
  sphere(40);
  
  popMatrix();
  
  //left leg
  pushMatrix();
  
  fill(255-a,253-a,209-a);
  noStroke();
  translate(270, 270,0);
  scale(0.4, 4,1);
  sphere(40);
  
  popMatrix();
  
  //right foot
  pushMatrix();
  
  fill(#F7B407);
  noStroke();
  translate(330,400,0);
  rotateX(radians(30));
  scale(0.6, 4, 1);
  sphere(14);
  
  popMatrix();
  
  //left foot
   pushMatrix();
  
  fill(#F7B407);
  noStroke();
  translate(270,400,0);
  rotateX(radians(30));
  scale(0.6, 4, 1);
  sphere(14);
  
  popMatrix();
  
  
  //cigar
  // pushMatrix();

  translate(20, height/1.3, 0);
  rotateY(radians(350));



  strokeWeight(1.5);
  stroke(#D8D8D8);

  // cylinder
  fill(255);
  for (float x = 0; x<200; x+=5) {
    beginShape();
    if (x>(200-burnPart)) fill(255, 0, 0);
    else if (x < 60) fill(#EA9407);
    else fill(255);  

    for (float deg = 0; deg < 360; deg += delta) {
      float theta = radians(deg);
      float y = r * cos(theta);
      float z = r * sin(theta);
      vertex(x, y, z);
    }
    endShape();

    //popMatrix();
  }
}

void mouseClicked( ){
  if(a<=30){
    a+=5;
  }else{
    a=0;
  }
}
void mousePressed() {

  if ( burnPart>70) { // reset
    burnPart = 10;

    background(255);
    return;
  }

  burnPart+=10;

  for ( float a=0; a<200; a+=5);
}


