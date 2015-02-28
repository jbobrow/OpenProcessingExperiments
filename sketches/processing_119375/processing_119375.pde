
PImage weapon;
PFont impact;
int weaponX;
float background1 = 255;
float background2 = 255;
float background3 = 255;

void setup()
{
  size(800, 400);
  impact = createFont("Impact", 15);
  weapon = requestImage ("Weapon.jpg");
  weaponX = width/2;

}

void draw()
{
  background(255);
  fill(background1, 50, 50);
  imageMode(CENTER);
  image(weapon, weaponX, height/2, weapon.width * .2, weapon.height * .3);
  textSize(5);
  textFont(impact);
  
  text("PRESS SPACEBAR TO HAVE SOME FUN!", 400,50);

  pushMatrix();
  scale(1.5);
  text("Computers", 25, 80);
  text("Computers", 25, 90);
  text("Computers", 25, 100);
  text("Computers", 25, 110);
  text("Computers", 25, 120);
  text("Computers", 25, 130);
  text("Computers", 25, 140);
  text("Comp", 25, 150);
  text("Com", 25, 160);
  text("Co", 25, 170);
  popMatrix();

  fill(0, background2, 0);
  pushMatrix();
  scale(1.5);
  text("Programming", 95, 80);
  text("Programming", 95, 90);
  text("Programming", 95, 100);
  text("Progra     ming", 95, 110);
  text("Progra     ming", 95, 120);
  text("Progr              ng", 95, 130);
  popMatrix();

  fill(0);

  text("Unreal", 210, 310);
  text("Unreal", 217, 295);   
  text("Unreal", 223, 280);
  text("Unreal", 230, 265);
  text("Unreal", 237, 250);
  text("Unreal", 245, 235);   
  text("Unreal", 251, 220); 

  fill(0, 0,background3);
  textSize(25);
  text("Maya", 350, 250);
  text("Maya", 350, 275);  
  text("Maya", 355, 300);
  text("Maya", 360, 325);
  text("Maya", 365, 350);
  text("Maya", 370, 375);
  
  fill(background1, background2,0);
  text("Game     Maker", 275, 110); 
  text("Game     Maker", 275, 130); 
  text("Game     Maker", 275, 150); 
  text("Game     Maker", 275, 170); 
  text("Game     Make", 275, 190); 
  text("G                 Make", 275, 210);
  
  fill(0,background2, background3);
  text("Flash Gaming", 450,110);
  text("Flash Gaming", 450,130);
  text("Flash Gaming", 450,150);
  
  fill(150,background2,150);
  text("Blizzard Job", 650,150);
  
      if (keyPressed == true)
    {
      if (key == ' ')
      {
        weaponX = width/2 + (int)random(10);
        background1 = random(255);
        background2 = random(255);
        background3 = random(255);
      }
      else
      {
         background1 = 255;
         background2 = 255;
         background3 = 255;
      }
      
    }
  
  
  
  
}



