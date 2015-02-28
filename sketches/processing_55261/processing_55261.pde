
//Interactivity 1006 YSDN
//code by Anne Marie Hood

float x=.25;
float a=255;

void setup (){
  size (300,200);
  ellipseMode(CENTER);
  background (255);
}

void draw(){ 
  fill(a,0,0);  
  a-=4.1;
  if (a<50){
  a=255;
  //changes the fill of the heart from red to black
  }
  
  translate (width/2, height/2);
  noStroke();
  smooth();
  ellipse (-38,-30,80,80);
  ellipse (38,-30,80,80);
  triangle (-73,-10,73,-10,0,80);
  ellipse (0,-5,30,30);
  //draws heart

  frameRate(10);
  stroke(255,255,255);
  strokeWeight(x);
  x +=1;
  if (x>50){
  x=.25;
  }// the stroke weight starts at .25 and grows by one unit until it reaches 50 and then starts over again
  
  line (0,-45,-10,-30);
  line (-10,-30,20,5);
  line (20,5,-15,25);
  line (-15,25,10,45);
  line (10,45,0,80);
  //draws the jagged line
}

