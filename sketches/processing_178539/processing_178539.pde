
int dropNum = 100; // how many rain drops on your screen??
Snow[] snows = new Snow[dropNum];
float Y=0;
float X=0;
 
void setup()
{
  size(800, 800, P3D);
    noStroke();
  for(int i=0; i<dropNum ;i=i+1){
     snows[i]=new Snow();
  }
}
void draw()
{
  background(#FF9900);
   for(int i=0 ; i<dropNum ; i=i+1){
    snows[i].update();
    }


  lights();

  translate(width/2, height/2, 0);


  pushMatrix();
 
  pushMatrix();

 {
    if(keyPressed)
    {
    if(keyCode == UP) {Y--;}
    if(keyCode == DOWN) {Y++;}
    if(keyCode ==RIGHT) {X++;}
    else if(keyCode == LEFT) {X--;}  
    }
    
    
  }
popMatrix();

  rotateX(radians(-Y));
  rotateY(radians(X));

  pushMatrix();

  pushMatrix();
  stroke(0);
  noFill();
  strokeWeight(10);
  translate(-70, -30, 200);
  ellipse(0, 0, 140, 140);
  ellipse(140, 0, 140, 140);
  line(-70,0,0,-160,-17,-250);
  line(210,0,0,300,-17,-250);
  popMatrix();
  drawMouth(0, 100, 192.4);
  //drawBrow(0.0,100.0,192.0);
  rotateZ(radians(90));
  rotateY(radians(180));
  rotateY(radians(435+25));
  rotateZ(radians(-435+75));

  //drawBackLight(0);
  //drawBackLight();
  noStroke();
  fill(79, 158, 255);
  drawSphere(0, 0, 0, 200);
  //fill(255, 255, 255);
 
  drawEye(160, -50);
  drawEye(160, 50);


  popMatrix();

  fill(79, 158, 255);

  drawSphere(-200, 0, 0, 40);
  drawSphere(200, 0, 0, 40);
  drawSphere(0, 20, 170, 40);
  pushMatrix();
  rotateZ(radians(450));
  rotateY(radians(270));
  rotateX(radians(358));
  scale(2);
  translate(0, 0, -126);
  drawHat(0, 0, 200, 70, 180);
  // rotateX(radians(-90));
  // drawHat(0,0,200,50,130);
  popMatrix();
  popMatrix();
  drawSphere(0, 450, 0, 250);
}
void drawSphere(float x, float y, float z, float r) {
  //fill(242,236,155);
  noStroke();
  pushMatrix();
  translate(x, y, z);

  sphere(r);
  popMatrix();
}
void drawEye(float x, float y) {
  fill(255);
  drawSphere(x, y, 30, 40);
  pushMatrix();
    float posX= map(mouseX, 0, width, 358, 362);
     float posY= map(mouseY,0,height,355,362);

   rotateZ(radians(-posX));
  rotateY(radians(posY));
   fill(0);
  drawSphere(x+30, y, 30, 17); //black eyes
  popMatrix();
}




void drawMouth(float x, float y, float z) {
  pushMatrix();
  translate(x, y, z);
  stroke(0);
  strokeWeight(4);
  noFill();
  beginShape();
  curveVertex(-100, -100, -44);
  curveVertex(-100, -30, -25);
  curveVertex(-80, -50, -17);
  curveVertex(-60, -30, -14);
  curveVertex(-40, -50, -3);
  curveVertex(-20, -30, -3);
  curveVertex(0, -50, 0);
  curveVertex(20, -30, -3);
  curveVertex(40, -50, -3);
  curveVertex(60, -30, -14);
  curveVertex(80, -50, -17);
  curveVertex(100, -30, -25);
  curveVertex(100, -100, -44);
  endShape();
  popMatrix();
  println(mouseX, mouseY);
}
void drawBackLight(float A) {

  float lx=0, ly=0, lz=0;

  float x= mouseX+A;
  float y= mouseY;
  float z=0;

  float rx=random(-100, 100);
  float ry=random(-100, 100);
  float rz=0;

  float sx=random(-100, 100);
  float sy=random(-100, 100);
  float sz=0;

  float cx=(ry*sz-ry*sy);
  float cy=-(rx*sz-rz*sx);
  float cz=0;

  float size = sqrt(cx*cx+cy*cy+cz*cz);
  cx=cx/size;
  cy=cy/size;
  cz=cz/size;

  float brightness = abs(cx*lx+cy*ly+cz*lz);



  noStroke();
  fill(242, 109*brightness, 61, random(50, 250));
  beginShape();
  vertex(0, 0, 0);
  vertex(x+rx, y+ry, z+rz);
  vertex(x+sx, y+sy, z+sz);



  endShape();
}


void drawHat(float x, float y, float z, float r, float h) {
  pushMatrix();
  strokeWeight(30);
  translate(x, y, z);

  float delta = 3;

  for (float az =0; az<h; az+=5) {
    for (float deg = 0; deg<360; deg+=delta) {
      if (az%60 >30) stroke(255);
      else stroke(255);
      float theta = radians(deg);
      float ax = r*cos(theta);
      float ay = r*sin(theta);
      point(ax, ay, az);
    }
    r-=2;
  }
  popMatrix();
}
class Snow { 
 float x = random(0,600);
 float y = random(-1000,0);
 float size = random(10,40); 
 float speed = random(2,5); 
  void update()
  {
    y += speed;
 
    fill(255);
    ellipse(x, y, size, size); 
     
    if (y> height)
     {
       x = random(0,700);
       y = random(-1200,0);
     }
 
  }
}


