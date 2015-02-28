

void setup(){
  size(800,800);
  smooth();
  colorMode(RGB);
  background(0);
  fill(255);
  rectMode(CORNERS);
  rect(width,0,height/2,height/2);
  rect(height/2,height/2,0,height);


}


// Sets layer variable
int layer = 0;

// Defines Size of Black Circles
float circleRadius = random(5,20);

// Color Scheme Used for Randomization
color Red = color(255,0,0,random(0,75));
color Green = color(0,255,0,random(0,75));
color Purple = color(208,3,255,random(0,75));

// Curve function setup for 6 vertexs
void CURVES ( 
float a, float b,
float c, float d, 
float e, float f,
float g, float h,
float i, float j,
float k, float l){

// Clears color history and places fill and stroke baased on color picker outcome  
noStroke();
noFill();
colorPicker();
strokeWeight(random(0,2));

// Curve with variable parameters a-l   
beginShape();
  curveVertex(a,b);
  curveVertex(c,d);
  curveVertex(e,f);
  curveVertex(g,h);
  curveVertex(i,j);
  curveVertex(k,l);
  endShape();

// Creates negative circle clusters
noStroke();
fill(0);
ellipse(a,b,circleRadius,circleRadius);
fill(255);
ellipse(k,l,circleRadius,circleRadius);

}  

void draw() {

// Defines how many curves are drawn each time
for(int curveNum = 0; curveNum < random(1,20); curveNum++){

// Creates variables for replicating 4 drawings in 4 quadrants  
for(int right = 0; right < width; right += width/2){
for(int down = 0; down < height; down += height/2){  

// Curve randomizer which ensures every curve spans across the drawing and restricts start and end randomness.
// down and right variables draw the curve forms in each quadrant.
CURVES(random(width*0.2)/2+right,random(height/4)/2+down,random(width/2)/2+right,random(height/2)/2+down,
random(width)/2+right,random(height)/2+down,random(width)/2+right,random(height)/2+down,
random(width/2)/2+right,random(height/2)/2+down,random(width*0.8,width)/2+right,random(height*0.75,height)/2+down);

// Defines how many layers are drawn before program stops
layer++;
if( layer > random(20,50) ){
  noLoop();

  
 
}

}
} 
}

}


// Randomizer which picks either Red, Green, Purple or White 
  void colorPicker(){
  
  int colorNum = floor(random(1,5));
  
  if(colorNum == 1){
   fill(Red);
   stroke(Green);
  }

  if(colorNum == 2){
   fill(Green);
   stroke(Purple);
  }
  
  if (colorNum == 3){
   fill(Purple);
   stroke(Red);  
  } 
  
  if (colorNum == 4){
   stroke(100,random(0,50));
}
}



