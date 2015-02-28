
int var;
int DOTSize;
int c;
int x1,y1;
int h,s;

void setup(){
  x1 = 0;
  y1 = 0;
  var = 20;
  size(800,400);
  background(255);
  frameRate(60);
  smooth();
}

void draw(){

  colorMode(HSB);
  color c = color(random(150,260),150,h);

  DOTSize = 20;
  DOT(x1,y1,DOTSize,c);
  x1= x1+var;
  h=int(random(190,345));
  //  println(h);
  if (mousePressed){
h = 255;
  }
  else{
    if(h>255){
      h=0;
    }

  }


  if (x1 > width || x1<0 ) {  /////// checks for sheet width end
    var = var * -1;  
    y1 = y1+10;
  }


  if(y1>height){   /////// checks for sheet length end
    background(255);
    y1 = 0;
  }

}


/// prints dots
void DOT(int x,int y,int body,color c){
  noStroke();
  fill(c);
  rect(x,y,body,body/2);
}




















