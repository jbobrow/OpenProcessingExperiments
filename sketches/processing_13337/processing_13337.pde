
void setup() {
  size(600, 400,P3D);
  background(255);
  frameRate(60);
  smooth(); //anti-aliased
  
}

void draw(){

    float a = random (5,500);
    float b = random (0,300);
    float f = random (1,3);    
    float mycolor = random (0,255);

    
//triangulos
    noStroke(); 
    fill(0,mycolor,mycolor);
   // triangle(a,a,a,a,a,a);
    triangle(a*f, b*f, (a+20)*f, (b+20)*f, (a+30)*f, b*f);

} // end draw


