
float x=0, a=0, fase=0;

void setup(){
  size(500, 500);
  frameRate(999999999);
}

void draw(){
  background(random(255));
  for(x=0; x<=500; x=x+(PI*0.1)){
    fill(random(255), random(255), random(255));
    ellipse(4*pow(1.1, x)*cos(x+fase)+250, 4*pow(1.1, x)*sin(x+fase)+250, fase, fase);
  }
  fase=fase+0.5;  
  a=a+1;
}
