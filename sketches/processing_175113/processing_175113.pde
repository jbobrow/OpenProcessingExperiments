
// Physics-based simulation of a simple pendulum.
// with  friction (damping)

float lengthOfPendulum = 160.0;
float g=9.81;
int t=0;
float rot0=78;
float rot=0;
int diameter=25;
PVector pos;
// param amorti
float mu=0.33;
// mass 
float m=3;
// font text
PFont f;
// drag
boolean dragging = false;
float theta=0;
float velo=0;
int motion=1;
float rotold=0;
float veloold=0;

void setup()
{
  size(720,360);
  background(0);
  smooth();
  frameRate(20);
  f = createFont("Arial",16,true); 
  pos = new PVector(lengthOfPendulum,0);
}
 
void draw()
{
  //text for variables
  pushMatrix();
    fill(0);
    rect(0, 0, width/2, height);
    textFont(f,16);                 
    fill(100);       
    text("Drag the pendulum !",10,20); 
    if (motion==1)
      text("damped pendulum (press key 'a')",10,40);
    else
      text("undamped pendulum (press key 'a')",10,40);
    text("v   ="+velo,10,60);  
    text("m   ="+m,10,80); 
    text("(press key 'l' or 'm')",100,80); 
    text("rot ="+nf(rot,0,6),10,100);
    text("t   ="+t  ,150,100);
    text("mu  ="+mu  ,10,120);
    text("radiants:rot0="+radians(rot0) ,10,140);
    text("degrees :rot0="+rot0 ,10,160);
    fill(0);
    rect(width/2, 00, width, 30);
    fill(100);
    text("Graph: angle X angular velocity (press 'c' to clear)" ,width/2,20);
  popMatrix();
  
  // interaction and compute position
  pushMatrix();
    translate(width/4, height/2);
    //axis
    stroke(200);
    strokeWeight(1);
    line(0, 0, 0,height/2);
    line(-10, 0, 10,0);
    // motion
    if (motion==1)
      update1(t);
    else 
      update(t);
    if (t<1000)
      t++;
    coordPolToCart();    
    drawPendulum((int)pos.x,(int)pos.y);
    stroke(0,255,0);
    point(pos.x,pos.y);
    drag();
    if (dragging){
      rot0=degrees(theta);
      t=0;
      println("DRAG:"+dragging,rot0,degrees(theta));
    }
  popMatrix();
  // Graph : angle x angular velocity
  pushMatrix();
    translate(3*width/4, height/2);
    //axis
    stroke(200);
    strokeWeight(1);
    line(0,-height/2+30,0,height/2);
    line(-height/2, 0, height/2,0);
    if (motion==1)
      Velocity(t);
    else
      Velocity2(t);
    //println(rot,velo);
    stroke(255,255,0);
    line (rotold,veloold*10,rot,velo*10);
    //point(rot,velo*10);
    rotold=rot;
    veloold=velo;
  popMatrix();
}
 
// ****  without friction
void update(int t){
  rot=rot0*cos((float)(Math.sqrt(g/lengthOfPendulum)*t));
  //println(t+","+rot);
}
// ****  with friction
// x''+mu/mx'+k/mx=0
// with lb=mu/2m et w0=sqrt(k/m)=sqrt(g/m)
// sol rot=rot0*e(-Lbwt)*cos(sqrt(1-lb²)*w*t+Phi)
void update1(int t){
  if (!dragging){
  float lb=mu/(2*m);
  float w=(float)Math.sqrt(g/lengthOfPendulum);
  float Phi=rot0;
  rot=(float)(rot0*Math.exp(-lb*w*t)*cos((float)(Math.sqrt(1-lb*lb)*w*t+Phi)));
  }
}
//motion no damped
void Velocity2(int t){
  if (!dragging){
  float w=(float)Math.sqrt(g/lengthOfPendulum);
  float Phi=rot0;
  velo=(float)(-rot0*w*sin((float)(w*t+Phi)));
  }
}
// motion damped
void Velocity(int t){
  if (!dragging){
    float lb=mu/(2*m);
    float w=(float)Math.sqrt(g/lengthOfPendulum);
    float w0=(float)Math.sqrt(g/m);
    float exp=(float)Math.exp(-lb*t);
    float Omega=(float)Math.sqrt(1-lb*lb)*w;
    float X0=rot0;
    float Y0=(lb/Omega)*X0;
    velo=(float)(-lb*exp*(X0*cos(Omega*t)+Y0*cos(Omega*t))
    +exp*(-X0*Omega*sin(Omega*t)+Y0*Omega*cos(Omega*t)));
  }
}

void drawPendulum(int mx,int my)
{
  stroke(255);
  strokeWeight(2);
  line(0, 0, mx, my);
  fill(255, 0, 0);
  stroke(255, 255, 0);
  strokeWeight(2);
  ellipse(mx, my, diameter, diameter);
}
 
void keyPressed() {
  if (key == ' ') {
    t=1001;
  }
  if ((key == 'l')&&(m<10)) {
    m++;
  }
  if ((key == 'm')&&(m>0)) {
    m--;
  }
  if (key == 'a') {
    if (motion==1)
      motion++;
    else 
      motion --;
  }
  if (key == 'c')
    clearGraph();
}
float norme(float x,float y){
  return (float)(Math.sqrt(x*x+y*y));
}
//Polar to cartesian conversion
void coordPolToCart(){
   //float l=norme(pos.x,pos.y);
   float l=lengthOfPendulum;
   pos.set((float)(l*Math.cos(radians(rot)+HALF_PI)),(float)(l*Math.sin(radians(rot)+HALF_PI)));
}
//----- mouse interaction
void mousePressed() {
  clicked(mouseX,mouseY);
  println("//*****"+mouseX,mouseY,pos.x,pos.y);
} 
void mouseReleased() {
  stopDragging();
}

void clicked(int mx, int my) {
    float d = dist(mx-width/4,my-height/2,pos.x,pos.y);
    if (d < diameter/2) {
      dragging = true;
      background(0);
      //println(">>>>"+mouseX,mouseY,dragging,pos.x,pos.y);
    }
  }
 
  void stopDragging() {
    dragging = false;
  }
  void clearGraph(){
    fill(0);
    rect(width/2, 0,width , height);
  }
  void drag() {   
    if (dragging) {
      //background(0);
      PVector center=new PVector(width/4,height/2);
      PVector mouse = new PVector(mouseX,mouseY);  
      // coordinates to display  
      int mx=0;
      int my=0;
      mouse.sub(center);
      mouse.normalize();
      mouse.mult(150);         
      float r=lengthOfPendulum;
      // positive to left and negative to right     
      if (mouse.y>0)
         theta=atan2(mouse.y,mouse.x)-radians(90);
      else 
         theta=2*PI+atan2(mouse.y,mouse.x)-radians(90);  
      if (theta>PI) theta=-2*PI+theta;    
      pos.set(r*sin(theta),r*cos(theta),0); 
      pos.add(center);   
      mx=(int)(mouse.x);
      my=(int)(mouse.y); 
      //drawPendulum(mx,my);
      stroke(255, 255, 0);
      line (0,0,mx,my);
      println("***** "+rot,dragging,theta,"----",pos.x,pos.y);   
    }
}



