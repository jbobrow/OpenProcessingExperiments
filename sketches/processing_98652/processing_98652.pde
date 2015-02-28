
lanet Mercury;
Planet Venus;
Planet Earth;
Planet Mars;
Planet Jupiter;
Planet Saturn;
Planet Uranus;
Planet Neptune;

void setup() {
  size(1000,1000);
  Mercury = new Planet(color(#999966),30,5);
  Venus = new Planet(color(#996633),50,15);
  Earth = new Planet(color(#005C99),75,20);
  Mars =new Planet(color(#CC3300),100,10);
  Jupiter=new Planet(color(#CC6600),200,75);
  Saturn=new Planet(color(#B28F6B),350,60);
  Uranus=new Planet(color(#666699),450,25);
  Neptune=new Planet(color(#0099FF),550,25);
  
}
 
 
void draw() {
  background(0);
  stroke(250);
  ellipseMode(CENTER);
  stroke(0);
  fill(0);
  fill(#FCFC00);
  ellipse(width/2,height/2,30,30);
  Mercury.orbit();
  Mercury.display();
  Venus.orbit();
  Venus.display();
  Earth.orbit();
  Earth.display();
  Mars.orbit();
  Mars.display();
  Jupiter.display();
  Jupiter.orbit();
  Saturn.orbit();
  Saturn.display();
  Uranus.orbit();
  Uranus.display();
  Neptune.orbit();
  Neptune.display();
}
 
class Planet {
  color pcolor;
  float size, distance, speed, xpost, ypost, grav; 
 
 
  Planet(color varC, float varD, float varS) {
    pcolor = varC;
    distance = varD;
    size = varS;
    speed = sqrt(2000/sq(distance));
    xpost = width/50;
    ypost = (height/2)-distance;
    grav = 0;
  }
 
  void display() {
    stroke(0);
    fill(pcolor);
    ellipseMode(CENTER);
    ellipse(xpost,ypost,size,size);
  }
 
  void orbit() {
    grav = grav + speed/distance;
    xpost = width/2-distance*sin(grav);
    ypost = height/2-distance*cos(grav);
  }
}
