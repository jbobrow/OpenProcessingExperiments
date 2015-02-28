
float h = random(20, 100);
PFont f;
int r = 300;
PImage ph1;
PImage ph2;
PImage ph3;
PImage ph4;
PImage ph5;
PImage ph6;
PImage ph7;
PImage ph8;
PImage ph9;
PImage ph13;
PImage active;
PImage queue;


// a list
FloatList x = new FloatList();
FloatList y = new FloatList();

//variable for the WAVES -----------------------//
int xPos;
int yPos; 
int radX; 
int radY; 
float timeMultiplier;
int colorWave;

//variables for the GLOBE ----------------------//
PImage bg;
PImage texmap;

int sDetail = 35;  // Sphere detail setting
float rotationX = 0;
float rotationY = 0;
float velocityX = 0;
float velocityY = 0;
float globeRadius = 200;
float pushBack = 0;

float[] cx, cz, sphereX, sphereY, sphereZ;
float sinLUT[];
float cosLUT[];
float SINCOS_PRECISION = 0.5;
int SINCOS_LENGTH = int(360.0 / SINCOS_PRECISION);

void setup() {
  size(1000, 800, P3D);
  colorMode(HSB,360,100,100);
  f = loadFont("OratorStd-36.vlw");  
  background(159,9,20);
  texmap = loadImage("world32k.jpg");  
  
  active=loadImage("dreamsactive.png");
  queue=loadImage("dreamsqueue.png");
  ph1=loadImage("1.jpg");
  ph2=loadImage("2.jpg");
  ph3=loadImage("3.jpg");
  ph4=loadImage("4.jpg");
  ph13=loadImage("13.jpg");
  
  initializeSphere(sDetail);

}

void draw() {   // BEGIN DRAW -----------------------------------//
  blurBackground();
  renderGlobe(); 

  

//BACKGROUND BOX STRUCTURE
  drawBoxes(10, 10, 300, 200); // Dreams Active
  drawBoxes(320, 10, 500, 410); // Current Profile Waves View
  drawBoxes(320, 430, 112, 30); // Dream State
  drawBoxes(442, 430, 113, 30); // Dream State
  drawBoxes(565, 430, 112, 30); // Dream State
  drawBoxes(687, 430, 133, 30); // Dream State
  drawBoxes(10, 220, 300, 200); // Dreams Queue
  drawBoxes(10, 430, 300, 330); // Dreams Globe Tracker
  drawBoxes(320, 470, 112, 150); // Current Profile Photo
  drawBoxes(442, 470, 379, 150); // Current Mind Occupations
  drawBoxes(320, 470, 112, 150); // Current Profile Photo
  drawBoxes(442, 470, 379, 150); // Current Mind Occupation
  drawBoxes(320, 630, 93, 150); // Fears
  drawBoxes(422, 630, 93, 150); // Hopes
  drawBoxes(524, 630, 93, 150); // Lust/Love
  drawBoxes(626, 630, 93, 150); // Anxiety
  drawBoxes(728, 630, 93, 150); // Anger
  drawBoxes(830, 10, 160, 410); // Dream Variables
  drawBoxes(830, 430, 160, 60); // Timer
  drawBoxes(830, 500, 160, 300); // Dream History
  
//CURRENT PROFILE WAVES VIEW drawWaves( sinMult, xPos, yPos, radX, radY, timeMultiplier, colorWave)

  drawWaves(30, 500, 40, 3, 1, 2, 159);
  drawWaves(35, 500, 40, 2, 1, 1.5, 180);
    drawWaves(20, 500, 130, 2, 3, 2.2, 330);
    drawWaves(25, 500, 130, 1, 2, 2, 280);
      drawWaves(45, 500, 220, 1, 3, 1, 80);
      drawWaves(50, 500, 220, 3, 2, 1.2, 50);
        drawWaves(60,500, 330, 3, 1, .4, 180);
        drawWaves(63, 500, 330, 2, 3, .6,200);
  
 //TEXT displayText(int fontColor, int fontSize, String title, xFontPos, yFontPos)
  displayText(159, 20, "ACTIVE DREAMS", 25, 40);
    displayText(159, 20, "DREAM QUEUE", 25, 250);
    displayText(159, 20, "GEO LOCATOR", 25, 460);
  
  displayText(159, 24, "BRAIN ACTIVITY", 550, 40);
    displayText(160, 20, "BETA", 430, 60);
    displayText(340, 20, "ALPHA", 430, 150);
    displayText(70, 20, "THETA", 430, 240);
    displayText(190, 20, "DELTA", 430, 360);
  
  displayText(159, 20, "PROFILE", 450, 495);
   displayText(159, 14, "NAME: GABRIELLE PADILLA PATACSIL  | "  , 450, 515);
   displayText(159, 14, "DOB: 1984.07.15  |  SEX: FEMALE  | "  , 450, 530);
   displayText(159, 14, "BIRTHPLACE: CV.CA.USA |  LOCATION: 11217 |"  , 450, 545);
   displayText(159, 14, "OCCUP: STUDENT.PARSONS.DESIGN+TECHNOLOGY"  , 450, 560);
   displayText(159, 14, "SPOUSE: 0.5  |  CHILDREN: 0   |"  , 450, 575);
  
  displayText(159, 16, "ANGER", 323, 650);
    displayText(159, 16, "FEAR", 425, 650);
    displayText(159, 16, "HOPE", 527, 650);
    displayText(159, 16, "LOSS", 629, 650);
    displayText(159, 16, "LUST", 730, 650);
  
  displayText(159, 16, "DREAM VARIABLES", 838, 40);
    displayText(159, 14, "PAST | PRESENT |", 838, 60);
    displayText(159, 14, "FUTURE |      |", 838, 80);
    displayText(159, 14, "     | MEMORIES |", 838, 110);
    displayText(159, 14, "GOALS |   |", 838, 145);
    displayText(159, 14, "FANTASY | REALITY ", 838, 180);
    displayText(159, 14, "POSITIVE |   |", 838, 210);
    displayText(159, 14, "| NEGATIVE |", 838, 230);
    displayText(159, 16, "DREAM HISTORY", 838, 530);
  
  displayTime();
  
  displayImage(ph13,325,475);
    displayImage(active,15,45);
    displayImage(queue,15,255);
    
} // END DRAW ------------------------------------------------------------// 

