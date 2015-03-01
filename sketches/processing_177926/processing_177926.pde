
float i;
float e;
void setup(){
  size(900,600);
  background(0);
    colorMode(HSB);
}int   c;

void draw(){
  background(0);
  e+=0.15;
  c++;
float  b=250+40*cos(40*c/10);


//ellipse (e*100 ,250+40*cos(40*e/10),25,25);
for (i=0;i<50;i+=0.014){
  strokeWeight(4 );
 stroke( i*50, 255, 255 );
point(i*100 ,250+40*cos(40*(i/3*i+4*i/4*i)*0.014));
 stroke( i*400%250, 255, 255 );
point(i*100 ,350+(40*cos(40*i/10)*sin(400*i/10*i/40+2* PI*40*cos(40*i/10)/40)/2));
 stroke( (400*cos(40*i/10)*sin(400*i/10*i/40+2* PI*40*cos(40*i/10)/40)/2)%150, 255, 255 );
 
rect(25+i*100%400,400+(i*8)/5,3,3);
}
}
