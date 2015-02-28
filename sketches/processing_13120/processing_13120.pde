
import processing.opengl.*;
//when ball count is at 500 the computer cannot process 50 balls and runs the program painstakingly slow
int ballCount = 6;
float[] Xvalues = new float[ballCount];
float[] Yvalues = new float[ballCount];
float[] Xspeeds = new float[ballCount];
float[] Yspeeds = new float[ballCount];
float[] gravityS = new float[ballCount];
float[] dampingS = new float[ballCount];
float[] frictionS = new float[ballCount];
float[] radiusS = new float[ballCount];
float[] ballColor = new float[ballCount];
float bcolor;
float fillcol;

void setup() {
  size(900, 600, OPENGL);
  //frameRate( 120);
  for(int i=0; i<ballCount; i++) {
    radiusS[i] = random (10, 50);
    Xspeeds[i] = random( 5, 10);
    Yspeeds[i] = random (13, 15.5);
    Yvalues[i] = height;
    gravityS[i] = random( .07, .11);
    frictionS[i] = random (.004, .012);
    dampingS[i] = random(.50, .90);
    ballColor[i] = random(0, 350);
    
  }

}

void draw() {
  colorMode(HSB, 359, 99, 99);
  background(bcolor, 88, 93);
  //pointLight  for some reason processing didnt recognize pointLight but on the refrence library it says it should be built into the program 
  directionalLight(191, 28, 96, 0, 0, -1);
  smooth();
  bcolor ();
  move();
  collide();
}


void bcolor() {
  if (bcolor > 359) {
    bcolor = 0;
  } 
  if (bcolor >= 0) {
    bcolor += 1;
  }
}


void move() {
  //left side balls
  for (int i=0; i<ballCount/2; i++) {
    Xvalues[i] += Xspeeds[i];
    Xspeeds[i] -= frictionS[i];
   
    Yvalues[i] -= Yspeeds[i]; 
    Yspeeds[i] -= gravityS[i];
    
    
     ballColor[i] += random(0,  20);
    if(ballColor[i] > 350){
      ballColor[i] = random(0,20);
    }
    //fillcol = Yvalues[i];
    fillcol = ballColor[i];
    
    pushMatrix();
    translate(Xvalues[i], Yvalues[i]);
    colorMode(HSB, 359, 99, 99);
    noStroke();
    fill( fillcol, 83, 93);
    sphere(radiusS[i]*2);
    popMatrix();
  }
  
  //right side balls
   for (int i=ballCount/2; i<ballCount; i++) {
    Xvalues[i] += Xspeeds[i];
    Xspeeds[i] -= frictionS[i];
   
    Yvalues[i] -= Yspeeds[i]; 
    Yspeeds[i] -= gravityS[i];
    
    
      ballColor[i] += random(0,  20);
    if(ballColor[i] > 350){
      ballColor[i] = random(0,20);
    }
    
    //fillcol = Yvalues[i];
    fillcol = ballColor[i];
    pushMatrix();
    translate(width - Xvalues[i], Yvalues[i]);
    colorMode(HSB, 359, 99, 99);
    noStroke();
    fill( fillcol , 83, 93);
    sphere(radiusS[i]*2);
    popMatrix();
  }
}



void collide() {
  
  //sides
  for (int i=0; i<ballCount; i++) {
    
      if( Xspeeds[i] < .2 && Xspeeds[i] > -.2){
    Xspeeds[i] = 0;
  }
  
    if (Xvalues[i] > width-(radiusS[i] * 2.5)) {
      Xvalues[i] = width-radiusS[i] * 2.5;
      Xspeeds[i] *= -1;
      frictionS[i] *= -1;
    }
    else if (Xvalues[i] < radiusS[i] * 2.5) {
      Xvalues[i] = radiusS[i] * 2.5;
      Xspeeds[i] *= -1;
      frictionS[i] *= -1;
    }

//top and bottoms
    if (Yvalues[i] > height-radiusS[i] * 2.3) {
      Yvalues[i] = height-radiusS[i] * 2.3;
      Yspeeds[i] *= -1;
      Yspeeds[i] *= dampingS[i];
      
    } 
    
    //stopping baby bouncing
    /*if (Yvalues[i] == height - radiusS[i] && abs(Xspeeds[i]) > .5 && abs(Yspeeds[i]) > .5) {
     Yvalues[i] = 0;
      
    }*/
    
   /* else if (Yvalues[i] < radiusS[i]) {
      Yvalues[i] = radiusS[i];
      Yspeeds[i] *= -1;
    }  */
  }
}













