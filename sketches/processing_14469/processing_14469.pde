
/* this is the gozno funeral. There will be fireworks. There will be larger
fireworks coming out of a vertical cannon. There will be an exploding gonzo
fist that turns into fireworks. There will (hopefully) be an ending where
the last fireworks for into the shape of a farewell message to HST in the sky
or possibly just a gonzo fist or possibly "RIP HST". 
Maybe one then the other... who fucking knows. I've written down the goals on a sheet of
paper somewhere around here.

Thanks to:
Dan Bayer for the image, check out his amazing project at www.kodachromeproject.com!!
Daniel Shiffman for Smoke Particle System and Autonomous Steering Behaviors
luis2048 for Fire Cube demo effect 
*****************************************************************************/


//Image proportions. can = cannon image. fist = Gonzo fist image.
final int canWidth=50 , canHeight=200, fistWidth=90, fistHeight=90, huntWidth=700, huntHeight=426; 
int mouseCount = 0;
int fistImgCounter = 0;
//amount of frames past before the fireworks burn out
final int lifeSpan = 35;
// the number of fireworks particles in each blast
final int numFireworksParticles = 100; 
// the number of particles in the cannon shot
final int numCannonShots = 200;

PImage cannonImg, fistImg, hunterImg;
Boolean cannonOver = false, fistOver = false, cannonWasShot = false;
ArrayList allParticleSystems;
//variables for steering to final image
ArrayList values;
float maxspeed = 15;
float maxforce = 1.75;


void setup () {
  size(700,700);
  frameRate(30);
  smooth();
  allParticleSystems = new ArrayList();
  values = new ArrayList();
  loadImages();
  collectImageData(hunterImg);
  colorMode(RGB);
}

void draw () {
  updateMouseLocation();
  displayTransparentImages();
  //create background with near transparency
  background(0,1);
  //display all three images (one is transparent)
  displayImages();
  //cycle through particle system and run all current particles
  for (int i = allParticleSystems.size() - 1; i >= 0;  i--) {
    ParticleSystem ps = (ParticleSystem) allParticleSystems.get(i);
    ps.run();
    if (ps.dead()) //particle is dead
      allParticleSystems.remove(i);
  }
  //make Gonzo fist shoot off like a rocket!!!
  if (cannonWasShot) {
    fistShootsOff();
  }
}  

//fireworks are generated when and where mouse is clicked, until the last click (that shoots off the cannon)
void mousePressed() {
  if (cannonWasShot){
    if(cannonOver)
      initCannonShot();       // create white particles that are shooting from the cannon
    else
      initFireworks();       //create an array of firework particles with random color
  }
  else {
    if(cannonOver || fistOver) {
      initCannonShot();       // create white particles that are shooting from the cannon
      cannonWasShot = true;
    }
    else
      initFireworks();       //create an array of firework particles with random color
  }
   mouseCount++; 
}


void updateMouseLocation()
{
  if( overCannon(width/2 - canWidth/2, height - canHeight, canWidth, canHeight) ) {
    cannonOver = true;
    fistOver = false;
  } else if ( overFist(width/2 - fistWidth/2, 2+height - (canHeight+fistHeight), fistWidth, fistHeight) ) {
    fistOver = true;
    cannonOver = false;
  } else {
    cannonOver = fistOver = false;
  }
}

boolean overCannon(int x, int y, int w, int h) 
{
  if (mouseX >= x && mouseX <= x + w && 
      mouseY >= y && mouseY <= y + h) {
    return true;
  } else {
    return false;
  }
}

boolean overFist(int x, int y, int w, int h) 
{
  if (mouseX >= x && mouseX <= x + w && 
      mouseY >= y && mouseY <= y + h) {
    return true;
  } else {
    return false;
  }
}

void initFireworks() {
  colorMode(HSB);
  color randomColor = color(millis() % 255, 255, 255); 
  ParticleSystem fireworks = new ParticleSystem();
  PVector destination; // assigns that randomImgPixel as the destination for one fireworks particle
  for (int i = 0; i < numFireworksParticles; i++) {
     destination = assignDestination();
     //create particles at mouse location with any angle and hue manipulation ON
     fireworks.addParticle(new Particle(0,2*PI,mouseX,mouseY,randomColor,true, destination));
  }
  allParticleSystems.add(fireworks);
}

void initCannonShot() {
  colorMode(RGB);
  color white = color(255);
  ParticleSystem grandFinale = new ParticleSystem();
  PVector destination;
  for (int i = 0; i < numCannonShots; i++) {
     //create particles cannon's mouth with angle restrictions and hue manipulation OFF
     float originX = random (width/2 - canWidth/3, width/2 + canWidth/3);
     //assign random white location from hunterImg
     destination = assignDestination();
     grandFinale.addParticle(new Particle(11*PI/8,13*PI/8, originX, height - canHeight, white, false, destination));
  }
  allParticleSystems.add(grandFinale);
}

 // randomly chooses a white pixel from hunterImg and makes it the final destination for this particle
PVector assignDestination() {
  int randomImgPixel = int(random(0.0, values.size()));
  return (PVector) values.get(randomImgPixel);
}

void fistShootsOff () {
  for (int i = 0; i < 3; i++) {
    image(fistImg, width/2 - fistWidth/2, 2+height - (canHeight+fistHeight + fistImgCounter), fistWidth, fistHeight);
    fistImgCounter+=10; //this controls the location when the fist shoots off
  }  
}  
 
void loadImages() {
  cannonImg = loadImage("gonzoCannonSolo.jpg");
  fistImg = loadImage("GonzoFist.jpg");
  hunterImg = loadImage("HunterFiltered.jpg");
}

void collectImageData(PImage img) {
  colorMode(HSB);
  color pixel;
  for (int y = 0; y < huntHeight; y++) {
    for (int x = 0; x < huntWidth; x++) {
      pixel = img.get(x,y);
      //set value for coordinates that are white or close to white
      if (brightness(pixel) > 200) values.add(new PVector(x,y));      
    }
  }
}

void displayTransparentImages() {  
  //display hunter but completely transparent
  colorMode(RGB);
  tint(255,255);
  image(hunterImg, 0, 0, huntWidth, huntHeight); //size is exactly the width of the window.
}

void displayImages() {  
  colorMode(HSB);
  //display cannon at bottom of screen
  image(cannonImg, width/2 - canWidth/2, height - canHeight, canWidth, canHeight);
  //display fist on top of cannon until the ending where it shoots off into the sky
  if(!cannonWasShot)
    image(fistImg, width/2 - fistWidth/2, 2+height - (canHeight+fistHeight), fistWidth, fistHeight);  

}
  

