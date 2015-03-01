
void setup(){
  size(500,500);
  stroke(255);
  strokeWeight(1);
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
  line(i+160,i-160,cos(s)*38+i+160,sin(s)*38+i-160);
  line(i+80,i-80,cos(s/2)*38+i+80,sin(s/2)*38+i-80);
  line(i+240,i-240,cos(s*2)*38+i+240,sin(s*2)*38+i-240);
  line(i+200,i-200,cos(s)*38+i+200,sin(s)*38+i-200);
  line(i+40,i-40,cos(s/2)*38+i+40,sin(s/2)*38+i-40);
  line(i+120,i-120,cos(s*2)*38+i+120,sin(s*2)*38+i-120);
  line(i-160,i+160,cos(s)*38+i-160,sin(s)*38+i+160);
  line(i-80,i+80,cos(s/2)*38+i-80,sin(s/2)*38+i+80);
  line(i-240,i+240,cos(s*2)*38+i-240,sin(s*2)*38+i+240);
  line(i-120,i+120,cos(s)*38+i-120,sin(s)*38+i+120);
  line(i-40,i+40,cos(s/2)*38+i-40,sin(s/2)*38+i+40);
  line(i-200,i+200,cos(s*2)*38+i-200,sin(s*2)*38+i+200);

    //line(250,250,cos(m)*30+250,sin(m)*30+250);
  //line(250,250,cos(h)*25+250,sin(h)*25+250);
    }
}


