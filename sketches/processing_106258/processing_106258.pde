
//initalize
float hours;
float mins;
float seconds;
int hoursC;
int minsC;
int secondsC;

float theta = 0.0;

float theta2 = 1;

void setup() {
  //define color mode and size and set colors to randome
  colorMode(HSB);
  size(240,240);
  //set background color in setup... no redraw to give overlap effect
   background(int(random(255)),255,255);
   hoursC=int(random(255));
     minsC=int(random(255));
   secondsC=int(random(255));
}

void draw() {
  //map time to width
  noStroke();
  
  hours =map(hour(),0,24,0,width);
  mins =map(minute(),0,60,0,width);
  seconds =map(second(),0,60,0,width);

  //add angle for cos
  theta=theta+.01;

  float x = theta;
  
  //figured I did not need this
  float xx = theta2;
  
 
  
  //create sin wave for seconds
  fill(200,225,255,150);
  //draw 40 circles in wave form
  for (int i = 0; i <= 40; i++) {
    //set height to time
    float y = sin(x)*seconds/2.5;
    ellipse(i*20,y + height/2,16,16);
    x += .25;
  }
  
    fill(30,225,255,150);
 //create sin wave for mins
   for (int i = 0; i <= 40; i++) {
    float y = sin (x)*mins/2.5;
    ellipse(i*20,y + height/2,16,16);
    x += .25;
  }
    fill(130,225,255,150);
 //create sin wave for hours
   for (int i = 0; i <= 40; i++) {
     //set height of wave to hours
    float y = sin (x)*hours/2.5;
    ellipse(i*20,y + height/2,16,16);
    x += .25;
  }
  
  //write % of time
  stroke(5,100,100,50);
  fill(100,0,0,50);
   line (0,10,200,10);
   text ("~100%",200,10);
   line (0,height/8+5,200,height/8+5);
   text ("~75%",200,height/8+5);
   
   line (0,height/4,200,height/4);
   text ("~50%",200,height/4);
   
   
  line (0,(height/2)-(height/4)/2,200,(height/2)-(height/4)/2);
   text ("~25%",200,(height/2)-(height/4)/2);
   
   line (0,height/2,200,height/2);
   text ("0%",200,height/2);
   
   
   line (0,(height/2)+(height/4)/2,200,(height/2)+(height/4)/2);
   text ("~25%",200,(height/2)+(height/4)/2);
   
   
   line (0,height-height/4,200,height-height/4);
   text ("~50%",200,height-height/4);
   
      line (0,height-height/8-5,200,height-height/8-5);
   text ("~75%",200,height-height/8-5);
    line (0,height-10,200,height-10);
    text ("~100%",200,height-10);
  
  
  

  
}
