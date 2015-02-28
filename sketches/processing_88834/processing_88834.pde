
boolean shoot = false;
int [] int1 = {20,30,40,50};
float shipx = 250;
float shipy = 450;
float laserx = 250;
float lasery = 450;
float shipH = 50;
float shipW = 20;
float moveL = 10;
float moveR = -10;
float shot = 10;
float counter = 0;
PImage ship;
PImage laser;

//Well, its a start XD I just added the image of the spaceship... Also, I wanna get rid of the stupid after effect of the movement... ALSO we need to make it so the ship stops at BOTH edges... -Doom

void setup() {
  size(500, 500);
  fill(255, 255, 255, 50);
  stroke(0);
  ship = loadImage ("j4bc.gif");
  laser = loadImage ("64px-SpaceInvadersLaserDepiction.png");
}

void draw() {
  
  background(255);
  
  image(laser, laserx, lasery, 32, 32);
  image(ship, shipx, shipy);
  if(keyPressed == true){
    if(key == CODED){
      if(key == 's' || key == 'S'){
        shoot = true;
      }
    }
  }
  if(shoot=true) {
    counter++;
    lasery--;
  }
  else {
    laserx = shipx;
    lasery = shipy;
  }
  if(counter>450 || lasery<0) {
    counter = 0;
    shoot = false;
  }
  if (keyPressed == true) {
    if (key == CODED) {
      if (keyCode == LEFT) {
        if (shipx >= 0) {
          shipx = shipx - moveL*0.2;
        }
      }
    }
  }

  if (keyPressed == true) {
    if (key == CODED) {
      if (keyCode == RIGHT) {
        if (shipy >= 0) {
          //Right made it go down, changed it. -The Black Sheep
          //Yeah... I know... I wanted to know HOW to change it XD - Doom
          //Also, I want to make it so there is no trail behind the ellipse - Doom
          shipx = shipx - moveR*0.2;
        }
      }
    }
  }

  if (shipx>=470) {
    shipx=470;
  }
  shoot = false;
  
  //I made it so you couldnt make the ship go past the wall on the right side - Doom
}
//Hello Noah Thomas, this is Techno sending a test
//HEALKAwejFp9aueg :AORUGISERUYGNS:ODFUBIL ADFJHGILARYGBPSIDUFGIL:ASDRHPA*RSG)
//The all mighty iBen Has officially joined project Ben+Noah+Ben TzudistrauT



