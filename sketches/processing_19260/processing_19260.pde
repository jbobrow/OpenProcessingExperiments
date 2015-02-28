

float lx=60;
float ly=60;

PFont dan;
//String vega= "L6V";
//String joe="1J9";

//String aaron =

void setup (){
size(250,250);
smooth ();
background(0);
dan= loadFont("Impact48.vlw");
}

void draw(){
 // background(102,256,82);
 for(int i=0; i<100; i++) {
  float r = random(250);
  textSize(r*5);
  line(250, i+250,0+r, i);

  fill(0);
  textMode(CENTER);
  textFont(dan,50);
 }
}
void mouseDragged(){
  stroke(255);
  
  if (mouseButton ==LEFT){

   text("L6V",pmouseX,pmouseY);
  } else if  (mouseButton == RIGHT);
  text("1J9",pmouseX+lx,pmouseY+ly);
}

  
  
  
  




