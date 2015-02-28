
//trigonometry

float x;
float y;
int numSides=3;
float mousex,mousey;

void setup(){
  size(600,600);
  colorMode(HSB,360,100,100);
}

void draw(){
  background(48,36,99);
  beginShape();
  for(int i=0; i<=360; i+=360/numSides){
      x = cos(radians(i)) * 200 +width/2;
      y = sin(radians(i)) * 200 +height/2;
      fill(50,100);
      line(x,y,30,50);
      ellipse(x,y,10,10);
      vertex(x,y);
      strokeWeight(1);
  }
  endShape();
}

void mousePressed(){
  for(int j=3; j<=30; j+=1){
    if(mousePressed){
      numSides =int(random(j));
      }
    }
}

