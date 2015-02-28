
/*

 
 */

//Variables for ammunition.
int Ammo = 12; // Supply. 
int CrossHair_AmmoCAP = 6;  // Number of times player can shoot.
int CrossHair_AmmoBASE = 6; // Ammunition count.
int score = 0;
// Text display.
PFont HUD;
// Sound effects.
import ddf.minim.*; 
Minim minim;
AudioPlayer Shoot, ReloadAmmo, EmptyAmmo, ReplenishAmmo;

//
int timer = 11; //this is the countdown time.
int timeLast = 0;

void setup() 
{ 
  //
  timeLast = second(); 
  
  // Screen.
  size(640, 240);

  // Sound.
  minim = new Minim(this);

  // Display.
  HUD = loadFont("Verdana-12.vlw");
  textAlign(LEFT); 
  fill(0, 0, 0); 
  text("Score: " + score, 15, 215); 
  textAlign(LEFT); 
  fill(0, 0, 0); 
  text(CrossHair_AmmoBASE + "  /  " + CrossHair_AmmoCAP, 15, 230);
}

void draw() 
{
  background(255);

  // Displays crosshair.
  cursor(CROSS);

  Score();

  // 
  //Objective();
   if (timer > 0)
  { game(); }
  else
  { 
  if (score >= 40)
  {
    textAlign(CENTER);
    text("You've passed the shooting range! Lock-and-load!", width/2, height/2);
  }
  else
  { textAlign(CENTER);
    text("You've failed the shooting range!", width/2, height/2);
  }
}}

void Score()
{ 
  // Code is created twice to create score/display consistency from void setup().
  textAlign(LEFT); 
  fill(10, 255, 10); 
  text("Score: " + score, 15, 215); 
  textAlign(LEFT); 
  fill(0, 0, 0); 
  text("Ammo: " + CrossHair_AmmoBASE + "  /  " + CrossHair_AmmoCAP, 15, 230);
}

void game()
{ 
  if (second()!=timeLast) 
  { timeLast = second(); //if a second has passed then we update the timeLast variable
    timer -= 1; }
}

void mousePressed()
{
  // To shoot.
  if (mouseButton == LEFT)
  { 
    if (CrossHair_AmmoBASE >= 1)
    {
      CrossHair_AmmoBASE -= 1; 
      score += 1;
      stroke(125); 
      fill(255, 0, 0); 
      rectMode(CENTER); 
      rect(mouseX, mouseY, 24, 24);
      // SFX. 
      minim = new Minim(this); 
      Shoot = minim.loadFile("Shot.wav", 256); 
      Shoot.play();
    }
    else
    { 
      // Message warns you to reload your base ammunition.
      fill(0); 
      textAlign(CENTER); 
      text("Reload your ammunition! Press the RMB to reload!", 320, 15);
      // SFX.
      minim = new Minim(this); 
      EmptyAmmo = minim.loadFile("AmmoEmpty.wav", 256); 
      EmptyAmmo.play();
    }
  }

  // To reload.
  if (mouseButton == RIGHT)
  { 
    // Checks if there's remaining ammunition from supply.
    if (Ammo > 0) 
    {
      // Message notifies you that your gun has reloaded.
      fill(0); 
      textAlign(CENTER); 
      text("Gun reloaded.", 340, 45);
      //
      CrossHair_AmmoBASE += CrossHair_AmmoCAP;
      //
      Ammo -= CrossHair_AmmoCAP;

      // SFX.
      minim = new Minim(this); 
      ReloadAmmo = minim.loadFile("Reload.wav", 256); 
      ReloadAmmo.play();
    }
    else
    { 
      // Message warns you to collect ammunition.
      fill(0); 
      textAlign(CENTER); 
      text("You have no more ammunition! Collect more ammo!", 340, 30);
      // SFX.
      minim = new Minim(this); 
      EmptyAmmo = minim.loadFile("AmmoEmpty.wav", 256); 
      EmptyAmmo.play();
    }
  }

  if (mouseButton == CENTER)
  { 
    // Checks if there's remaining ammunition from supply.
    if (Ammo < 1) 
    {
      // Message warns you to reload your base ammunition.
      fill(0); 
      textAlign(CENTER); 
      text("Ammo Replenlished.", 340, 45);

      //
      Ammo += 6;

      // SFX.
      minim = new Minim(this); 
      ReplenishAmmo = minim.loadFile("AmmoReplenish.wav", 256); 
      ReplenishAmmo.play();
    }
  }
}


