
//Code Used: 
//PolarToCartesian
// * by Daniel Shiffman. 
// And big bang from Choonghyun Seo (on open processing) 


float r;
// Angle and angular velocity, accleration
float theta;
float theta_vel;
float theta_acc;
P[] p1 = new P[10000];
 
void setup() {
 size(600,600);
 frameRate(60);
 
  // Initialize all values
  r = 100;
  theta = 0;
  theta_vel = 0;
  theta_acc = 0.0005;
   
 for(int i=0; i<p1.length; i++){
   p1[i] = new P();
 }
}
 
void draw() {
  background(0);
  translate(width/2, height/2);
    // Convert polar to cartesian
  float x = r * cos(theta)*2;
  float y = r * sin(theta)*2;
   // Draw the ellipse at the cartesian coordinate
  ellipseMode(CENTER);
  noStroke();
  fill(10,200,10);
  ellipse(x, y, 10, 10);
  
  // Apply acceleration and velocity to angle (r remains static in this example)
  theta_vel += theta_acc;
  theta += theta_vel;
  bang();
}
 
void bang() {
  for(int i=0; i<p1.length; i++) {
     p1[i].move();
  }
}
 
class P{
 
  float dis;
  float tX,tY;
   float dx,dy;
   float cX,cY;
   float oX,oY;
   color cr;
 
   P(float _cX, float _cY, color _cr, int rad) {
       cr = _cr;
       float rX= random(-1*rad,rad);
       float rY= random(-1*sqrt(rad*rad-rX*rX), sqrt(rad*rad-rX*rX));
       dis = sqrt(rX*rX+rY*rY);
       oX = _cX;
       oY = _cY;
       cX = _cX;
       cY = _cY;
       tX = rX+_cX;
       tY = rY+_cY;
       if(dis != 0) {
         dx = abs(rX)/dis;
       }
       if(rX+cX < cX) {
         dx = -1*dx;
       }
   
       if(tX != cX) {
          dy = rY/rX*dx;
       }
 
   }
    
   P() {
     this(0,0,color(0),300);
   }
    
   void move() {
     if(cr==#000000) {
       stroke(random(255),(200),random(255));
     }else{
       stroke(cr);
     }
     if(dis > sqrt((cX-oX)*(cX-oX)+(cY-oY)*(cY-oY))) {
       cX = cX + dx;
       cY = cY + dy;
       point(cX, cY);
     }else{
       point(cX, cY);
     }
      
   }
   
}


