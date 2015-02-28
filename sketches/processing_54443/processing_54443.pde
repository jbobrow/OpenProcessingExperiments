
float x,y,angle;

void setup () {
  size(600,600);
  background(255);
  smooth();
  
}
float distance01 = 0;
float angle01 = 0;
void draw() {
  noStroke();

  float glowLight = cos(cos((radians(angle++))));
  glowLight = map(glowLight, 255,1,0,25);
  for (int i = 0; i <1000; i = i=i+i){
  fill(i+=152, i-mouseX, glowLight);
 
  angle01 = angle01 + 2.9;
  distance01 = distance01 + .2;
  
   float X = 100 + distance01*cos(angle01*200);
  float Y = 100 + distance01*sin(angle01*180);
  
 
 rect(300,300, X, Y);
  
  }
 
}


