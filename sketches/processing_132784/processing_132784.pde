

PImage sfondo; 
PFont font;
String str1="Accademia",str2="Di",str3="Belle",str4="Arti",str5="Di",str6="Catania";

PVector location;  // Location of shape
PVector velocity;  // Velocity of shape
PVector gravity;   // Gravity acts at the shape's acceleration

PVector location1;  // Location of shape
PVector velocity1;  // Velocity of shape
PVector gravity1;   // Gravity acts at the shape's acceleration

PVector location2;  // Location of shape
PVector velocity2;  // Velocity of shape
PVector gravity2;   // Gravity acts at the shape's acceleration

PVector location3;  // Location of shape
PVector velocity3;  // Velocity of shape
PVector gravity3;   // Gravity acts at the shape's acceleration

PVector location4;  // Location of shape
PVector velocity4;  // Velocity of shape
PVector gravity4;   // Gravity acts at the shape's acceleration

PVector location5;  // Location of shape
PVector velocity5;  // Velocity of shape
PVector gravity5;   // Gravity acts at the shape's acceleration

void setup() {
  
  sfondo= loadImage("Sfondo.jpg");
  size(640,360);
  smooth();
  
  location = PVector.random2D();
  velocity = new PVector(1.6,2.3);
  gravity = new PVector(0,0.2);
  
  location1 = PVector.random2D();
  velocity1 = new PVector(1.5,2.1);
  gravity1 = new PVector(0,0.2);
  
  location2 = PVector.random2D();
  velocity2 = new PVector(1.4,2.8);
  gravity2 = new PVector(0,0.2);
  
  location3 = PVector.random2D();
  velocity3 = new PVector(1.7,2.7);
  gravity3 = new PVector(0,0.2);
  
  location4 = PVector.random2D();
  velocity4 = new PVector(1.1,2.2);
  gravity4 = new PVector(0,0.2);
  
  location5 = PVector.random2D();
  velocity5 = new PVector(1.2,2.9);
  gravity5 = new PVector(0,0.2);
  
  font = loadFont ("ArialMT-48.vlw");
  textSize(32);
  stroke(4);

}

void draw() {
  background(sfondo);
  
  location.add(velocity);
  velocity.add(gravity);
  
  if ((location.x > width) || (location.x < 0)) {
    velocity.x = velocity.x * -1;
  }
  if (location.y > height) {
    velocity.y = velocity.y * -0.95; 
    location.y = height;
  }
  
  location1.add(velocity1);
  velocity1.add(gravity1);
  
  if ((location1.x > width) || (location1.x < 0)) {
    velocity1.x = velocity1.x * -1;
  }
  if (location1.y > height) {
    velocity1.y = velocity1.y * -0.95; 
    location1.y = height;
  }
  
  location2.add(velocity2);
  velocity2.add(gravity2);
  
  if ((location2.x > width) || (location2.x < 0)) {
    velocity2.x = velocity2.x * -1;
  }
  if (location2.y > height) {
    velocity2.y = velocity2.y * -0.95; 
    location2.y = height;
  }
  
  location3.add(velocity3);
  velocity3.add(gravity3);
  
  if ((location3.x > width) || (location3.x < 0)) {
    velocity3.x = velocity3.x * -1;
  }
  if (location3.y > height) {
    velocity3.y = velocity3.y * -0.95; 
    location3.y = height;
  }
  
  location4.add(velocity4);
  velocity4.add(gravity4);
  
  if ((location4.x > width) || (location4.x < 0)) {
    velocity4.x = velocity4.x * -1;
  }
  if (location4.y > height) {
    velocity4.y = velocity4.y * -0.95; 
    location4.y = height;
  }
  
  location5.add(velocity5);
  velocity5.add(gravity5);
  
  if ((location5.x > width) || (location5.x < 0)) {
    velocity5.x = velocity5.x * -1;
  }
  if (location5.y > height) {
    velocity5.y = velocity5.y * -0.95; 
    location5.y = height;
  }

  stroke(255);
  strokeWeight(2);
  fill(127);
  text(str1,location.x,location.y);
  text(str2,location1.x,location1.y);
  text(str3,location2.x,location2.y);
  text(str4,location3.x,location3.y);
  text(str5,location4.x,location4.y);
  text(str6,location5.x,location5.y);
}




