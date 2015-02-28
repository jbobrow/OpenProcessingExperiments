
int rectW = 50;
int rectH = 50;

void setup(){
  size(600,600);
  background(255,100,15);
  smooth();

}

void draw(){
  //(start; end; increment)
  for(int j=0; j < 15; j++){
    for(int i=0; i < 10; i++){
      //increments the x value by i (loops 10 times)
      //increments the y value by j (loops 15 times)
      rect(i*rectW, j*rectH,rectW, rectH);
    }
  }
  
}
                
                
