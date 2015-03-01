
Fish[] fishicon = new Fish[2];
waveTwo[] wavetwo = new waveTwo[1];
waveOne[] waveone = new waveOne[1];
PImage mouseFront;
PImage mouseBack;
PImage chest;
PImage coral;

void setup() {
  size(600,600);
  frameRate(60);
  mouseFront = loadImage("fish-front.png");
  mouseBack = loadImage("fish-back.png");
  coral = loadImage("coral.png");
  chest = loadImage("chest.png");  
  noCursor();

  for (int i = 0; i < fishicon.length; i++) {
    fishicon[i] = new Fish(); 
  }  
  //Waves
  for (int i = 0; i < wavetwo.length; i++) {
  wavetwo[i] = new waveTwo(); 
  }  
  for (int i = 0; i < waveone.length; i++) {
    waveone[i] = new waveOne(); 
  }
}

void draw() {
  background(132,209,228);
  image(chest, 300, 460, 600, 282);
  imageMode(CENTER);
  //Mouse
  if (mouseX < 300) {
      image(mouseFront, mouseX, mouseY, 71, 33);
  } else {
    image(mouseBack, mouseX, mouseY, 71, 33);
  }
  for (int i = 0; i < fishicon.length; i++) {
    fishicon[i].update();
    fishicon[i].display(); 
  }   
  //Waves
  for (int i = 0; i < wavetwo.length; i++) {
    wavetwo[i].update();
    wavetwo[i].display(); 
  }
  for (int i = 0; i < waveone.length; i++) {
    waveone[i].update();
    waveone[i].display(); 
  }


  image(coral, 510, 430, 188, 351);


  
}
class waveOne {
  
  
  
PImage img;   
PVector location;
PVector velocity;
PVector acceleration;
float topspeed;
 
waveOne() {
  location = new PVector(random(width),random(height));
  velocity = new PVector(0,0);
  topspeed = 3;
}
 
void update() {    
    PVector mouse = new PVector(mouseX,mouseY);
    PVector acceleration = PVector.sub(mouse,location);    
    acceleration.normalize();
    acceleration.mult(0.2);    
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
    
    img = loadImage("waveOne.png");

    
  }

  void display() {
      imageMode(CENTER);
      image(img, location.x,130,3596,55 );
  } 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
  
}
class Fish {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;

  Fish() {
    location = new PVector(random(width),random(height));
    velocity = new PVector(0,0);
    topspeed = 6;
  }

  void update() {
    
    PVector mouse = new PVector(mouseX,mouseY);
    PVector acceleration = PVector.sub(mouse,location);
    acceleration.normalize();
    acceleration.mult(0.2);
    
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
  }

  void display() {
//    stroke(0);
//    strokeWeight(2);
//    fill(127,200);
//    ellipse(location.x,location.y,48,48);
  if (mouseX < 300) {
      image(mouseFront,location.x,location.y, 71, 33);
  } else {
    image(mouseBack,location.x,location.y, 71, 33);
  }
  }

}


class waveTwo {
   
PImage img2;   
PVector location;
PVector velocity;
PVector acceleration;
float topspeed;
 
waveTwo() {
  location = new PVector(random(width),random(height));
  velocity = new PVector(0,0);
  topspeed = 3;
}
 
void update() {    
    PVector mouse = new PVector(mouseX,mouseY);
    PVector acceleration = PVector.sub(mouse,location);    
    acceleration.normalize();
    acceleration.mult(0.2);    
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
    
    img2 = loadImage("waveTwo.jpg");

    
  }

  void display() {
      imageMode(CENTER);
      image(img2, location.x,50,3596,200 );
      
  } 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
  
}
//class mouse {
//
//PImage mouse;
//
//void update() {
//  
////}
//
//void display() {
//  background(121, 157,255); 
//  imageMode(CENTER);
//  image(mouse, mouseX, mouseY, 180, 180); 
//}
//
//}


