
//sphere
float R = 100;
int xDetail = 40;
int yDetail = 30;
float[] xGrid = new float[xDetail+1];
float[] yGrid = new float[yDetail+1];
float[][][] allPoints = new float[xDetail+1][yDetail+1][3];

// Texture
PImage texmap;

//sphere

PImage torso;
PImage rarm;
PImage head;
PImage head2;
PImage larm;
PImage garm;
int state=0;

float wd1=20;
float ht1=150;

void setup()
{
  size (900, 900,P3D);

  torso=loadImage ("torso.png");
  rarm= loadImage ("right-arm.png");
  head= loadImage ("head.png");
  larm= loadImage ("left-arm.png");
  garm= loadImage ("gun-arm.png");
  head2=loadImage ("head2.png");
  
  texmap = loadImage("wax.jpg");
}

void draw()
{
  
  fill(0);
  background(255);
  
  if ((state==0)||(state==1)||(state==2))
  {
  float x1 = map(noise(  millis()/1000.0 ), 0,1,  50, 150); 
  float y1 = map(noise( (millis()+12345)/1357.9), 0,1, 50,200); 
  pushMatrix();
  translate(x1, y1); 
  fill (0);
  noStroke();
  setupSphere(40, xDetail, yDetail);
  drawSphere(texmap);
  popMatrix();
  }
  
  pushMatrix();
  translate (width/2+50, height/2+60);
  if ((state==3)&&(mousePressed))
  {
    rotate (radians(15));
  }
  
  imageMode(CENTER);
  image(torso, 0, 0, 650, 750); 
//  ellipse (0, 0, 20, 20);
  //----  
  translate (30, -280);
//  ellipse (0, 0, 20, 20);
  //  ------
  pushMatrix();
  translate(50, -30); 
 // ellipse (0, 0, 20, 20);
  imageMode(CORNER);
  //rotate (radians (mouseX));
  image (rarm, 0, 0, 180, 290);
  popMatrix();
  //---

  pushMatrix();
  imageMode(CENTER);
  translate (0, -100);
  if (state==0)
  {
    image (head, 0, 0, 140, 140);
  }

  if ((state==1)||(state==2)||(state==3))
  {
    image (head2, 0, 0, 150, 150);
  }

  popMatrix();

  pushMatrix();
  imageMode(CORNER);
  translate(-80, -10);
  image(larm, -135, -20, 150, 80);
//  ellipse (0, 0, 20, 20);

  translate(-120, 40);
  if ((state==2)||(state==3))
  {
    rotate(radians (-70));
  }
  image(garm, -75, -230, 120, 250);
  if((state==3)&&(mousePressed))
  {
  bullet(-10, -250);
  }
//  ellipse (0, 0, 20, 20);

  popMatrix();
  popMatrix();

  
}


void mouseClicked ()
{

  state= state+1;  
  if (state==4)
  {
    state=0;
  }
}

void bullet(int x1, int y1)
{
  //noLoop();

  noFill();
  strokeWeight(1);
  stroke(255, 0, 0);
  arc(x1, y1, random(wd1/2-(wd1/2-60), wd1/2), random(ht1/2-(ht1/2-2), ht1/2), 0, PI/2);
  arc(x1, y1, random(wd1/2-(wd1/2-60), wd1/2), random(ht1/2-(ht1/2-2), ht1/2), PI/2, PI);
  arc(x1, y1, random(wd1/2-(wd1/2-60), wd1/2), random(ht1/2-(ht1/2-2), ht1/2), PI, TWO_PI-PI/2);
  arc(x1, y1, random(wd1/2-(wd1/2-60), wd1/2), random(ht1/2-(ht1/2-2), ht1/2), TWO_PI-PI/2, TWO_PI);

  //arc
  noStroke();
  //fill(random(0, 40), random(70, 100));
  fill(random(231, 255), random(3, 252), random(100), 95);
  arc(x1, y1, random(wd1/2-(wd1/2-60), wd1/2), random(ht1/2-(ht1/2-2), ht1/2), 0, PI/2);
  arc(x1, y1, random(wd1/2-(wd1/2-60), wd1/2), random(ht1/2-(ht1/2-2), ht1/2), PI/2, PI);
  arc(x1, y1, random(wd1/2-(wd1/2-60), wd1/2), random(ht1/2-(ht1/2-2), ht1/2), PI, TWO_PI-PI/2);
  arc(x1, y1, random(wd1/2-(wd1/2-60), wd1/2), random(ht1/2-(ht1/2-2), ht1/2), TWO_PI-PI/2, TWO_PI);
}

////////////////////////////////////////////////////////////////////////
void setupSphere(float R, int xDetail, int yDetail){

  // Create a 2D grid of standardized mercator coordinates
  for(int i = 0; i <= xDetail; i++){
    xGrid[i]= i / (float) xDetail;
  } 
  for(int i = 0; i <= yDetail; i++){
    yGrid[i]= i / (float) yDetail;
  }

  textureMode(NORMALIZED);

  // Transform the 2D grid into a grid of points on the sphere, using the inverse mercator projection
  for(int i = 0; i <= xDetail; i++){
    for(int j = 0; j <= yDetail; j++){
      allPoints[i][j] = mercatorPoint(R, xGrid[i], yGrid[j]);
    }
  }
}

////////////////////////////////////////////////////////////////////////
float[] mercatorPoint(float R, float x, float y){

  float[] thisPoint = new float[3];
  float phi = x*2*PI;
  float theta = PI - y*PI;

  thisPoint[0] = R*sin(theta)*cos(phi);
  thisPoint[1] = R*sin(theta)*sin(phi);
  thisPoint[2] = R*cos(theta);

  return thisPoint;
}

////////////////////////////////////////////////////////////////////////
void drawSphere(PImage Map){

  for(int j = 0; j < yDetail; j++){
    beginShape(TRIANGLE_STRIP);
    texture(Map);
    for(int i = 0; i <= xDetail; i++){
      vertex(allPoints[i][j+1][0],   allPoints[i][j+1][1],   allPoints[i][j+1][2],   xGrid[i],   yGrid[j+1]);
      vertex(allPoints[i][j][0],     allPoints[i][j][1],     allPoints[i][j][2],     xGrid[i],   yGrid[j]);
    }
    endShape(CLOSE);
  }
}
 


