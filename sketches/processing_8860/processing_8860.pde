
void setup(){
  size (500, 500);
  colorMode (HSB, 100);
  frameRate(20);
  background (90);
}

void lines(float pos, float h, float s, float v, float trans, float strk){ //why do I keep on substituting v for b when defining colours?

  strokeWeight(strk);     //defines line width               

  stroke (h, s, v, trans);  //defines colour (with a "u") and transparency

  line (pos, 0, pos, height); //moves line left to right

  line (0, pos, width, pos); //moves line top to bottom

  line (0, height-pos, width, height-pos); //moves line bottom to top

  line (width-pos, 0, width-pos, height); //moves line right to left

}



float POS=0;            //sets the beginning position of the lines

float  H= random(100);

float  S= random(100); //these are colour values

float  V= random(100); 


void draw(){


  float z= random (1, 10); //sets the space between lines
  float TRANS= random(20, 45);
  float STRK= random(0.5, 5);

  if (POS<width/2){
    POS+=z;         //makes the lines move
  }
  else{
    POS=0;         //resets lines once they go off screen
  }


  if (POS==0){     //randomises colour settings when lines are reset
    H= random(100); 
    S= random(100); 
    V= random(100); 
    TRANS= random(10, 60);
  }

  lines(POS, H, S, V, TRANS, STRK);

}

void mousePressed(){ //clears screen when button pressed
  setup();
}