//Black Boxes Structure
void drawBoxes(int startX, int startY, int boxWidth, int boxHeight) {
  fill(159, 0, 0);
  rect(startX, startY, boxWidth, boxHeight);
}

//IMAGES --------------

void displayImage(PImage imgName, int xImgPos, int yImgPos){

  image(imgName,xImgPos,yImgPos);
  
  //for( int z = 1; z < 15; z+= ph[1])
  //if ((mouseX > 0) && (mouseX < 300) && (mouseY > 460) && (mouseY<height)){
  //  if(mousePressed){
  //    ph1 = ph[z++];
   //   } 
  
  //}
}

//TEXT----------
void displayText(int fontColor, int fontSize, String title, int xFontPos, int yFontPos){
    textFont(f,fontSize);
    fill(fontColor,80,100);  
    text(title,xFontPos, yFontPos);
    
    for (int i = 1; i <= 80; i++) {
    textFont(f,12); 
    float textY = random(10,130);

    //text( "" + char( int( random(1,300)))), random(textX)+320, random(textY)+650);
    text( char( int( random(1,300)))+ " " +char( int( random(1,300))) + char( int( random(1,300))), random(i)+320, textY+650);
    text( " " + char( int( random(1,300)))+ char( int( random(1,300))), random(i)+420, textY+650);
    text( " " + char( int( random(1,300)))+ char( int( random(1,300))) + char( int( random(1,300))), random(i)+520, textY+650);
    text( " " + char( int( random(1,300)))+ char( int( random(1,300))) + char( int( random(1,300))), random(i)+623, textY+650);
    text( " " + char( int( random(1,300)))+ "  " + char( int( random(1,300))), random(i)+725, textY+650);
    float textY2 = random(10,360);
    fill(159,100,i);
    text( " " + char( int( random(40)))+ "  " + char( int( random(40))) + "  " + char( int( random(40))) + "  " + char( int( random(40))) + "  " + char( int( random(40))) + "  " + char( int( random(40))) + char( int( random(40)))+ "  " + char( int( random(40))) + "  " + char( int( random(40))), 
    random(i/250)+325, textY2+40);

  }
}

void displayTime(){
  int s = second();  // Values from 0 - 59
  int m = minute();  // Values from 0 - 59
  int h = hour();    // Values from 0 - 23
  int l = millis();
  textFont(f,18);
  text(h+":"+m+":"+s+":"+l,836, 465);
}

