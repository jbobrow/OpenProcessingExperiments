
Humanatee code, genericHu;
PImage huImage;

ArrayList humans = new ArrayList();

void setup(){
  size(1000,800);
  code = new Humanatee();
  genericHu = new Humanatee();
  //code.humanatee(.75, 10000, color(100,40,200), true, 94.33, "Codey");
  
  huImage = loadImage("manatee-clipart-3.gif");
}

void draw(){
  background(20,20,255);
  for (int i = 0; i < humans.size(); i++){
     Humanatee h = (Humanatee) humans.get(i);
     //h.humanateeHeightMult = random(0.1, 0.9);
     
    h.display(); 
  }
}

void mouseClicked(){
 Humanatee myHumans = new Humanatee();
 myHumans.humanateeHeightMult = random(0.1, 0.9);
  humans.add(myHumans);
 println(humans.size());

}

void keyPressed(){
  code.explode(); 
  code.display();
  genericHu.explode();
  genericHu.swim();
  genericHu.display();
}

class Humanatee { 
  //declare the types of variables that 
  //apply to humanatees
  float humanateeHeightMult;
  int humanateeWeight;
  color humanateeColor;
  boolean isLiving;
  float bankAccountBalance;
  String name;
  
  int xPos, yPos;
 
  Humanatee(){
    humanateeHeightMult = 0.5; //default height is 108 units 
    humanateeWeight = 1200;
    humanateeColor = color( 15, 60, 47);
    isLiving = true;
    bankAccountBalance = -8.08;
    name = "Shawaya";
    
    xPos = int(random(width));
    yPos = int(random(height));
  }
  void humanatee( float iHumanateeHeightMult, int iHumanateeWeight, color iHumanateeColor, boolean iIsLiving,
        float iBankAccountBalance, String iName, int iXPos, int iYPos){
      humanateeHeightMult = iHumanateeHeightMult;
      humanateeWeight = iHumanateeWeight;
      humanateeColor = iHumanateeColor;
      isLiving = iIsLiving;
      bankAccountBalance = iBankAccountBalance;
      name = iName;      
      xPos = iXPos;
      yPos = iYPos;
   }
  
  void swim(){
   //do swim stuff happen
    println("a humanatee named " + name + "is swimmin'"); 
  }
  void explode(){
    println(name + "'s bank account balance of " +
             bankAccountBalance + " caused them to explode");
  }
   void display(){
      //display humanatee image 
      image(huImage, xPos, yPos, humanateeHeightMult * huImage.width, humanateeHeightMult * huImage.height);
   }
 
 
 
  }
 
 
   



