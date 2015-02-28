
float time = 0;
int w = 400;
int h = 400;
void setup(){
  smooth();

  size(400,400);
  stroke(1,111);
  fill(1,111);
}
float wave = 75;
void draw(){

  fill(255);
  float x =0;
  rect(0,0,w,h);
  while (x<w){
    float k = wave*noise(x/100,time);
    noStroke();
    ellipse(x,200+(k),3,3);
    strokeWeight(1);
    stroke(1,111);
    line(x,200+(k),x,h);
    x++;
  }
  time = time+.02;

}

