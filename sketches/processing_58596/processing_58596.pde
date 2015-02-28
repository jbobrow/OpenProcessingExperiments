
int x;
int y;
int directionx;
int directiony;
int c;

//runs once
void setup(){
  size(600,800);
  smooth();
  x=100;
  y=200;
  directionx=5;
  directiony=5;
  c=0;
}


void draw(){
  background(25);

  if(x<y);


  float value = saturation(c);  // Sets "value" to "126"
  fill(value);
  
  fill(10,20,30,c);
  c++;
  if(x==600){
    x=0;
    y=200;
  }

  colorMode(HSB, 255);
  //color c = color(0, 126, 255);  
  fill(c);
  bezier(sin(mouseY),mouseY,mouseX,width/2,height/2,40,mouseY,mouseX);
  fill(random(255));
  bezier(cos(mouseX),mouseY,mouseX,60,70,40,mouseY,mouseX);
  bezier(sin(mouseY),mouseY,mouseX,10,10,40,mouseY,mouseX);
  fill(random(255));
  bezier(cos(mouseX),mouseY,mouseX,60,70,40,mouseY,mouseX);


  
}



