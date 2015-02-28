
/* 

"ShapeOfDesignStudy" by Jason C. Stone, 2012

Licensed under Creative Commons Attribution-Share Alike 3.0 and GNU GPL license.

Usage:
     '+' - More thingies
     '-' - Fewer thingies
     'c' - Toggle color    

Work:
    http://openprocessing.org/visuals/?visualID= 78534  

License: 
    http://creativecommons.org/licenses/by-sa/3.0/
    http://creativecommons.org/licenses/GPL/2.0/

Credits:
    "drawVignettingEffect()" function taken from Yarn Galaxy (curls V5) by DARYL_Gamma      
     
*/

static float MIN_STROKE_WEIGHT = .25;
static float MAX_STROKE_WEIGHT = .3;

static float MIN_INCREMENT_ANGLE = .1;
static float MAX_INCREMENT_ANGLE = 10;

static float MIN_DISRUPT_ANGLE = 1;
static float MAX_DISRUPT_ANGLE = 33;

static float MIN_ELLIPSE_SCALE = 0;
static float MAX_ELLIPSE_SCALE = 2;

static int width = 950;
static int height = 600;

int columns = 3;
int rows = 3;

float thingyWidth = width / columns;
float thingyHeight = height / rows;

float centerRadius = 20;
double incrementAngleBy = 1;
int disruptEveryNDegrees = 33;

float ellipseScale = 1;
boolean useEllipse = false;
float useEllipseWeight = .25;

float noiseOffset = 0;

float currentAngle = 0;

boolean useColor = false;
color ellipseColor = color(0);
color lineColor = color(0);


color[] colorSet = {   color(129, 70, 116),
                       color(203, 182, 197), 
                       color(255, 220, 11),
                       color(138, 108, 95), 
                       color(222, 198, 174)   }; 


void setup(){
  size(950, 600);
  smooth();
  
  noFill();
  stroke(0);
  
  clearScreen();
}

void clearScreen(){
  drawVignettingEffect();
  //background(255);
  currentAngle = 0;
  thingyWidth = width / columns;
  thingyHeight = height / rows;
}

void draw(){
  for(int i=0; i<columns; i++){
   for(int j=0; j<rows; j++){
     pushMatrix();
     translate((i * thingyWidth) + thingyWidth/2, (j * thingyHeight) + thingyHeight/2);
     drawThingy((i * thingyWidth) + thingyWidth/2, (j * thingyHeight) + thingyHeight/2);
     popMatrix();
   }
  }
  noLoop();
}

void drawThingy(float locX, float locY){
  pushStyle();
  
  initRandThing();
   
  // Start at first angle increment, not 0 //
  for(double i = incrementAngleBy;  i <= 360 ; i = i+incrementAngleBy){
    float x = cos(radians((float)i));
    float y = sin(radians((float)i));
  
    float length = min(thingyWidth/2 - centerRadius , thingyHeight/2 - centerRadius) 
        * noise(x + locX, y + locY, noiseOffset);
     
    // This makes sure that lines always go away from the center. 
    if(length > centerRadius){
       stroke(lineColor);
       line(x * centerRadius, y * centerRadius, x * length, y * length);
    }
     
    if(useEllipse){ 
      stroke(ellipseColor);
      ellipse(0,0, ellipseScale * length, ellipseScale * length);
    }
    
    if(i % disruptEveryNDegrees == 0){
      noiseOffset = random(millis());
    }
  }
  
  popStyle();
}

void initRandThing(){
  centerRadius = random(0, min(thingyWidth, thingyHeight) * .1);

  // 1. Choose an increment angle
  // 2. See what the remainder is when dividing 360
  // 3. Divide that remainder by the number of marks
  // 4. Add that amount to the increment so the remainder is evenly distributed
  //    around the circle.
  incrementAngleBy =  random(MIN_INCREMENT_ANGLE, MAX_INCREMENT_ANGLE);
  double remainderOfCircle = 360 % incrementAngleBy;
  double numberOfSpikes = 360/incrementAngleBy;
  incrementAngleBy = incrementAngleBy + (remainderOfCircle/numberOfSpikes);
  
  disruptEveryNDegrees = (int)random(MIN_DISRUPT_ANGLE, MAX_DISRUPT_ANGLE);
  
  if(random(0,1) > useEllipseWeight){
    useEllipse = true;
  }else{
    useEllipse = false;
  }
  
  ellipseScale = random(MIN_ELLIPSE_SCALE, MAX_ELLIPSE_SCALE);
  
  if(useColor){  
    lineColor = colorSet[int(random(colorSet.length))];
    ellipseColor = colorSet[int(random(colorSet.length))];
  }else{
    lineColor = color(0);
    ellipseColor = color(0);
  }
  
  strokeWeight(random(MIN_STROKE_WEIGHT, MAX_STROKE_WEIGHT));
  
}

void mousePressed(){
   clearScreen();
   loop();
}

void keyPressed(){
  if(key == 's' || key == 'S' ){
    save("thingies" + millis() +".png");
    println("saved"); 
  }else if(key == '+'){
    if(rows >= 8 || columns >= 8){
      return;
    }
    rows += 1;
    columns += 1;
    clearScreen();
   loop();
  } else if(key == '-'){
    if(rows <= 1 || columns <= 1){
      return;
    }
    rows -= 1;
    columns -= 1;
    clearScreen();
    loop();
  } else if(key == 'c' || key == 'C'){
      useColor = !useColor;
      clearScreen();
      loop();
  } 
}

void drawVignettingEffect(){
  if(useColor){
     background(255);
  }else{
    smooth();
    background(255);
    strokeWeight(180);
    noFill();
    stroke(180,180,180,5);
    translate(width/2,height/2);
    for (int i = 0; i < 300; i+=10){
      ellipse(0,0,max(width+i,height+i),max(width+i,height+i));
    }
    resetMatrix();
  }
}
