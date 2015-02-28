
float miX, miY, miW ;


void setup () { 
  size (600,600);
  smooth();
  miX = 300 ;
  miY = 300 ;
  miW = 300 ;
 
  
}
 
void draw () {
  background (128);
//cara robot



fill(160,7,222);
rect (miX-(miW/2), miY - (miW/4), miW, miW/2);

fill(255);
ellipse (miX- (miW/4), miY, miW/6, miW/6);
ellipse (miX+ (miW/4), miY, miW/6, miW/6);
fill (0);
//rect (miX- (miW/2), miY -(miW/4), miW/4, miW/4);


fill (62,134,39);
rect (miX-(miW/6),miY+(miW/8),miW/6,miW/8);
rect (miX,miY+(miW/8),miW/6,miW/8);

rect (miX-(miW/4)-(miW/16), miY -(miW/2), miW/8, miW/4);
rect (miX+(miW/4)-(miW/16), miY -(miW/2), miW/8, miW/4);
ellipse (miX-(miW/4)-(miW/16), miY -(miW/2), miW/6, miW/6);
ellipse (miX+(miW/4)-(miW/16), miY -(miW/2), miW/6, miW/6);
fill (160,7,222);



ellipse (miX-(miW/4)-(miW/16), miY -(miW/2), miW/8, miW/8);
ellipse (miX+(miW/4)-(miW/16), miY -(miW/2), miW/8, miW/8);


}


