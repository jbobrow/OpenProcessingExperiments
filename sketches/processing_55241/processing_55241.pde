
//Interactivity 1006 YSDN
//code by Anne Marie Hood 2012

float x=random(0,600);
float y=random(0,300);

float a= 255;
float b =0;
float c= 0;

float xMax = x+30;
float xMin = x-30;

float yMax = y+30;
float yMin = y-30;

void setup (){
  size (600,300);
  smooth();
  background (0);
}

void draw (){
  noStroke();
  fill (0);
  frameRate(5);
  fill(a,b,c);
  strokeWeight(20);
  stroke (255,255,0);
  ellipseMode (CENTER);
  ellipse (x,y,60,60);

if (mouseX<xMax && mouseX >xMin && mouseY>yMin && mouseY <yMax){
  a= random(255);
  b= random (255);
  c= random(255);
  ellipse (random (0,600), random (0,300), 60, 60);
 //produces "rollover" changing colours on ellipse
} 

}
void mousePressed (){
  frameRate (1);
  fill (255);
  noStroke();
  rect (random (0,600), random (0,300), 60, 60);
  //white squares appear when mouse is pressed
  //frameRate is slower when mouse is clicked

  }

void keyPressed (){ 
  if (key ==' '){
  fill (0);
  noStroke();
  rect (0,0,width,height);
  //clears the screen when spacebar is pressed
  }

}


