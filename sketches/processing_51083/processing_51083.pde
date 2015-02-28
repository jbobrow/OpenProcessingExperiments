

//Prototype Space Shoot-Em-Up
  
float foeX;
float foeY;
float foeSize;
float foeSizeSmaller;
float shipX;
float laserX;
float foe_laserX;
int foe_dirY;
int foe_dirX;
int laser_shoot;
int foe_laser_shoot;


void setup(){
  size(900,500);
  foeX = 700;
  foeY = random(500);
  foeSize = 150;
  foe_dirY = 4;
  foe_dirX = -1;
  foe_laserX = 
  shipX = 100;
  laserX = 100;
  laser_shoot = 0;
  foe_laser_shoot = 0;
  
}

void draw(){
  background(255);
  
  ship(shipX,mouseY);
  
  laser(laserX,mouseY);   
  laserX += laser_shoot;
  
  if(mousePressed){          /// Fire Laser!!!
    laser_shoot = 26; 
   
  }
  
 // if(laser_shoot == 20){
 //   
 //   
 // }
  
  if(laserX>900){        /// Reset laser
    laserX = shipX;
    laser_shoot = 0;
    
    //redraw();
  }
    
   foe(foeX, foeY);     ///  Enemy's pattern     
  foeY += foe_dirY;
  foeX += foe_dirX;
  if(foeY > 500){
    foe_dirY = -4;
  }
  if(foeY < 0){
   foe_dirY = 4;
  }
  
  if(((foeX - 20) < laserX && laserX < (foeX + 20)) && ((foeY - 50) < mouseY && mouseY < (foeY + 50))){    /// Hit
    foeSize -= 10;
    foeX += 40;
    laserX = shipX;
    laser_shoot = 0;
   
  }
  
  if(foeX >= 899){
    foeX = 650;
  }
    
 }
    
  ///////////Objects///////////

void ship(float shipX, float mouseY){
  ellipse(shipX, mouseY, 75, 40);
  fill(0);
}

void laser(float shipX, float mouseY){
  ellipse(shipX, mouseY, 40, 7);
  fill(0);
}

//void foe_laser(float foeX, float foeY){
//  ellipse(foe_laserX, foeY, 

void foe(float foeX, float foeY){
  ellipse(foeX, foeY, foeSize, foeSize);
}

void foe2(float foe2X, float foe2Y){
  ellipse(foe2X, foe2Y, 50, 50);
  fill(0);
}



