

void setup() {
  size(700, 700);
  //ellipseMode(CENTER);
  background(255);
  smooth();
}
 
 
//sunflower pattern
void draw(){
  patternDraw();
}

void patternDraw(){
  //pattern based on vogel's spiral
  //http://en.wikipedia.org/wiki/Fibonacci_number#In_nature
 
 stroke(100.0,0.0,100.0,50);
 //fill(100,0,100,50);
 pushMatrix();
 scale(10);

 float r, t;
 for (int n = 1; n<500; n++){
    r = sqrt(n);
    t = 137.5 * (PI/180) * n;
    
    //println(r*cos(t));
    //println(r*sin(t));
    ellipse(r*cos(t)+35, r*sin(t)+35, 3,3);
      
  }
 
 popMatrix();
   
}


/*
n=1:500;
r=sqrt(n);
t=137.5*pi/180*n;
plot(r.*cos(t),r.*sin(t),'o')
*/


