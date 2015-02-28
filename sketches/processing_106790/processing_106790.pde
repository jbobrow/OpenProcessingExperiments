
/* @pjs font="OratorStd-36.vlw"; */

PFont f;
float hc = random(10, 40);
String[] rawData;
String[][] data; //the double [][] makes a 2D array
int dreamer;
boolean anger, fear, hope, loss, lust, normal;
PImage backImg;

boolean clicked;
Button[] p = new Button[15];
dreamVariable[] v = new dreamVariable[8];// v, v2, v3, v4, v5, v6, v7, v8;
Timer[] timers = new Timer[3];// t, t2, t3;
Globe[] glo = new Globe[1];


void setup() {
  size(1000, 800, P3D);
  colorMode(HSB, 360, 100, 100);
  f = loadFont("OratorStd-36.vlw");  
  backImg = loadImage("backimageDreamb.png");
  
  rawData = loadStrings("profiles.csv");
  splitData();
  p[0] = new Button(1, 15, 190);
  p[1] = new Button(2, 74, 190);
  p[2] = new Button(3, 133, 190);
  p[3] = new Button(4, 193, 190);
  p[4] = new Button(5, 252, 190);
  p[5] = new Button(6, 15, 250);
  p[6] = new Button(7, 74, 250);
  p[7] = new Button(8, 133, 250);
  p[8] = new Button(9, 193, 250);
  p[9] = new Button(10, 252, 250);
  p[10] = new Button(11, 15, 310);
  p[11] = new Button(12, 74, 310);
  p[12] = new Button(13, 133, 310);
  p[13] = new Button(14, 193, 310);
  p[14] = new Button(15, 252, 310);

  v[0]= new dreamVariable(" FANTASY", 845, 50, 80, 20);
  v[1]= new dreamVariable(" REALITY", 845, 75, 80, 20);
  v[2]= new dreamVariable(" PAST", 845, 100, 80, 20);
  v[3]= new dreamVariable(" PRESENT", 845, 125, 80, 20);
  v[4]= new dreamVariable(" FUTURE", 845, 150, 80, 20);
  v[5]= new dreamVariable(" POSITIVE", 845, 175, 80, 20);
  v[6]= new dreamVariable(" NEGATIVE", 845, 200, 80, 20);
  
  glo[0] = new Globe();


  timers[0] = new Timer( 30, 845, 300, 40, 30);
  timers[1] = new Timer( 40, 890, 300, 40, 30);
  timers[2] = new Timer( 60, 935, 300, 40, 30);
}

void draw() {    
  //println(dreamer);

  //blurBackground();
  image(backImg, 0, 0);

  //BACKGROUND
  
  
  drawBoxes(10, 10, 300, 140); // Dreams Active
  drawBoxes(320, 10, 500, 390); // Current Profile Waves View
  drawBoxes(10, 160, 300, 240); // Dreams Queue
  drawBoxes(10, 410, 300, 330); // Dreams Globe Tracker
  drawBoxes(320, 410, 100, 130); // Current Profile Photo
  drawBoxes(430, 410, 391, 130); // Current Profile
  drawBoxes(320, 550, 379+112+10, 40); // Current Mind Occupations
  drawBoxes(320, 600, 93, 150); // Fears
  drawBoxes(422, 600, 93, 150); // Hopes
  drawBoxes(524, 600, 93, 150); // Lust/Love
  drawBoxes(626, 600, 93, 150); // Anxiety
  drawBoxes(728, 600, 93, 150); // Anger
  drawBoxes(830, 10, 160, 250); // Dream Variables
  drawBoxes(830, 270, 160, 130); // Timer
  drawBoxes(830, 410, 160, 380); // Dream History



  //TEXT displayText(int fontColor, int fontSize, String title, xFontPos, yFontPos)
  displayText(205, 100, 20, "ACTIVE DREAMS", 25, 40);
  displayText(205, 100, 20, "DREAM QUEUE", 25, 185);
  displayText(205, 100, 20, "GEO LOCATOR", 25, 430 );

  displayText(205,100, 24, "BRAIN ACTIVITY", 500, 40);
  displayText(205, 850, 20, "BETA", 360, 60);
  displayText(205,80, 20, "ALPHA", 360, 150);
  displayText(205, 90, 20, "THETA", 360, 240);
  displayText(205, 90, 20, "DELTA", 360, 330);

  displayText(205, 90, 16, "CURRENT CONFLICT", 325, 570);
  displayText(205, 60, 16, "ANGER", 323, 620);
  displayText(205, 50, 16, "FEAR", 425, 620);
  displayText(205, 70, 16, "HOPE", 527, 620);
  displayText(205, 56, 16, "LOSS", 629, 620);
  displayText(205, 70, 16, "LUST", 730, 620);

  displayText(205, 90, 16, "DREAM VARIABLES", 838, 40);
  displayText(205, 100, 16, "TIMER", 838, 290);

  //BUTTON
  for ( int s = 0; s<15; s++) {
    p[s].run();
  }

  for ( int o = 0; o < 7; o++) {
    v[o].run();
  }

  for ( int i = 0; i < 3; i++) {
    timers[i].run();
  }
  
  glo[0].run();
    
    }
  
  
  
  





