
int N = 5;
float[] freqs = {200,200,200,200,200};
 
void setup(){
  size(400,400);
  background(#1c2433);
  colorMode(HSB,255);
}
 
void draw(){
   
  noFill();
  stroke(int(20*abs(sin(frameCount/200.))),100,int(200*abs(sin(frameCount/20.))),8);
   
  float h = height/(N-1);
   
  beginShape();
  vertex(freqs[0], 0);
   
  freqs[0] += random(8) -4;
  for(int i=1; i<N; i++){
    curveVertex(freqs[i], h*i);
    freqs[i] += random(8) -4;
  }
   
  curveVertex(freqs[N-1], height);
   
  endShape();
}


