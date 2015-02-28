

//|||||||||||||||||||||||||||||||||||||\\
//||                                 ||\\
//||  Sunil vallu                    ||\\
//||  New Media Design               ||\\  
//||  National Institute Of Design   ||\\
//||                                 ||\\
//|||||||||||||||||||||||||||||||||||||\\

float xt = 0.0;
float yt = 100000.0;
float inc = 0.01;
float ox,oy;
// for stroke color
float cs = 0.0;

void setup(){
  size(700,500);
  smooth();
  background(255); 
}


void draw(){
  float x = noise(xt)*width;
  float y = noise(yt)*height;
  xt+=inc;
  yt+=inc;
  stroke(0);
  strokeWeight(cs);
  cs+=inc;
  if(cs>2){
    cs=inc;
  }
  line(x,y,ox,oy);
  ox = x;
  oy = y;
}