void displayText(int fontColor, int fontSat, int fontSize, String title, int xFontPos, int yFontPos) {
  textFont(f, fontSize);
  fill(fontColor, fontSat, 100);  
  text(title, xFontPos, yFontPos);
  for (int i = 1; i <= 225; i++) {
    textFont(f,12); 
    float textY = random(50,130);
    fill(190, 20, textY-30, 20);
    text( "dream", random(i)+15, textY);
  }
  
  
}




void drawBoxes(int startX, int startY, int boxWidth, int boxHeight) {
   fill(195, 15,90, 30);
  rect(startX, startY, boxWidth, boxHeight, 10, 10, 10, 10);
}



void mouseClicked() {

  for (int s = 0; s < 15; s++) {
    if (p[s].check()) {
      for ( int r = 0; r < 15; r++) {
        p[r].selected = false;
      }
      p[s].selected = true;
    
      for ( int j = 0; j < 3; j++) {
        timers[j].button_pressed = false;
      }
    }
    if (p[s].selected) {
       if ( mouseX > 320 && mouseX < 420 && mouseY > 410 && mouseY < 520){
        normal = !normal; println("NORMAL");}
    } 
      if ( mouseX > 320 && mouseX < 410 && mouseY > 600) {
        anger = !anger; println("ANGER");
      }  if ( mouseX > 425 && mouseX < 510 && mouseY > 600) {
        fear = !fear; println("FEAR");
      }  if ( mouseX > 525 && mouseX < 610 && mouseY > 600) {
        hope = !hope; println("HOPE");
      }  if ( mouseX > 625 && mouseX < 710 && mouseY > 600) {
        loss = !loss; println("LOSS");
      }  if ( mouseX > 728 && mouseX < 810 && mouseY > 600) {
        lust = !lust; println("LUST");
      } 
  }

  for ( int i = 0; i < 3; i++) {
    if ( timers[i].check()) {
      for ( int j = 0; j < 3; j++) {
        timers[j].button_pressed = false;
      }
      timers[i].button_pressed = true;
    }
  }
  
  
  
   
  
  
  
  
}

class Button {
  int imgX;
  int imgY;
  float w;
  float h;
  int num;
  //  int j;
  PImage img;
  PImage imgB;

  int xspacing = 2;   // How far apart should each horizontal location be spaced
  int wWaves;              // Width of entire wave
  int maxwaves = 8;   // total # of waves to add together

  float theta = 0.0;
  float[] amplitude = new float[maxwaves];   // Height of wave
  float[] dx = new float[maxwaves];          // Value for incrementing X, to be calculated as a function of period and xspacing
  float[] yvalues;    

  boolean selected;



  Button(int nom, int x, int y) {

    num = nom;
    w = 54;
    h = 55;
    imgX = x;
    imgY = y;
    img=loadImage(num+".png");
    imgB=loadImage(num+"b.png");

    wWaves = 400;

    for (int i = 0; i < maxwaves; i++) {
      amplitude[i] = random(5, 40);
      float period = random(100, 300); // How many pixels before the wave repeats
      dx[i] = (TWO_PI / period) * xspacing;
    }

    yvalues = new float[wWaves/xspacing];
  }

  void run() {
   
    //x=imgX;
    //y=imgY;

    
    if (selected) {
      displayText();
      //dreamHistory();
      calcWave();
      renderWave();
      dreamer = num;
    }
    
     
    image(imgB, imgX, imgY);
  }


