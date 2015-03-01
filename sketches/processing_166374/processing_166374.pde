
int a=0;
int b=0;

void setup(){
  size(200,200);
  //set the screen size
}

void draw(){
  stroke(a,0,a);
  line(a,0,a,100);
  line(0,a,100,a);
  //draw the 'grid' of lines, using the stroke that will gradually turn from black to purple
  stroke(0,b,0);
  line(0,b,b,b);
  line(b,b,b,0);
  //draw the 'expanding square' that gradually turns green
  a+=2;
  b+=3;
  //increasing the two variables by 2 and 3 
}


