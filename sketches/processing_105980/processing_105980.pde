
/***************************
collision test + gravity with arrays
Chris Henrick
8/7/13

To Do:
-Add mouseDragged() function to add number of balls
-Add message to say "click me" when user sees screen.
***************************/

int numFires = 100;
String message = "Click Me";

// declare and create arrays
float[] fireX = new float[numFires];
float[] fireY = new float[numFires];
float[] fireXspeed = new float[numFires];
float[] fireYspeed = new float [numFires];
color[] fireColors = new color[numFires];


float diam = random(10, 30);
float gravity;
float time = millis()/300;
float sine = sin(time);

void setup(){
  size(1000, 500);
  smooth();
  noStroke();
  
  colorMode(HSB);
    
  for (int i = 0; i < numFires; i++){
    fireX[i] = 0;
    fireY[i] = 0;
    fireXspeed[i] = 0;
    fireYspeed[i] = 0;
  }
}

void draw(){

 if (mousePressed != true){
   textSize(50);
   fill(200, 0, 100);
   textMode(CENTER);
   text(message, width/2, height/2);
 } else {
   noFill();
 }

 
 background(0);
  
 for (int i = 0; i < numFires; i++){
   gravity = map(sin(millis()/300), -1, 1, -.1, .1);

   fireX[i] = fireX[i] + fireXspeed[i];
   fireY[i] = fireY[i] + fireYspeed[i];
   fireYspeed[i] = fireYspeed[i] + gravity;
   
   if (fireY[i] > (height -5) || fireY[i] < 5) {  // if the balls' y position approaches the size bounds reverse direction
      fireYspeed[i]*=-1;
    }
    
   if (fireX[i] > (width -5) || fireX[i] < 5) { 
      fireXspeed[i]*=-1;
    }
    
   for (int j = 0; j < numFires; j++){
     
     if (i != j){
     
     if (dist(fireX[i], fireY[i], fireX[j], fireY[j]) <= diam){
       fireXspeed[i] *= -1;
       fireYspeed[i] *= -1;
       fireXspeed[j] *= -1;
       fireYspeed[j] *= -1;
     }
     
     }
   }
    
    fill(fireColors[i]); 
    ellipse(fireX[i], fireY[i], diam, diam);
  }
 
}


// creat a mouse release event to trigger the start of the animation. 
void mousePressed() {
    
  for (int i = 0; i < numFires; i++){
    fireX[i] = random(width);
    fireY[i] = random(height);
    //fireX[i] = mouseX+random(-100,100);
    //fireY[i] = mouseY+random(-100,100);
    fireXspeed[i] = random(-2, 2);
    fireYspeed[i] = random(-7, -3);
    fireColors[i] = color(random(120, 360), 255, 255, 150);
  }
}

/*
boolean sketchFullScreen(){
  return true;
}
*/



