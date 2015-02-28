
float x;
float a = 0;
float t = .001;
int m = 0;
void setup(){
  background(150);
  x=width*height;
}
void draw(){
  a++;
  loadPixels();
  switch(m){
    case 0:
    println(0);
      for(float i=0;i<1000;i++){
        pixels[r(i+a/100)] += pixels[r(i*a/100)];
      }break;
    case 1:
      for(float i=0;i<1000;i++){
        pixels[r(i+a/100)] -= pixels[r(i*a/100)];
      }break;
    case 2:
      for(float i=0;i<1000;i++){
        pixels[r(i+a/100)] *= pixels[r(i*a/100)]+t;
      }break;
    case 3:
     for(float i=0;i<1000;i++){
       pixels[r(i+a/100)] /= pixels[r(i*a/100)]+t;
     }break;
    default:break;
  }
  updatePixels();
}

int r(float a){
  return int(noise(a)*x);
}

void keyPressed(){
  if(key=='r'){
    background(150);
    return;
  }else if(key=='x'){
    t+=.001;
    return;
  }else if(key=='z'){
    if(t>0)t-=.001;
    return;
  }
    
  m++;
  m%=4;
}

