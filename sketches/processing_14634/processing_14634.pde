
/*
* Created by Ben Brumbaugh
* Jellies desperately skim the seas for plankton but 
* this time around it's the plankton that are immortal...
*/

ArrayList<Jelly> jellies = new ArrayList<Jelly>();
ArrayList<Plank> plankton = new ArrayList<Plank>();

void setup() {
   size(960, 480);
   smooth();
}

class Plank {
    
  private int x;
  private int y;
  private int direction;
  
  public Plank(int x, int y, int direction) {
    
     this.x = x;
     this.y = y;
     this.direction = direction;
  }
  
  public int getx() {
    return this.x;
  }
  
  public void setx(int x) {
       this.x = x % 960;
  }
  
  
  public int gety() {
    return this.y;
  }
  
  public void sety(int y) {
       this.y = y % 480;
  }
  
  public int getDirection() {
    return this.direction; 
  }
  
}

class Jelly {
  
  private int x;
  private int y;
  
  public Jelly(int x, int y) {
    
     this.x = x;
     this.y = y;
  }
  
  public int getx() {
    return this.x;
  }
  
  public int gety() {
    return this.y;
  }
  
  public void setx(int x) {
     this.x = x % 960;
  }
  
   public void sety(int y) {
       this.y = y % 480;
  }
}

void draw() {
  background(0x2E42A2); //Blue
  
  stroke(0, 0, 0); //Black
  fill(0xD80B0B); //Red
  ellipse(50, 50, 100, 100);
  
  
  fill(0x2E42A2); //Blue
  stroke(255, 255, 255); //White
  
  // Draw jellies
  for (int i = 0; i < jellies.size(); i++) {
    
    ellipse(jellies.get(i).getx(), jellies.get(i).gety(), 55, 25); 
    jellies.get(i).setx(jellies.get(i).getx() + int(random(6)) - 3);
    jellies.get(i).sety(jellies.get(i).gety() + int(random(6)) - 3);
  }
  
  stroke(0, 0, 0); //Black
  fill(0xD80B0B); //Red
  
  // Draw plankton
  for (int i = 0; i < plankton.size(); i++) {
    
    ellipse(plankton.get(i).getx(), plankton.get(i).gety(), 25, 25); 
    plankton.get(i).sety(plankton.get(i).getDirection() + plankton.get(i).gety());
  }
  
  for (int i = 0; i < jellies.size(); i++) {
     for (int j = 0; j < plankton.size(); j++) {
        
         if (isBetween(plankton.get(j).getx(), jellies.get(i).getx(), 25) 
         && isBetween(plankton.get(j).gety(), jellies.get(i).gety(), 10)) {
               
            plankton.get(j).setx(int(random(960)));
            plankton.get(j).sety(int(random(480))); 
         }
       
       
     }
  }
  
  delay(50);
}
// Returns true if x and y are less than or equal to amount apart
boolean isBetween(int x, int y, int amount) {
  if (Math.abs(x - y) <= amount) {
     return true; 
  }
  return false;
}

void mouseClicked() {
  
    if (mouseX < 100 && mouseY < 100) {
       //spawn Plank
       plankton.add(new Plank(int(random(960)), int(random(480)), int(random(24)) - 12));
    }
    else {
      //Create Jelly
      jellies.add(new Jelly(mouseX, mouseY));
    }
}


