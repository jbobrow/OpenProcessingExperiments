

//Assignment 2
//Emily Rose
//erose@brynmawr.edu  
//September 16, 2010

float x ;  
float y ; 
float w ; 
float h ;

int circleA = 250 ;
int circleB = 260 ;
int circleC = 280 ;
int circleD = 400 ;
int circleE = 420 ; 
int circleF = 450 ;
int circleG = 100 ;
int circleH = 50 ;
int circleI = 110 ;


void setup() {
  size (600,600) ;
   
x = 0 ; 
y = 0 ; 
w = 600 ; 
h = 600 ;
}

 void mousePressed () {
  noStroke() ;
  fill(0) ;
  ellipse(80,80,7,7) ;
  ellipse(120,80,7,7) ;
  curve(50,0,80,100,120,100,150,0) ;
  }
  
void draw () {
  background(172,196,194) ;
  strokeWeight(2) ;
  smooth () ;


 
//draw sun
fill(250,210,10) ;
noStroke() ;
ellipse (100,100,100,100) ;

//draw clouds

noStroke() ;
fill(245,243,237) ;

ellipse(circleA,100,90,50) ;
circleA = circleA + 1 ;
ellipse(circleB,85,90,50) ;
circleB = circleB + 1 ;
ellipse(circleC,120,90,50) ;
circleC = circleC + 1 ;
ellipse(circleD,200,90,60) ;
circleD = circleD + 1 ;
ellipse(circleE,175,80,50) ;
circleE = circleE + 1 ;
ellipse(circleF,200,90,60) ;
circleF = circleF + 1 ;
ellipse(circleG,100,100,100) ;
circleG = circleG + 1 ;
ellipse(circleH,90,100,90) ;
circleH = circleH + 1 ;
ellipse(circleI,50,90,50) ;
circleI = circleI + 1 ;



//draw table
fill(95,68,28);
rect(0,400,600,200) ;


//draw first jar
fill(240,236,165);
quad(25,450,175,450,175,550,25,550) ;
stroke(0) ;

ellipseMode(CENTER) ;
ellipse(100,450,150,40) ; 
noStroke() ;
ellipse(100,550,150,40) ;

//draw second jar
fill (217,227,156) ;
quad(200,400,275,400,275,550,200,550) ;
stroke(0) ;
fill (217,227,156) ;

ellipse(237,400,75,15) ;
fill (217,227,156) ;

noStroke() ;
ellipse(237,550,75,15) ; 

//draw third jar

fill(222,186,132) ;
quad(375,425,500,425,500,500,375,500);
stroke(0) ;
ellipse(437,425,125,30) ;
noStroke() ;
ellipse(437,500,125,30) ;

noStroke() ;
fill(209,174,122) ;
quad(420,395,457,395,457,425,420,425) ;
ellipse(439,425,38,10) ;

stroke(3) ;
ellipse(439,395,38,10) ;

}



