
/* 
By Sajid Saiyed 
http://www.ssdesigninteractive.com/g2 
http://www.ssdesigninteractive.com/blog 
Do let me know if you happen to imrovise this code 

Shell3D (v.0.0.1)  --- {early explorations}

Shell Equations from: Xah Lee
-----------------------------
http://xahlee.org/SpecialPlaneCurves_dir/Seashell_dir/20050120-mike_williams.txt
*/ 
void setup(){  
   size(500, 500, P3D);  
   background(255); 
   Points3d = new Vector(); 
   frameRate(36); 
 } 
  
 float r_step = 0.02; 
 float ry=0.0f; 
  
 void draw(){ 
  
 background(255); 
 stroke(0); 
  
 translate(width/2.0, height/2.0, -200.0); 
 rotateY(ry); 
 ry += r_step; 
  
 float u = random(0, 2*PI);  
 float v = random(-2*PI, 2*PI);  
 float sc = 60;  
 
 /*
 float x = sc*(2*sin(3*u) / (2 + cos(v)));  
 float y = sc*(2*(sin(u) + 2*sin(2*u)) / (2 + cos(v + 2*PI / 3)));  
 float z = sc*((cos(u) - 2*cos(2*u))*(2 + cos(v))*(2 + cos(v + 2*PI / 3)) / 4); 
 */
 
 /*
float R=1;    // radius of tube
float N=9.6;  // number of turns
float H=5.0;  // height
float P=1.5;  // power
float P1=1.1; // another power
float T=0.8;  // Triangleness of cross section
float A=0.1;  // Angle of tilt of cross section (radians)
float S=1.5;  // Stretch

float W = pow((u/(2*PI)*R), P1);

float x = sc*(W*cos(N*u)*(1+cos(v+A)+sin(2*v+A)*T/4));
float z = sc*(W*sin(N*u)*(1+cos(v+A)+sin(2*v+A)*T/4));
float y = sc*(pow(S*W*(sin(v+A)+cos(2*v+A)*T/4)  + S*H*(u/(2*PI)), P));
*/

float R=1;    // radius of tube
float N=5.6;  // number of turns
float H=4.5;  // height
float P=1.4;  // power
float L=4;    // Controls spike length
float K=9;    // Controls spike sharpness

float W = pow((u/(2*PI)*R), 0.9);

float x = sc*(W*cos(N*u)*(1+cos(v)));
float z = sc*(W*sin(N*u)*(1+cos(v)));
float y = sc*(W*sin(v)+L*pow((sin(v/2)), K)+pow(H*(u/(2*PI)),P));



 if (Points3d.size() < 10000) Points3d.add(new Point3D(x, y, z)); 
 for (int i=0; i < Points3d.size(); i++) ((Point3D)Points3d.get(i)).draw(); 
  
 } 
   
  Vector Points3d; 
   
  class Point3D 
  { 
    float x, y, z; 
    Point3D (float _x, float _y, float _z) 
    { 
 this.x = _x; this.y = _y; this.z = _z; 
    } 
    void draw() 
    { 
 point(this.x, this.y, this.z); 
    } 
  }

