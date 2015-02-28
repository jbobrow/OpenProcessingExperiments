
public class Ally extends Soldier {
  int lifePoints = 100; 
  int weapon = 1;
  
  boolean hasShotgun = true;
  boolean hasRifle = true;
  boolean hasPistol = true;
  boolean recharged = true;
  
  PImage shotgunL;
  PImage rifleL;
  PImage pistolL;
  PImage shotgunR;
  PImage rifleR;
  PImage pistolR;
  
  public Ally(float x, float y) {
    life = lifePoints;
    
    spawnX = x;
    spawnY = y;
    faceLeft = false;
    
    idleL = loadImage("PlayerCubeL.png");
    idleR = loadImage("PlayerCubeR.png");
    crouchedL = loadImage("PlayerCubeCrouchL.png");
    crouchedR = loadImage("PlayerCubeCrouchR.png");
    dead = loadImage("PlayerCubeDead.png");
    
    //Weapons
    shotgunL = loadImage("ShotgunL.png");
    shotgunR = loadImage("ShotgunR.png");
    rifleL = loadImage("RifleL.png");
    rifleR = loadImage("RifleR.png");
    pistolL = loadImage("PistolL.png");
    pistolR = loadImage("PistolR.png");
    
    weaponL = pistolL;
    weaponR = pistolR;
  }
  
  void switchWeapons(int weaponType) {
    if (weaponType == 1) {
      weapon = weaponType;
      weaponL = pistolL;
      weaponR = pistolR;
    } else if ((weaponType == 2) && (hasShotgun)) {
      weapon = weaponType;
      weaponL = shotgunL;
      weaponR = shotgunR;
    } else if ((weaponType == 3) && (hasRifle)) {
      weapon = weaponType;
      weaponL = rifleL;
      weaponR = rifleR;
    }
  }
  /*
  void shoot(ArrayList bullets, float currentXPos, float currentYPos) {
    if (alive) {
      if (!crouched) {
        if (faceLeft) {
          Bullet shot = new Bullet(currentXPos + 180, currentYPos + 155, faceLeft, weapon);
          bullets.add(shot);
        } else if (!faceLeft) {
          Bullet shot = new Bullet(currentXPos + 180, currentYPos + 155, faceLeft, weapon);
          bullets.add(shot);
        }
      } else if (crouched) {
        if (faceLeft) {
          Bullet shot = new Bullet(currentXPos + 250, currentYPos + 155 + 70, faceLeft, weapon);
          bullets.add(shot);
        } else if (!faceLeft) {
          Bullet shot = new Bullet(currentXPos + 250, currentYPos + 155 + 70, faceLeft, weapon);
          bullets.add(shot);
        }
      }
    }
  }
  */  
}
  

