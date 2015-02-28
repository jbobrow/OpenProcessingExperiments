
class Particle {
  
 PVector location, vel, acc, locationOriginal;
 float particleSize, particleSizeMax, distance;
 float redColor = 0;
 float locOriX, locOriY;
 
 
 Particle(PVector _location, PVector _locOriginal, int _particleSize, int _maxParticleSize) {
   location = _location;
   locOriX = location.x;
   locOriY = location.y;
   particleSize = (float) _particleSize;
   particleSizeMax = (float) _maxParticleSize;
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

   redColor = map(distance, 0, 200, 0, 255);
 }
 
 void updateLocation () {
   if(location.x >= mouseX) {
    location.x -= abs(location.x-mouseX) / 10; }
    else {
     location.x += abs(location.x-mouseX) / 10;
    }
    
   if(location.y <= mouseY) {
    location.y += abs(location.y-mouseY) / 10; }
    else {
     location.y -= abs(location.x-mouseY) / 10;
    }

 }
 
  void restoreLocation() {
   if(location.x >= locOriX) {

    location.x -= abs(location.x - locOriX) / 5; }
    else {
     location.x += abs(location.x-locOriX) / 5;
    }


   if(location.y <= locOriY) {
    location.y += abs(location.y-locOriY) / 5; }
    else {
     location.y -= abs(location.y-locOriY) / 5;
    }


   }
 
 void draw() {
   ellipseMode(CENTER);
   noStroke();
   fill(0, (int) redColor, 255, map(particleSize, 0, particleSizeMax, 255, 0));
   ellipse(location.x, location.y, particleSize, particleSize);
 }
  
}

