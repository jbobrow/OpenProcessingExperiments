
// Name: pia massa
// Date: 07/01/2014
// Project: Trafic Light

void setup() {  //setup function called initially, only once
size (250, 250) ;
}

void draw() {  //draw function loops 
fill (0, 0, 0) ; // black
rect(90, 30, 70, 180); //box for traffic light


fill (255, 0, 0); // color red
ellipse (125, 60, 50, 50) ;


fill (255, 255, 0) ; // yellow
ellipse (125, 120, 50, 50) ;

fill (0, 255, 100) ; // green
ellipse (125, 180, 50, 50) ;

}
