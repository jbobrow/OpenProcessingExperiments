
float angle = 0.0;
float speed = 0.7;
float p = 80; // insect radius
float p_e = 15; // insect eyes radius
float p_d = 5;
float p_i = 13;
float delta = 3;
float t = 1;
float rad = radians (120) ;
float a = 0;
float r = -1;
float m = 2;
float x = 5;
int spacing = 30;



float YellowX;
boolean movingLeft = true;

float YellowY;


void setup() {
  size(800, 800, P3D);

  ambientLight(100, 100, 100);
  lightSpecular(204, 204, 204);
  directionalLight(100, 100, 100, 0, 0, -1);


  YellowX = 8;
  YellowY = 460;
}


void draw() {
  background(0, 150, 200);
  pushMatrix();
  translate(400, 550);

  rotateY(radians(mouseX/3));

  angle+=speed; // determined speed of insect


  ///
  ///
  ///



  pushMatrix();
  noStroke();
  //head

  background(100, 204, 255);
  fill(200, 200, 150);
  rad++;
  translate(0, -270, -50);

  rotateY(radians(270));
  sphere(80);



  pushMatrix();
  translate(10, -60, 5);
  fill(200, 120, 120);
  // rotateZ(sin(frameCount/2));
  box(200, 20, 200);
  popMatrix();

  pushMatrix();
  translate(0, -110, 5);
  fill(200, 120, 120);
  // rotateZ(sin(frameCount/2));
  box(100, 50, 100);
  popMatrix();
  pushMatrix();
  translate(0, -90, 5);
  fill(0);
  // rotateZ(sin(frameCount/2));
  box(110, 10, 110);
  popMatrix();
  //right eye
  pushMatrix();
  translate(-50, -20, -26);

  rotateZ(random(frameRate));
  fill(100, 200, 50);
  if (mousePressed==true) {
    fill(200, 200, 150);
  }
  box(5);
  popMatrix();
  //left eye
  pushMatrix();
  translate(-50, -20, 26);

  rotateZ(random(frameRate));
  box(5);
  popMatrix();
  //mouth
  fill(150, 50, 10);
  pushMatrix();
  translate(-50, 30, 5);
  rotateY(radians(10));
  box(5, 5, 50);
  popMatrix();
  //body
  pushMatrix();
  translate(0, 100, 0);
  fill(100, 120, 80);

  box(70, 90, 100);
  popMatrix();
  //second body
  pushMatrix();
  translate(0, 155, 0);
  fill(10, 20, 80);

  box(70, 20, 80);
  popMatrix();
  //neck
  pushMatrix();
  translate(0, 70);

  box(30, 80, 10);
  popMatrix();
  //nose
  pushMatrix();
  translate(-50, -5, 0);
  rotateY(radians(10));
  box(20, x, 10);
  if (x <= 30) {
    x++;
  } else if (x >30) {
    x= r;
  }
  popMatrix();
  //right foot
  pushMatrix();
  translate(0, 180, -20);
  fill(200, 120, 50);
  // rotateZ(sin(frameCount/2));
  box(20, 70, 20);
  popMatrix();
  //left foot
  pushMatrix();
  translate(0, 180, 20);
  //rotateZ(sin(frameCount/4));
  box(20, 70, 20);
  popMatrix();
  //right hand
  pushMatrix();
  translate(-20, 90, -60);
  fill(230, 100, 100);
  rotateZ(-sin(frameCount/3));
  translate(0, 15, 0);
  box(10, 60, 20);
  popMatrix();


  //left hand
  pushMatrix();
  translate(-20, 70, 60);
  fill(230, 200, 100);
  rotateZ(radians(90));
  rotateZ(-sin(frameCount/1));
  translate(0, 15, 0);
  box(10, 60, 20);
  popMatrix();
  //left ear
  pushMatrix();
  translate(0, 5, 55);
  fill(200, 250, 100);
  rotateZ(radians(90));
  translate(-350, 15, 0);
  box(20, 20, 10);
  popMatrix();
  //right ear
  pushMatrix();
  translate(0, 5, -55);
  fill(200, 250, 100); 
  rotateZ(radians(90));
  translate(-350, 15, 0);
  box(20, 20, 10);
  popMatrix();

  rotateY(radians(90));
  translate(-149, 80, 40);
  text("", 100, 0);
  popMatrix();



  ///////////// draw 3D insect Body ///////////////

  for (float pi = 0; pi < 360; pi += 10)
  {
    for (float deg = 0; deg <360; deg += delta)
    {
      stroke(70, 250, 150);
      strokeWeight(10);
      float theta = radians(deg);
      float x1 = p * sin(pi) * cos(theta);
      float y1 = p * sin(pi) * sin(theta);
      float z1 = p * cos(pi);
      point(x1 +(sin(angle+PI)*10), y1, z1 + 240);

      float x2 = p * sin(pi) * cos(theta);
      float y2 = p * sin(pi) * sin(theta);
      float z2 = p * cos(pi);
      point(x2 + (sin(angle+HALF_PI)*10), y2, z2 + 80);

      float x3 = p * sin(pi) * cos(theta);
      float y3 = p * sin(pi) * sin(theta);
      float z3 = p * cos(pi);
      point(x3+(sin(angle+QUARTER_PI)*10), y3, z3 - 80);

      float x4 = p * sin(pi) * cos(theta);
      float y4 = p * sin(pi) * sin(theta);
      float z4 = p * cos(pi);
      point(x4+(sin(angle+30)*10), y4, z4 - 240);
      stroke(0);
      strokeWeight(5);

      float x5 = p_e * sin(pi) * cos(theta);
      float y5 = p_e * sin(pi) * sin(theta);
      float z5 = p_e * cos(pi);
      point(x5+(sin(angle+30)*10)- 20, y5 - 25, z5 - 320);

      float x6 = p_e * sin(pi) * cos(theta);
      float y6 = p_e * sin(pi) * sin(theta);
      float z6 = p_e * cos(pi);
      point(x6+(sin(angle+30)*10) + 20, y6 - 25, z6 - 320);


      stroke(255);
      strokeWeight(5);

      float x8 = p_i * sin(pi) * cos(theta);
      float y8 = p_i * sin(pi) * sin(theta);
      float z8 = p_i * cos(pi);
      point(x8+(sin(angle+30)*10)+10, y8-270, z8 -128);
      stroke(0);
      strokeWeight(5);

      float x7 = p_d * sin(pi) * cos(theta);
      float y7 = p_d * sin(pi) * sin(theta);
      float z7 = p_d * cos(pi);
      point(x7+(sin(angle+30)*10)+10, y7-270, z7-138);

      stroke(255);
      strokeWeight(5);

      float x9 = p_i * sin(pi) * cos(theta);
      float y9 = p_i * sin(pi) * sin(theta);
      float z9 = p_i * cos(pi);
      point(x8+(sin(angle+30)*10)-10, y8-270, z8 -128);
      stroke(0);
      strokeWeight(5);

      float x10 = p_d * sin(pi) * cos(theta);
      float y10 = p_d * sin(pi) * sin(theta);
      float z10 = p_d * cos(pi);
      point(x7+(sin(angle+30)*10)-10, y7-270, z7-138);
    }
  }

  popMatrix();
  /////////Shape of clouds///////////

  fill(80, 240);
  rect(0, 600, 800, 800);


  drawYellow(YellowX, YellowY);
  if (mousePressed) {
    YellowX = YellowX - random(11, 13);           //makes the lines go faster when the mouse is pushed
  } else {
    YellowX = YellowX + 1;
  }
  if (YellowX < -width) YellowX = YellowX+width+spacing;

  if (mousePressed) {
    fill(random(255), random(255), random(255), random(100, 255));
    rect(0, 0, width, height);
  }
}

void drawYellow(float YellowX, float YellowY) {


  stroke(1);
  strokeWeight(1);
  fill(255, 255, 0);
  rect(YellowX, YellowY+200, 50, 10);
  rect(YellowX+90, YellowY+200, 50, 10);
  rect(YellowX+180, YellowY+200, 50, 10);
  rect(YellowX+270, YellowY+200, 50, 10);
  rect(YellowX+360, YellowY+200, 50, 10);
  rect(YellowX+450, YellowY+200, 50, 10);
  rect(YellowX+540, YellowY+200, 50, 10);


  rect(YellowX + width + spacing, YellowY+200, 50, 10);
  rect(YellowX+90 + width + spacing, YellowY+200, 50, 10);
  rect(YellowX+180 + width + spacing, YellowY+200, 50, 10);
  rect(YellowX+270 + width + spacing, YellowY+200, 50, 10);
  rect(YellowX+360 + width + spacing, YellowY+200, 50, 10);
  rect(YellowX+450 + width + spacing, YellowY+200, 50, 10);
  rect(YellowX+540 + width + spacing, YellowY+200, 50, 10);
}



