
int x=-256;
int y=16;
int z=1;
float a=-256;
float b;
float aa=1;
void setup(){
  size(512,512);
}
void draw(){
  b=a*a;
  x+=y;
  a+=aa;
  translate(256,256);
  rotate(3*PI/2);
  if (x==0){
    z=4;
  }else if(x%32==0){
    z=2;
  }else{
    z=1;
  }
  stroke(0);
  strokeWeight(z);
  line(-256,x,512,x);
  line(x,-256,x,512);
//to stop drawing when it passes 256
  if (a>=256){
    y=0;
    a=0;
    //background(255);
  }
    //you can change speed to (1,3,or 5)
    noStroke();
    //centerpoint (using translate)
    fill(255,0,0);
    ellipse(0,0,15,15);
    //function(y=x)
    fill(255,255,0);
    ellipse(a,a,5,5);
    //function(y=x*x)
    fill(255,0,255);
    ellipse(b/150,a,5,5);
    //function(y=1/x)
    fill(0,200,200);
    ellipse((5000/a),a,3,3);
    //function(y=0)
    fill(0,255,0);
    ellipse(0,a,10,10);
    //function(y=sin(x))
    fill(0,0,255);
    ellipse(sin(a/10)*50,a,5,5);
    //function(y=tan(x))
    fill(100,100,250);
    ellipse(tan(a/100)*50,a,5,5);
    //function(y=log(x))
    fill(0,150,0);
    ellipse(log(a/100)*50,a,5,5);
    if(mousePressed){
      stroke(0);
      x=-256;
      a=-256;
      aa=1;
    }
}

