

float lx=60;
float ly=60;

PFont dan;
//String vega= "L6V";
//String joe="1J9";

//String aaron =

void setup (){
size(250,250);
smooth ();
background(255);
dan= loadFont("Narkisim-200.vlw");
}

void draw(){
 // background(102,256,82);
 for(int i=0; i<100; i++) {
  float r = random(250);
  textSize(r*5);
  rect(250, i+250,0+r, i);

  fill(237,27,46);
  textMode(CENTER);
  textFont(dan,50);
 }
}
void mousePressed(){
  stroke(255);
  
  if (mouseButton ==LEFT){

   text("THERE",pmouseX,pmouseY);
  } 
  
  if (mouseButton == RIGHT){
     textSize(random(250));
  text("HI",pmouseX,pmouseY);

  
  }
  
  
  

  
}

