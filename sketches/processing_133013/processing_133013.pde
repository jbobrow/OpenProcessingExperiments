
int i = 1;
float fn = 0;

void setup(){
  smooth(8);
  size(800,600);
  stroke(255);
  frameRate(30);
}

void draw(){
  fn +=1;
  background(0,0,150);


  for(int x = 0; x < width; x=x+1){
  
      stroke(255,255,255);
      float n = noise(float(x)/100,fn/100);
      n = map(n,0,1,90,250);
      line(x,0,x,n-1);
    }

  i+=1;

}

