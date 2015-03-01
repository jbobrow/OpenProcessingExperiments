

float d = 80;
float c = 100;
float b = 30 ;
float a = 0.001;


void setup() {
  size(500, 500);
  background(0);
}
 
void draw() {
translate(width/2, height/2);
float e = 2*PI/a;               //the rotation is controled
rotate(e);
fill(0, d, 0, 50);
ellipse(b, b, c, c);
a += 0.000001;
b += 0.4;              //distance of the center grows
//c += 5;              //decided to keep the same diameter
d += 5;                //a little variation in tones of green
if(d>100){                      
  d = 80;
}


if(e<12*PI){           //this does not enables two circles
  a=0.01;              //to be too much closer
}

}


