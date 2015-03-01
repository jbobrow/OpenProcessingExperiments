

int a = 0;
int b = 0;

void setup() {
  size(500, 500);
  background(250);
  //set the screen size
}

void draw(){
  line(a,300,500,a);
  line(500,a,300,a);
  //draw the 'grid' of lines, using the stroke that will gradually turn from black to purple
   stroke(0,255,200);
   line(500,500,b,b);
    line(b,b,500,300);
  //draw the 'grid' of lines, using the stroke that will gradually turn from black to purple
  stroke(255,0,255);
  //draw the 'expanding square' that gradually turns green
  a+=2;
  b+=3;
  //increasing the two variables by 2 and 3
}


