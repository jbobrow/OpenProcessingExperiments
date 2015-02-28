
//float circleX
int numCircles = 1000;  //so we can change this value later
float [] circlex  = new float[numCircles];//the float is an array. // we are saving a spot for all the circles but not drawing them yet
float  [] circley = new float[numCircles];
int rad[] = new int[numCircles];
float [] vel = new float [numCircles];  //
float r [] = new float [numCircles]; //making the fill Array
float g [] = new float [numCircles];
float b [] = new float [numCircles];


void setup() {
  size(500,500);
  smooth();
  noStroke();
  frameRate(200);
          
  for( int i=0; i < numCircles; i++){    //instead of writing all circlex we make a forlop
  rad[i] = round(random(5,30)); // telling the balls to be different radious in array.
  circlex[i] = random(0+rad[i], width-rad[i]) ;//that will draw all cirlces in our box and not outside
  circley[i] = random(0+rad[i], height-rad[i]);
  vel[i]= random (5-30);  //defining the velocity
  //fill[i]=random(1-255); //defning the fill as random
}
  
  

}
  //drawing our ellipses
void draw() {  
  background(23,180,200);
  //drawing our ellipse in a for lop
  for (int i=0 ; i < numCircles; i++){
  ellipse(circlex[i], circley[i], rad[i], rad[i]);  //we told circlex ad y to be an array so we need to tell it to be an array we are teeling it to grab just the 6 circlex and circley
  //ellipse(circlex[1], circley[1], rad, rad); THIS IS WHAT IT SAVES US FROM DOING.   //we want to draw 100 circlex
  stroke(0);
  strokeWeight(1);
 fill(r[i],g[i],b[i]);
 } 
   
  for (int i=0 ; i < numCircles; i++){
  ellipse(circlex[i], circley[i], rad[i], rad[i]);
  circlex[i] = circlex[i] + vel[i];
 
  //if(circlex[i] == width || circlex[i] == 0){
    //vel[i] = -vel[i];
  
  //here we are telling it its bounderies
    
   if (circlex [i] >= 500){
    vel[i]= -vel[i];
    r[i]=random(225);
    g[i]=random(225);
    b[i]=random(225);
  }

   if (circlex [i] <= 0){
    vel[i]= -vel[i];
    r[i]=random(225);
    g[i]=random(225);
    b[i]=random(225);
  }
  
   if (circley [i] >= 500){
    vel[i]= -vel[i];
    r[i]=random(225);
    g[i]=random(225);
    b[i]=random(225);
  }
 
   
  
  }

  } 
  

 
  
    
    







 


