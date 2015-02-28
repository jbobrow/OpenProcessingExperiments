
//Processing 2.0

float x, y;      //axis
float px,py;     //preview axis
float rdm;       //random input values
float count=60;  //initial vertical spacing
float inc;       //vercial increment

int ns=10;       //noise amplitude
int hInc=7;     //horizontal increment
int div = 40;    //division factor
float strk=1.3;  //stroke weight

void setup(){
  size(600,800);
  background(255,250,245);
  smooth();
  stroke(255,250,245);
  strokeWeight(strk);
  frameRate(900);
  fill(51);
  rectMode(CORNERS);
  rect(100,70,width-100,height-70);  //dark grey background
}

void draw(){
  if(inc>25){  inc=25;  }      //restrain vertical increment
  else{  inc = count/div;  }   //vertical increment
  rdm=random(0,300);           //random values used as input for noise effect
  y=noise(rdm)*ns+count;       //adds vertical increment to y position
  line(px, py, x, y);          //draw short horizontal lines
  py=y;                        //updates position
  px=x;                        //updates position
  x+=hInc;                     //horizontal increment
  if(x>width+10){              //condition to avoid cross section lines
    noStroke();
    x=0;
    count = count + inc;
    py=y;
    px=x;
    stroke(255,250,245);
  }
  if (count>height-80){  noLoop();  } //stops program when lines get to the bottom
}