  boolean check() {
    if (mouseX>imgX && mouseX<imgX+w && mouseY >imgY && mouseY<imgY+w) {
      // dreamer = num;
      println("something was click");
      return true;
    } else { 
      return false;
    }
  }
  
  void calcWave() {
    // Increment theta (try different values for 'angular velocity' here
    theta += 0.2;

    // Set all height values to zero
    for (int i = 0; i < yvalues.length; i++) {
      yvalues[i] = 0;
    }

    // Accumulate wave height values
    for (int j = 0; j < maxwaves; j++) {
      float x = theta;

      for (int i = 0; i < yvalues.length; i++) {
        // Every other wave is cosine instead of sine
        if (j % 2 == 0)  yvalues[i] += sin(x)*amplitude[j];
        else yvalues[i] += cos(x)*amplitude[j];
        x+=dx[j];
      }
    }
  }

  void renderWave() {
    // A simple way to draw the wave with an ellipse at each location
    noStroke();
    fill(205, 50, 100);
    ellipseMode(CENTER);
    
    for (int x = 0; x < yvalues.length; x++) {
      ellipse(x*xspacing+400, 100+yvalues[x]*float(data[dreamer][15]), 2,3);
      ellipse(x*xspacing+400, 200+yvalues[x]*float(data[dreamer][16]),3,2);
      ellipse(x*xspacing+400, 280+yvalues[x]*float(data[dreamer][17]), 3, 2);
      ellipse(x*xspacing+400, 330+yvalues[x]*float(data[dreamer][18]), 2, 3); 
      
      if ( anger){
      fill(355,70,80);
      ellipse(x*xspacing+400, 100+yvalues[x]*(float(data[dreamer][15]) * 1.6), 5, 5);
      ellipse(x*xspacing+400, 200+yvalues[x]*(float(data[dreamer][16])* 1.5), 5, 5);
      ellipse(x*xspacing+400, 280+yvalues[x]*(float(data[dreamer][17]) *1.6), 5, 5);
      ellipse(x*xspacing+400, 330+yvalues[x]*(float(data[dreamer][18]) *1.5), 5, 5);
    } 
    else if( fear) {
      fill(215,20,90);
      ellipse(x*xspacing+400, 100+yvalues[x]*(float(data[dreamer][15]) * 1.8), 5, 5);
      ellipse(x*xspacing+400, 200+yvalues[x]*(float(data[dreamer][16])* 1.7), 5, 5);
      ellipse(x*xspacing+400, 280+yvalues[x]*(float(data[dreamer][17]) *1.6), 5, 5);
      ellipse(x*xspacing+400, 330+yvalues[x]*(float(data[dreamer][18]) *1.4), 5, 5);
    }
    else if( hope) {
      fill(60,70,80);
      ellipse(x*xspacing+400, 100+yvalues[x]*(float(data[dreamer][15]) * 0.7), 5, 5);
      ellipse(x*xspacing+400, 200+yvalues[x]*(float(data[dreamer][16])* 0.7), 5, 5);
      ellipse(x*xspacing+400, 280+yvalues[x]*(float(data[dreamer][17]) *0.8), 5, 5);
      ellipse(x*xspacing+400, 330+yvalues[x]*(float(data[dreamer][18]) *0.7), 5, 5);
    }
    else if( loss) {
      fill(250,60,50);
      ellipse(x*xspacing+400, 100+yvalues[x]*(float(data[dreamer][15]) * 0.4), 5, 5);
      ellipse(x*xspacing+400, 200+yvalues[x]*(float(data[dreamer][16])* 0.4), 5, 5);
      ellipse(x*xspacing+400, 280+yvalues[x]*(float(data[dreamer][17]) *0.5), 5, 5);
      ellipse(x*xspacing+400, 330+yvalues[x]*(float(data[dreamer][18]) *0.4), 5, 5);
    }
    else if( lust) {
       fill(14,60,80);
      ellipse(x*xspacing+400, 100+yvalues[x]*(float(data[dreamer][15]) * 1.3), 5, 5);
      ellipse(x*xspacing+400, 200+yvalues[x]*(float(data[dreamer][16])* 1.3), 5, 5);
      ellipse(x*xspacing+400, 280+yvalues[x]*(float(data[dreamer][17]) *1.2), 5, 5);
      ellipse(x*xspacing+400, 330+yvalues[x]*(float(data[dreamer][18]) *1.3), 5, 5);
    }
    
    else if (normal) {
      fill(205, 50, 100);
      ellipse(x*xspacing+400, 100+yvalues[x]*float(data[dreamer][15]), 5, 5);
      ellipse(x*xspacing+400, 200+yvalues[x]*float(data[dreamer][16]),5, 5);
      ellipse(x*xspacing+400, 280+yvalues[x]*float(data[dreamer][17]), 5, 5);
      ellipse(x*xspacing+400, 330+yvalues[x]*float(data[dreamer][18]), 5, 5);
    }
  }
  }
  void displayText() {
    textFont(f, 18);
    fill(360);
    image(img, 325, 415);


    text(data[dreamer][0]+" | "+data[dreamer][1] +" | "+data[dreamer][2], 440, 450); //PROFILE INFO
    textFont(f, 14);
    text(data[dreamer][3]+" | "+data[dreamer][4] +" | "+data[dreamer][5], 450, 480); //PROFILE INFO LINE 2
    text(data[dreamer][6]+" "+"SPOUSE"+" | "+data[dreamer][7]+" "+"OFFSPRING", 450, 500); //PROFILE INFO LINE 3

    text(data[dreamer][8], 400, 585); //CURRENT CONFLICT

    textFont(f, 12);
    textLeading(13);
    text(data[dreamer][9], 325, 630, 85, 130); //ANGER
    text(data[dreamer][10], 425, 630, 85, 130); //FEAR
    text(data[dreamer][11], 529, 630, 85, 130); //HOPE
    text(data[dreamer][12], 630, 630, 85, 130); //LOSS
    text(data[dreamer][13], 732, 630, 85, 130); //LUST
  }
}















