
float angle;
float theRadius;
float angle2;
int mode;
int hexangle;

void setup (){
  size(600,600);
  angle = 0;
  theRadius = 0;
 // mode = 0;
  background(0);
  smooth();
  noStroke();
  colorMode(HSB, 360, 100, 100, 100);
}


void draw(){
  if (mousePressed == true){
    mode = 2;
  }else{
    mode = 1;
  }
  
  
  if (mode==0){
  //  bg();
  } else {
    if(mode==1){
    bg();
    } else {
    if(mode==2){
    Spiral();
      }
  }
  }
  println(mode);
}

void bg(){
  float bgcolor = abs(255*sin(radians(angle2)));
  background(bgcolor);
  angle2+=.5;
  float x = 30*cos(radians(angle));
  float y = 30*sin(radians(angle));
  
  ellipse(x+(mouseX),y+(mouseY),20,20);

  angle+=15;
}


void Spiral(){ 
  float x = (theRadius)*cos(radians(angle));
  float y = (theRadius)*sin(radians(angle));
  
  fill(random(50,65),100,random(50,100),50);
  ellipse(x+(width/2),y+(height/2),theRadius/9,theRadius/9);
  angle+=137.5;
  theRadius+=.5;
}

//void hex


