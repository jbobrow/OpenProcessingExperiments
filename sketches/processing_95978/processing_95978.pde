
float dt = 0.2;
float angle1 = PI;
float angle2 = PI + 0.0001;
float g = 9.8;
PVector p1, p2;             //points
float mass1 = 1, mass2 = 1;       //point mass
float l1 = 70;              //length of the 1st arm
float l2 = 70;              //length of the 2nd arm
 

float rotacc1, rotacc2;     //rotary acceleration
float rotvel1, rotvel2;
 
 
void setup(){
  size(300, 300);
  p1 = new PVector();
  p2 = new PVector();
   
}
 
 
void draw(){
   
  background(255);
 
  rotacc1 = (-g * (2 * mass1 + mass2) * sin(angle1) - mass2 * g * sin(angle1 - 2 * angle2) - 2 * sin(angle1 - angle2) * mass2 * (rotvel2 * rotvel2 * l2 + rotvel1 * rotvel1 * l1 * cos(angle1 - angle2))) / (l1 * (2 * mass1 + mass2 - mass2 * cos(2 * angle1 - 2 * angle2)));
  rotacc2 = (2 * sin(angle1 - angle2) * (rotvel1 * rotvel1 * l1 * (mass1 + mass2) + g * (mass1 + mass2) * cos(angle1) + rotvel2 * rotvel2 * l2 * mass2 * cos(angle1 - angle2))) / (l2 * (2 * mass1 + mass2 - mass2 * cos(2 * angle1 - 2 * angle2)));
   
  rotvel1 += rotacc1 * dt;
  rotvel2 += rotacc2 * dt;
  
  angle1 += rotvel1 * dt;
  angle2 += rotvel2 * dt;
 
  p1.set(l1 * sin(angle1), l1 * cos(angle1), 0);
  p2.set(p1);
  p2.add(l2 * sin(angle2), l2 * cos(angle2), 0);
   
  translate(width / 2, height / 2);
  line(0, 0, p1.x, p1.y);
  line(p1.x, p1.y, p2.x, p2.y);
  ellipse(p1.x, p1.y, 10, 10);
  ellipse(p2.x, p2.y, 10, 10);
   
}

void mouseReleased() {
    angle1 = PI;
    angle2 = PI + 0.0001;
    rotvel1 = rotvel2 = 0;
}