//BLUR THE BACKGROUND---------------------------------------------------------//
void blurBackground(){

  h = (h + 1) % 100;
  stroke(159,80,h);
  noFill();
  filter(BLUR,.75);
  drawBoxes(10, 10, 300, 200); // Dreams Active
  drawBoxes(320, 10, 500, 410); // Current Profile Waves View
  drawBoxes(320, 430, 112, 30); // Dream State
  drawBoxes(442, 430, 113, 30); // Dream State
  drawBoxes(565, 430, 112, 30); // Dream State
  drawBoxes(687, 430, 133, 30); // Dream State
  drawBoxes(10, 220, 300, 200); // Dreams Queue
  //drawBoxes(10, 430, 300, 330); // Dreams Globe Tracker
  drawBoxes(320, 470, 112, 150); // Current Profile Photo
  drawBoxes(442, 470, 379, 150); // Current Mind Occupations
  drawBoxes(320, 470, 112, 150); // Current Profile Photo
  drawBoxes(442, 470, 379, 150); // Current Mind Occupation
  drawBoxes(320, 630, 93, 150); // Anger
  drawBoxes(422, 630, 93, 150); // Fear
  drawBoxes(524, 630, 93, 150); // Hope
  drawBoxes(626, 630, 93, 150); // Loss
  drawBoxes(728, 630, 93, 150); // Lust
  drawBoxes(830, 10, 160, 410); // Dream Options
  drawBoxes(830, 430, 160, 60); // Timer
  drawBoxes(830, 500, 160, 300); // Dream History

}
//END BLUR THE BACKGROUND---------------------------------------------------------//

//BRAIN WAVES---------------------------------------------------------------------------//
void drawWaves(int sinMult, int xPos, int yPos, int radX, int radY, float timeMultiplier, int colorWave){
  int numCircles = 300 ;
  
  float time = timeMultiplier*millis()/200.0;
  for (int i = 1; i <= numCircles; i++) {
    float sine = map(sin(time + TWO_PI/numCircles*i), -1, 1, 0, 1);
    fill(colorWave, 100, 100); 
    ellipse(xPos+600/(numCircles+1)*i, sinMult*sine+yPos, radX, radY);
    noStroke();
    if (mousePressed){
    if((mouseX > 320) && (mouseX < 400) && (mouseY > 630) && (mouseY<height)){
      fill(20,100,100);
      ellipse(xPos+600/(numCircles+1)*i, 10+sinMult*sine+yPos, radX, radY);
      } else if ((mouseX > 420) && (mouseX < 510) && (mouseY > 630) && (mouseY<height)){
      fill(159,1,100);
      ellipse(xPos+600/(numCircles+1)*i, 10+sinMult*sine+yPos, radX, radY);
      } else if ((mouseX > 525) && (mouseX < 610) && (mouseY > 630) && (mouseY<height)){
      fill(50,100,100);
      ellipse(xPos+600/(numCircles+1)*i, 8+sinMult*sine+yPos, radX, radY);
      } else if ((mouseX > 625) && (mouseX < 715) && (mouseY > 630) && (mouseY<height)){
      fill(230,100,100);
      ellipse(xPos+600/(numCircles+1)*i, 8+sinMult*sine+yPos, radX, radY);
      } else if ((mouseX > 730) && (mouseX < 815) && (mouseY > 630) && (mouseY<height)){
      fill(20,100,80);
      ellipse(xPos+600/(numCircles+1)*i, 8+sinMult*sine+yPos, radX, radY);
      } else {
        fill(colorWave, 100, 100); 
        ellipse(xPos+600/(numCircles+1)*i, 6*sine+yPos, radX, radY);
      }
  
  }}


}
//END BRAIN WAVES---------------------------------------------------------------------------//


//GLOBE------------------------------------------------------------------------------------//
void renderGlobe() {
  pushMatrix();
  translate(150, 620, pushBack); //where to put the x,y coordinates of the globe
  pushMatrix();
  noFill();
  stroke(255,200);
  strokeWeight(2);
  popMatrix();
  lights();    
  pushMatrix();
  rotateX( radians(-rotationX) );  
  rotateY( radians(270 - rotationY) );
  fill(200);
  noStroke();
  textureMode(IMAGE);  
  texturedSphere(globeRadius, texmap);
  popMatrix();  
  popMatrix();
  rotationX += velocityX;
  rotationY += velocityY;
  velocityX *= 0.95;
  velocityY *= 0.95;
  
  // Implements mouse control (interaction will be inverse when sphere is  upside down)
  if(mousePressed){
    velocityX += (mouseY-pmouseY) * 0.1;
    velocityY -= (mouseX-pmouseX) * 0.09;
  } else {
    velocityX += .06;
    velocityY -= .08;
  }
}

