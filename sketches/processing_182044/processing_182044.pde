
float x;
float y;
float radiusNoise;
float radius=100;

void setup() {
  size(500,500);
  smooth();
  background(255);
  radiusNoise=random(20);
  
}

void draw(){
  translate(width/2,height/2);
  for (float ang=0;ang<=360;ang+=5){
    float thisradius=radius+(noise(radiusNoise)*200-100); 
    float rad=radians(ang);

x=thisradius*cos(rad);
y=thisradius*sin(rad);

ellipse(x,y,5,5);
radiusNoise=radiusNoise+.1;

if (keyPressed == true) {
  ellipse(x,y,50,50);}
  }

}