// void dreamHistory() {
//   float offset = 870;
//   float easing = 0.05;
//   float time = millis()/300.0;
//   float sine = sin(time);
//   float cos = -cos(time);
//
//  //float r = 300 + time*25;
//  float r = map(sine, -1, 1, 300, 700);
//  
//  float xPos = map(sine, -1, 1, 830, 910);
//  float yPos = map(cos, -1, 1, 420, 1050);
//  PImage q = loadImage((29-dreamer)+".png");
//   
//   image(q, xPos, yPos); 
//   image(q, xPos+10, yPos+20); 
//   image(q, 860, 630); 
//
//   float dx = (mouseX-q.width/2) - offset;
//   offset += dx * easing; 
//   tint(255, 126);  // Display at half opacity
//   PImage s = loadImage((29-dreamer)+".png");
//   image(s, offset, 420);
//   image(s, offset+40, 510);
//   image(s, offset+10, 650);
//  
//  }








//drawBoxes(10, 10, 300, 200); // Dreams Active
//  drawBoxes(320, 10, 500, 390); // Current Profile Waves View
//  drawBoxes(10, 220, 300, 200); // Dreams Queue
//  drawBoxes(10, 430, 300, 330); // Dreams Globe Tracker
//  drawBoxes(320, 410, 100, 130); // Current Profile Photo
//  drawBoxes(430, 410, 391, 130); // Current Profile
//  drawBoxes(320, 550, 379+112+10, 40); // Current Mind Occupations
//  drawBoxes(320, 600, 93, 150); // Anger
//  drawBoxes(422, 600, 93, 150); // Fear
//  drawBoxes(524, 600, 93, 150); // Hope
//  drawBoxes(626, 600, 93, 150); // Loss
//  drawBoxes(728, 600, 93, 150); // Lust
//  drawBoxes(830, 10, 160, 410); // Dream Variables
//  drawBoxes(830, 430, 160, 110); // Timer
//  drawBoxes(830, 550, 160, 260); // Dream History

class dreamVariable {

  float dreamVX, dreamVY, dreamVW, dreamVH;
  boolean button_pressed;
  String dreamVText;
  

