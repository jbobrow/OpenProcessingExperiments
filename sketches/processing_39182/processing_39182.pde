

float xpos[] = new float[10];
float ypos[] = new float[10];

void setup(){
  size(500,500);
  smooth();
  
  for(int i = 0; i < xpos.length; i++){
    xpos[i]= width/2;
    ypos[i]= height/2;
  }
}

void draw(){
  //draw the background
  background(0);
  //make a for loop to access array values
    for(int i = 0; i < xpos.length; i++){
     //set the values i the array to increment by a number 
     //between -1 and 1
  xpos[i] += random(-1,1);
  xpos[i] = constrain(xpos[i] , 0 ,width);
  
  ypos[i] += random(-1,1);
  ypos[i] = constrain(ypos[i], 0, width);
  
  //then set the color and draw a rectabgle
  fill(255);
  rect (xpos[i],ypos[i],10,10);
    }
}               
