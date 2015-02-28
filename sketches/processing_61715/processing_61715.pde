
class Particle {
  
 PVector location, vel, acc;
 float particleSize, particleSizeMax, distance;
 float redColor = 0;
 
 Particle(PVector _location, int _particleSize) {
   location = _location;
   particleSize = (float) _particleSize;
   particleSizeMax = (float) _particleSize + 75;
   vel = new PVector(0,0);   
   acc = new PVector(0,0);
 } 
 
 void displayLocation() {
    println("Position: x " + location.x + " y " + location.y); 
 }
 
 void update() {
   
   distance = dist(location.x, location.y, mouseX, mouseY);
      
   particleSize += map(distance, 0, 20, 0, 0.2);
   particleSize += 0.2;
   
   if(particleSize >= particleSizeMax) particleSize = 0;
   vel.add(acc);
   location.add(vel);


   redColor = map(distance, 0, 200, 0, 255);
 }
 
 void draw() {
   ellipseMode(CENTER);
   noStroke();
   fill(0, (int) redColor, 255, map(particleSize, 0, particleSizeMax, 255, 0));
   ellipse(location.x, location.y, particleSize, particleSize);
 }
  
}