 dreamVariable(String text, int x, int y, int w, int h ) {
  
  dreamVW = w;
  dreamVH = h;
  dreamVX = x;
  dreamVY = y;
  dreamVText = text;
  
}

void run() {
  
  check();
  if ( button_pressed ){
    fill(200,80,10);
  } else { 
    fill(255);
  }
  rect(dreamVX, dreamVY, dreamVW, dreamVH);
  
  if ( !button_pressed ){
    fill(200,80,10);
  } else { 
    fill(255);
  }
  
  textFont(f, 14);
  fill(200,20,100);
  text(dreamVText,dreamVX,dreamVY+15);
}
  
  void check() {
    if(mousePressed){
    if ( (mouseX > dreamVX) && (mouseX < dreamVX+dreamVW) &&
      (mouseY > dreamVY) && (mouseY < dreamVY+dreamVH)) {
        button_pressed = !button_pressed;
    }
  }
  }


}
class Globe {

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


  Globe() {
   
  texmap = loadImage("world32k.png");    
  initializeSphere(sDetail);
  }

void run() {    
              
  renderGlobe(); 
}

void renderGlobe() {
  pushMatrix();
  translate(140, 600, pushBack); //where to put the x,y coordinates of the globe
  pushMatrix();
  noFill();
  stroke(205,100);
  strokeWeight(2);
  smooth();
  popMatrix();
  //lights();    
  pushMatrix();
  rotateX( radians(-rotationX) );  
  rotateY( radians(270 - rotationY) );
  fill(190, 80,100, 0.5);
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
    velocityX += (mouseY-pmouseY) * 0.01;
    velocityY -= (mouseX-pmouseX) * 0.01;
  } else {
    velocityX += .001;
    velocityY -= .002;
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


}
class Timer {

  int c; //time
  int cmin;
  int csec;
  int cmil;
  int climit; //10 min countdown
  float timerX, timerY, timerW, timerH;
  boolean button_pressed;
  String dreamVText;

  Timer (int startTime, int x, int y, int w, int h) {
    climit = startTime;
    timerX = x;
    timerY = y;
    timerW = w;
    timerH = h;
  }

  void run() {

    c = climit*60*1000 - millis();
    cmin = (c/(60*1000));
    csec = (c/1000);
    textFont(f, 14);

   

    if ( button_pressed ) {
      fill(200,40,80);
      
      println(cmin+" : "+csec);
    } 
    else { 
      fill(255);
      //text(climit, timerX, timerY+15);
    }
    rect(timerX, timerY, timerW, timerH);

    if ( !button_pressed ) {
      fill(100);
      
      text(" "+climit, timerX, timerY+15);
    } 
    else { 
      fill(255);
    }
    if (button_pressed) {
      fill(205, 70, 80);
      
      text("MIN: "+cmin, 845, 360);
      text("SEC: "+csec, 845, 380);
      fill(355);
      text(" "+climit, timerX, timerY+15);
    }
  }

  boolean check() {
  

    if ( (mouseX > timerX) && (mouseX < timerX+timerW) &&
      (mouseY > timerY) && (mouseY < timerY+timerH)) {
      return true;
    } 
    else {
      return false;
    }

   
  }
}





//void run() {
//  
//  
//  if ( button_pressed ){
//    fill(100);
//  } else { 
//    fill(255);
//  }
//  rect(dreamVX, dreamVY, dreamVW, dreamVH);
//  
//  if ( !button_pressed ){
//    fill(100);
//  } else { 
//    fill(255);
//  }
//  
//  textFont(f, 12);
//  text(dreamVText,dreamVX,dreamVY+15);
//
//  if(mousePressed){
//  if ( (mouseX > dreamVX) && (mouseX < dreamVX+dreamVW) &&
//      (mouseY > dreamVY) && (mouseY < dreamVY+dreamVH)) {
//        button_pressed = !button_pressed;
//    }
//  }
//
//}
//}  
//  
//  
//  
//  
//  
//  
//}

void splitData(){
  
  data = new String[rawData.length][20];    //use variableName.length because you may not know how many rows you'll have
  for (int i=0; i<rawData.length; i++) {
    
    String[] pieces = split(rawData[i], ",");
    //above just split the data of each line by the commas creating 3 pieces or elements. 
    //now need a for loop to go though that
    for (int j=0; j<19; j++){
      //i is the row and j is the column
     data[i][j] = pieces[j];
//     println(data[i][j]);
    }
  }
  
  
   
    
    
  }
  
  
  
  
  


