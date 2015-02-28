
float r = 1; 
float t = 0;
float aq = 0.05;
boolean c1 = true;
boolean c2 = true;
boolean c3 = true;
boolean c4 = true;

void setup() {
  background(255, 255, 255);
  size(500, 500);
  smooth();
  noStroke();
  fill(0, 0, 0, 200);
}

void draw() {
  r+= aq;
  t += aq;
  float x = r * cos(t);
  float y = r * sin(t);
  float x2 = r * cos(t+10);
  float y2 = r * sin(t+10);
  float x3 = r * cos(t+20);
  float y3 = r * sin(t+20);
  float x4 = r * cos(t+30);
  float y4 = r * sin(t+30);
  ellipse(250,250,3,3);
  if (aq>0.021) {
    aq-=0.00001;
  }
  else {
    //stop();
  }
  if(dist(x-102 + width/2,y + height/2,250,250)<2){
    c1=false;
  }
  if(dist(x2 + width/2,y2-100 + height/2,250,250)<2){
    c2=false;
  }
  if(dist(x3 + width/2,y3+100 + height/2,250,250)<2){
    c3=false;
  }
  if(dist(x4+100 + width/2,y4 + height/2,250,250)<2){
    c4=false;
  }
  if(c1){
  ellipse(x-102 + width/2, y + height/2, 1, 1);
  }
  if(c2){
  ellipse(x2 + width/2, y2-100 + height/2, 1, 1);
  }
  if(c3){
  ellipse(x3 + width/2, y3+100 + height/2, 1, 1);
  }
  if(c4){
  ellipse(x4+100 + width/2, y4 + height/2, 1, 1);
  }
}



