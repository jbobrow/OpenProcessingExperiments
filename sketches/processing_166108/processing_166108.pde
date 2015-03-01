
PImage pizzaImg;


void setup(){
  size(500,500);
  stroke(255);
  strokeWeight(1);
  pizzaImg=loadImage("pizza__1322067494_5957.jpg");
}
void draw(){
  fill(80);
    background(0);

  float s=map(second(),0,60,0,TWO_PI)-HALF_PI;
  float m=map(minute(),0,60,0,TWO_PI)-HALF_PI;
  float h=map(hour()%12,0,12,0,TWO_PI)-HALF_PI;
    stroke(255);
    for(int i=0;i<500;i+=40){
  line(i,i,cos(s)*38+i,sin(s)*38+i);
  line(i+40,i+40,cos(s)*38+i+40,sin(s)*38+i+40);
  
    //line(250,250,cos(m)*30+250,sin(m)*30+250);
  //line(250,250,cos(h)*25+250,sin(h)*25+250);
    }
}