void initializeSphere(int res)
{
  sinLUT = new float[SINCOS_LENGTH];
  cosLUT = new float[SINCOS_LENGTH];

  for (int i = 0; i < SINCOS_LENGTH; i++) {
    sinLUT[i] = (float) Math.sin(i * DEG_TO_RAD * SINCOS_PRECISION);
    cosLUT[i] = (float) Math.cos(i * DEG_TO_RAD * SINCOS_PRECISION);
  }

  float delta = (float)SINCOS_LENGTH/res;
  float[] cx = new float[res];
  float[] cz = new float[res];
  
  // Calc unit circle in XZ plane
  for (int i = 0; i < res; i++) {
    cx[i] = -cosLUT[(int) (i*delta) % SINCOS_LENGTH];
    cz[i] = sinLUT[(int) (i*delta) % SINCOS_LENGTH];
  }
  
  // Computing vertexlist vertexlist starts at south pole
  int vertCount = res * (res-1) + 2;
  int currVert = 0;
  
  // Re-init arrays to store vertices
  sphereX = new float[vertCount];
  sphereY = new float[vertCount];
  sphereZ = new float[vertCount];
  float angle_step = (SINCOS_LENGTH*0.5f)/res;
  float angle = angle_step;
  
  // Step along Y axis
  for (int i = 1; i < res; i++) {
    float curradius = sinLUT[(int) angle % SINCOS_LENGTH];
    float currY = -cosLUT[(int) angle % SINCOS_LENGTH];
    for (int j = 0; j < res; j++) {
      sphereX[currVert] = cx[j] * curradius;
      sphereY[currVert] = currY;
      sphereZ[currVert++] = cz[j] * curradius;
    }
    angle += angle_step;
  }
  sDetail = res;
}

// Generic routine to draw textured sphere
void texturedSphere(float r, PImage t) {
  int v1,v11,v2;
  r = (r + 240 ) * 0.33;
  beginShape(TRIANGLE_STRIP);
  texture(t);
  float iu=(float)(t.width-1)/(sDetail);
  float iv=(float)(t.height-1)/(sDetail);
  float u=0,v=iv;
  for (int i = 0; i < sDetail; i++) {
    vertex(0, -r, 0,u,0);
    vertex(sphereX[i]*r, sphereY[i]*r, sphereZ[i]*r, u, v);
    u+=iu;
  }
  vertex(0, -r, 0,u,0);
  vertex(sphereX[0]*r, sphereY[0]*r, sphereZ[0]*r, u, v);
  endShape();   
  
  // Middle rings
  int voff = 0;
  for(int i = 2; i < sDetail; i++) {
    v1=v11=voff;
    voff += sDetail;
    v2=voff;
    u=0;
    beginShape(TRIANGLE_STRIP);
    texture(t);
    for (int j = 0; j < sDetail; j++) {
      vertex(sphereX[v1]*r, sphereY[v1]*r, sphereZ[v1++]*r, u, v);
      vertex(sphereX[v2]*r, sphereY[v2]*r, sphereZ[v2++]*r, u, v+iv);
      u+=iu;
    }
  
    // Close each ring
    v1=v11;
    v2=voff;
    vertex(sphereX[v1]*r, sphereY[v1]*r, sphereZ[v1]*r, u, v);
    vertex(sphereX[v2]*r, sphereY[v2]*r, sphereZ[v2]*r, u, v+iv);
    endShape();
    v+=iv;
  }
  u=0;
  
  // Add the northern cap
  beginShape(TRIANGLE_STRIP);
  texture(t);
  for (int i = 0; i < sDetail; i++) {
    v2 = voff + i;
    vertex(sphereX[v2]*r, sphereY[v2]*r, sphereZ[v2]*r, u, v);
    vertex(0, r, 0,u,v+iv);    
    u+=iu;
  }
  vertex(sphereX[voff]*r, sphereY[voff]*r, sphereZ[voff]*r, u, v);
  endShape();
  
}
//END GLOBE---------------------------------------------------------------------------//






