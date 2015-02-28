


int num = 1000;
  PVector [] location = new PVector[num];
   PVector [] target = new PVector[num];
  PVector[] acc = new PVector[num];
   PVector []  vel = new PVector[num];
     PVector[] steer = new PVector[num];
     PVector[] desired = new PVector[num];
       float r = 3.0;
  float maxforce = 0.015;    // Maximum steering force
  float maxspeed = 6.0;
  float theta;
void setup() {
  size(400,400);

for (int i =0; i<num; i++){
  acc [i]= new PVector(0,0);
  vel [i] = new PVector(0,0);
  
  location[i] =  new PVector(random(width), random(height));

}
  smooth();
}

void draw() {
  background(255);
 target[0] = new PVector(mouseX, mouseY);

   for (int i = 1; i<num-1; i++){
     maxforce+=0.015;
   target[i] = location[i-1];
      desired[i] = PVector.sub(target[i],location[i]);  // A vector pointing from the location to the target
   
      desired[i].normalize();
      desired[i].mult(maxspeed);
    
      steer[i] = PVector.sub(desired[i],vel[i]);
      steer[i].limit(maxforce);  // Limit to maximum steering force
      acc[i].add(steer[i]);

    // Update velocity
    vel[i].add(acc[i]);
    // Limit speed
    vel[i].limit(maxspeed);
    location[i].add(vel[i]);
 theta = vel[i].heading2D() + radians(90);
  target[i] = location[i].get();

noFill();
    stroke(0);
    pushMatrix();
    translate(location[i].x,location[i].y);
    rotate(theta);
    beginShape(TRIANGLES);
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape();
    popMatrix();
 


if (location[i].x < -r) location[i].x = width+r;
    if (location[i].y < -r) location[i].y = height+r;
    if (location[i].x > width+r) location[i].x = -r;
    if (location[i].y > height+r) location[i].y = -r;


}

}



