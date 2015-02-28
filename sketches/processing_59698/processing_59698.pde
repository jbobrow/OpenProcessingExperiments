
float a=0;
float b=361;
float c=211;
float aS=0.174;
float x=1;
float y=1;

void setup (){
  
  size (1200,1200);
  smooth ();
  colorMode(HSB);

 }



void draw () {
  x++;
  y++;

  
  stroke(255*abs(sin(b)), 50*abs(cos(c)), 50*abs(cos(a)), 20);
  translate (width/2,height/2);
  translate (cos(a)*200, sin(b)*200);
  rotate(a*5);
  line(0,0,100*sin(x),100);
  a+=aS;
  b+=aS;
}
