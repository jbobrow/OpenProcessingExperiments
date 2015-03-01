
int X = 700;
int y = 800;
int r = 255;


int x = 0;
int x2 =0;
int x3 =0;
int x4 =0;
int half =20;
int switchDir = 0;

void setup() {
 size(X,y); 
 noStroke();
noCursor();

  
}

void draw(){
  background(r);//background rgb values
  fill(#55D8D7);//fill rgb values of circle
 ellipse(width/2, height/2, width/2,width/2);
fill(255);

x = x + 2;
x2 = x2 + 2;
x3 = x3 + 2;
x4 = x4 + 2;

if (mousePressed == true) {
//rect 1
if( x > 250){    //tells circle on X axis to stop if near edge of applet
 x = 250;
 }
 
//rec 2
if( x2 >190){    //tells circle on X axis to stop if near edge of applet
 x2 = 190;
}
 //rec 3
 if( x3 > 430){ //tells circle on X axis to stop if near edge of applet
x3 = 430;
 }
 
 //rec 4
 if( x4 >370){    //tells circle on X axis to stop if near edge of applet
x4 = 370;
 }
 
 
 rect(x,300,20,350);//first T
 rect(x2,300,150,20);
 rect(x3,300,20,350);//second T
 rect(x4,300,150,20);


 
}
  
  
}
