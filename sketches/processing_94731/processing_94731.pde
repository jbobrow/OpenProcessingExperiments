
float x;
float r = random(200);
float noiseY;
void setup(){

  size(1200,700);
  frameRate(10);
}
void draw(){
    background(255);

float c = mouseX;
float r = random(c);

for (int i = 0; i < 1200; i=i+3) {

  
  x = i * (width/r) ;
     line (x,height,x ,noiseY);
     

}

}


