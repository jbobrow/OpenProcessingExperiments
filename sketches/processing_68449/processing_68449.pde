
//This Takes the Cake
//Bootcamp final code project


// Cooking Steps
int cookingStep = 0;
// everytime we add an ingredient we then move up a step
int Stepegg, Stepbutter, Stepflour, Steppowder, Stepsugar, Stepsalt, Stepmilk = 1; 

//mouse drop
int dropX; 
int dropY; 

//on-off for ingredients going into bowl
boolean grab = false;

//this is in the bowl //outside owl
boolean isBowl = false;

//ingredient booleans
boolean isEgg = false;
boolean isButter = false;
boolean isFlour = false;
boolean isPowder = false;
boolean isSugar = false;
boolean isSalt = false;
boolean isMilk = false;

boolean isCake = false;

int cakeNum = 20;


//moves the ingredients
float eggX;
float eggY;

float butterX;
float butterY;

float flourX;
float flourY;

float powderX;
float powderY;

float sugarX;
float sugarY;

float saltX;
float saltY;

float milkX;
float milkY;

float bowlX;
float bowlY;

float cakeX;
float cakeY;



// check for min distance to grab ingredient
float minDist = 20;

// Distance to bowl to combine ingredients
float bowlDist = 20;


//grab ingredients and moves it
float eggDist;
float butterDist;
float flourDist;
float powderDist;
float sugarDist;
float saltDist;
float milkDist;



//ingredients
PImage butter; 
PImage egg;
PImage flour;
PImage powder; 
PImage sugar;
PImage salt;
PImage milk;

PImage bowl;
PImage cake;


//background image
PImage stove;

//the setup
void setup() {
  size(700, 700);
  //rectMode(RADIUS);

  //ingrediences load images
  egg = loadImage("egg.png");
  butter = loadImage("butter.png");
  flour = loadImage("flour.png");
  powder = loadImage("powder.png");
  sugar = loadImage("sugar.png");
  salt = loadImage("salt.png");
  milk = loadImage("milk.png");
  
  bowl = loadImage("bowl.png");
  
  cake = loadImage("cake.png");


  //background image
  stove = loadImage("stove.png");

  eggX = 199;
  eggY = 542;

  butterX = 442;
  butterY = 535;

  flourX = 287;
  flourY = 468;

  powderX = 534;
  powderY = 576;

  sugarX = 361;
  sugarY = 497;

  saltX = 450;
  saltY = 456;

  milkX = 590;
  milkY = 395;

  bowlX = 146;
  bowlY = 379;
  
  cakeX = 590;
  cakeY = 395;
}

void draw() {
  
  println(eggX);

  //background image
  PImage myImage = loadImage("stove.png");
  imageMode(CENTER);
  image(stove, width/2, height/2);

    //ingredients
    image(egg, eggX, eggY);
    image(butter, butterX, butterY);
    image(flour, flourX, flourY);
    image(powder, powderX, powderY);
    image(sugar, sugarX, sugarY);
    image(salt, saltX, saltY);
    image(milk, milkX, milkY);
 
   
    image(bowl, bowlX, bowlY);
    
   
    bowlDist = dist(bowlX, bowlY, mouseX, mouseY);

    eggDist = dist(eggX, eggY, mouseX, mouseY);
    
    butterDist = dist(butterX, butterY, mouseX, mouseY);
      
    flourDist = dist(flourX, flourY, mouseX, mouseY);
    
    powderDist = dist(powderX, powderY, mouseX, mouseY);
            
    sugarDist = dist(sugarX, sugarY, mouseX, mouseY);
    
    saltDist = dist(saltX, saltY, mouseX, mouseY);
        
    milkDist = dist(milkX, milkY, mouseX, mouseY);
          
  }


  //clicking and holding the mouse/item
//  void mousePressed() {
//  }

  //dragging the mouse/item to the place I want
  void mouseDragged() {
    if (eggDist < minDist) {
      isEgg = true;
      eggX = mouseX;
      eggY = mouseY;

    }

    if (bowlDist < minDist && isEgg == true) {
      eggX = bowlX;
      eggY = bowlY;
      cookingStep += Stepegg;
    }
    
    if (butterDist < minDist) {
      isButter = true;
      butterX = mouseX;
      butterY = mouseY;

    }

    if (bowlDist < minDist && isButter == true) {
      butterX = bowlX;
      butterY = bowlY;
      cookingStep += Stepbutter;
    }
    
      if (flourDist < minDist) {
      isFlour = true;  
      flourX = mouseX;
      flourY = mouseY;

    }

    if (bowlDist < minDist && isFlour == true) {
      flourX = bowlX;
      flourY = bowlY;
      cookingStep += Stepflour;
    }
    
      if (powderDist < minDist) {
      isPowder = true;   
      powderX = mouseX;
      powderY = mouseY;

    }

    if (bowlDist < minDist && isPowder == true) {
      powderX = bowlX;
      powderY = bowlY;
      cookingStep += Steppowder;
    }
    
      if (sugarDist < minDist) {
      isSugar = true;
      sugarX = mouseX;
      sugarY = mouseY;

    }

    if (bowlDist < minDist && isSugar == true) {
      sugarX = bowlX;
      sugarY = bowlY;
      cookingStep += Stepsugar;
    }
    
     if (saltDist < minDist) {
      isSalt = true;
      saltX = mouseX;
      saltY = mouseY;

    }

    if (bowlDist < minDist && isSalt == true) {
      saltX = bowlX;
      saltY = bowlY;
      cookingStep += Stepsalt;
    }
  }
    
    void mousePressed(){
    if(isCake == true){
      isCake = true;
       } else {
         cakeNum = 0;
       }
    
    
    /*if(
    
  }*/

}


