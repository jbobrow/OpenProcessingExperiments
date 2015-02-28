
class Blaster {
  /*instance variables*/
  Pcharacter shootToKill;
  // are you shoting or not ?
  boolean shooting;
  // what level is the blaster ?
  int blasterLevel; // level = 1 is normal mode, level 2 = increase bullet damage and speed
  //byte blasterLevel; // a more convient was to store number values, this stores between -127 and 128
  
  
  /*constructors*/
  Blaster(Pcharacter tempShootToKill) {
    shootToKill = tempShootToKill; 
    shooting = false; // set shooting to false, (current not shooting)
    blasterLevel = 1; // set blaster level to normal mode
  }
  
  /*methods*/
  // method to start blasting(shooting) objects
  void blastIt () {
    // if player is alive
    if(shootToKill.alive) {
      // if the player is shooting
      if(shooting) {
        // add a new bullet to the bullet array list
        bullets.add(new Bullet(shootToKill));
        // then set shooting back to false
        shooting = false;
      }
    }
  }
  
  // method to update the state of shooting
  void updateShooting () {
    // call the blastIt method to shoot again
    blastIt();
  }
  
}// end blaster class

class BlasterUpgrade extends Blaster{
  /*instance variables*/
  // based on the timer class which includes millsecond, this will allow the ability to increase the rate in which you can shoot a bullet
  Timer blasterFireRate;
  // set the cap on how many shots the blaster can take in this current upgraded mode
  int blasterCap;
  // this is needed to keep track of cap, e.g to see how much of the blastercap the player has used already
  int blasterCurrentCap;
  
  /*constructors*/
  BlasterUpgrade (Pcharacter tempShootToKill) {
    super(tempShootToKill); // call the parameter from the Blaster class
    blasterLevel = 2; // set blaster to level 2(increase shooting rate and damage);
    blasterFireRate = new Timer(120); // this blaster rate will last for 120 milliseconds(0.12 seconds)
    blasterCap = 80; // set blaster cap
    blasterCurrentCap = blasterCap; // current cap = set blaster cap
  }
  /*methods*/
  // method to start blasting(shooting) objects
  void blastIt () {
    // if character is alive
    if(shootToKill.alive) {
      // and if shooting and blaster upgrade timer rate is over and current blaster cap is greater than 0
      if(shooting && blasterFireRate.timerIsFinished() && blasterCurrentCap > 0) {
        // add a new bullet to array list
        bullets.add(new Bullet(shootToKill));
        // decrease by -1 the current blaster cap. e.g each time you are shooting during the upgrade timer event decrease the blasterCap by -1
        blasterCurrentCap--;
      }
    }
  }
  

  
  
}// end BlasterUpgrade class

