
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
  background(2);
  noFill();
  stroke (0,0);
     for(int i=0; i<360; i++){
 y=(a+i)%300;
 stroke(y,150,150);
 line(i*12,0,i*3.5,1200);

 }
}


void draw () {
  x++;
  y++;

  

 
  
  translate (width/2,height/2);
  translate (cos(a)*200, sin(b)*200);
  rotate(a*15);
  rect(24*abs(cos(b)), 50*abs(sin(c)), 50*abs(tan(a)), 20); 
  stroke(b,1000,200);
  
  rect(24*abs(sin(b)), 50*abs(sin(c)), 50*abs(sin(a)), 20); 
  stroke(y,1000,200);
  
   rect(24*abs(sin(b)), 50*abs(cos(c)), 50*abs(tan(a)), 20); 
  stroke(y,1000,200);
  a+=aS;
  
  b+=aS;
}


