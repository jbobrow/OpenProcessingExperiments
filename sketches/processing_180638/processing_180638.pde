
void setup(){ size(800,600);
background(0);
}//float  x,y ,theta ,cos ,sin, r,t;
float a=800 , b=100 , n ,r,x,y;
 final double scale = 800;
     final double step = 1 / scale;
void draw(){
 
// x=200; y=200;
  background(0);
  translate(300,300);
  stroke(250,250,0);
  line(0,0,400,0);
    line(0,0,0,-480);

 for (float t = 0; t <= 2*PI; t+= step) {
  r=+millis()/100*(( sin(3*(t)))/(sin((3-1)*t))) ;
    x = (r * cos(t));
    y = (r * sin(t));
  
   point(x,y);
 }

/* t+=radians(5); 
 // r=sqrt( sq(x )+sq(y ));
 // theta=atan(y/x);
 theta=200;
  r=100-sin(theta);

 rect(+r*cos( (theta)),r*sin( (theta)),20,20);

//rect(x,y,10,10);*/
}

