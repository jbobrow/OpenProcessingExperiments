
//Evolution2

//Make Movement Vector Creatures
//Food as a resouce that Creatures eat. Food doesn't move or age

//Creatures have age, reproduction age, life expectancy, health,
//movement speed, distance, change 
//reproduction reduces health and life expectancy
//each movement without "food" reduces health

Food field;
CreatureGroup creatures;
color greenGrass = color(0,128,64);
color white = color(255,255,255);
int maxCreatures = 2000;


void setup(){
  size(600,400);
  colorMode(HSB, 100,100,100); //color = health, mutation rate * 100, agility/3);
  smooth();
  field = new Food();
  creatures = new CreatureGroup(40);
}

void draw(){
  field.grow();  
  field.display(); //show the field
  creatures.run(); //run the creatures
  field.run(); //update the field(food)
  creatures.display();
}


//--------------------------------------------FOOD--------------------------------------------
class Food{
  PGraphics thisFood; //image of the food
  int age;
  int growAge; //how often (in frames) the food will grow
  color foodColor;
  int growRate = 5;

  Food(){
    thisFood = createGraphics(width, height, JAVA2D);
    plantSeeds();
  }

  void run(){ //run this every frame
    thisFood.beginDraw();
    thisFood.background(get(0,0,width,height)); 
    if(mousePressed){
      float r =  random(2,30);
      thisFood.ellipse(mouseX, mouseY, r, r);
    }  
    thisFood.endDraw(); 
  }

  void grow(){ //make food grow
    int growX, growY;
    thisFood.beginDraw();
    thisFood.fill(greenGrass);
    thisFood.noStroke();
    for(int i =0; i < growRate; i++){
      growX = floor(random(0,width)); 
      growY = floor(random(0,height));
      if(get(growX, growY)!=white){
        thisFood.ellipse(growX, growY, 3,3);
      }
    }
    thisFood.endDraw();
  }

  void display(){
    image(thisFood,0,0);
  }

  void plantSeeds(){ //adds new food to the screen
    thisFood.beginDraw();
    thisFood.background(255);
    thisFood.smooth();
    thisFood.noStroke();
    thisFood.fill(greenGrass);
    for(int i = 0; i < 900; i++){
      float r =  random(2,30);
      thisFood.ellipse(random(width), random(height), r, r);
    }
    thisFood.endDraw();
  }

  boolean noMoreFood(){ //checks if the food is gone
    boolean answer = false;

    return answer;
  }


}


//--------------------------------------------CREATURE GROUP--------------------------------------------
class CreatureGroup{
  ArrayList creatureList;

  CreatureGroup(int newCreatureCount){
    creatureList = new ArrayList();
    Creature newCreature;
    for(int i=0; i<newCreatureCount; i++){
      newCreature = new Creature();
      creatureList.add(newCreature); 
    }
  }

  void run(){
    move();
    kill();
    duplicate(); 
  }

  void move(){ //update movement
    for(int i=0; i<creatureList.size(); i++){
      Creature thisCreature = (Creature) creatureList.get(i);
      thisCreature.move();
      thisCreature.eat();
    }
  }

  void kill(){ //remove dead creatures
    for(int i=creatureList.size()-1; i>=0; i--){
      Creature thisCreature = (Creature) creatureList.get(i);
      if(thisCreature.isDead()){
        creatureList.remove(i); 
      }
    }
  }

  void duplicate(){ //replicate growing creatures
    for(int i=creatureList.size()-1; i>=0; i--){
      Creature thisCreature = (Creature) creatureList.get(i);
      if(thisCreature.age%ceil(thisCreature.growAge*thisCreature.deathAge)==0){
        //println("duplicate");
        Creature newCreature = new Creature(thisCreature.growAge, thisCreature.deathAge, thisCreature.x, thisCreature.y, thisCreature.maxV, thisCreature.agility, 
        thisCreature.mutationRate, thisCreature.creatureColor);
        creatureList.add(newCreature);
      }
    }
  }

  void display(){
    if(creatureList.size()==0){
      for(int i = 0; i < 20; i++){ //if everyone dies create some new ones
        Creature newCreature = new Creature();
        creatureList.add(newCreature); 
      }
    }
    if(creatureList.size()>maxCreatures){
      for(int i=creatureList.size()-1; i>=round(maxCreatures/8); i--){
        creatureList.remove(floor(random(creatureList.size())));
      }
    }
    for(int i=0; i<creatureList.size(); i++){
      Creature thisCreature = (Creature) creatureList.get(i);
      thisCreature.display();
    }

  }
}

//--------------------------------------------CREATURE--------------------------------------------

class Creature{
  int age; //age (in frames) of creature
  float growAge; //reproduces when this age is reached
  int deathAge; //if age reaches this it dies
  float health; //if it goes to 0 it dies
  float x, y, vx, vy, t, v; //xy location, xy speed, theta, and velocity
  float maxV; //maximum velocity
  int agility; //how often it changes direction
  float mutationRate; //how likely a mutation is between 0 and 1
  color creatureColor;

  Creature(){
    age = floor(random(0,800)); //start at random ages
    growAge = random(.20,1); //at what point in life they start to reproduce
    deathAge = floor(random(1000,5000)); //set life expectancy age
    health = random(80,100); //start at random health
    x = random(width);
    y = random(height);
    maxV = random(0,1);
    changeDirection(); //sets the direction and speeds
    agility = ceil(random(1,300));//change direction every 0 to 300 seconds
    mutationRate = growAge;
    setColor();
  }

  Creature(float newGrowAge, int newDeathAge, float newX, float newY, float newMaxV, int newAgility, float newMutationRate, color newColor){
    age = 0;
    growAge = newGrowAge;
    deathAge = newDeathAge;
    health = 100; //baby's are healthy
    x = newX;
    y = newY;
    maxV = newMaxV;
    changeDirection(); //sets the direction and speeds
    agility = newAgility;//change direction every 1 to 300 seconds
    mutationRate = newMutationRate;
    mutate(); //change new babies just a little
    setColor();
  }

  void changeDirection(){
    t = random(0,TWO_PI);
    v = random(0,maxV);
    vx = v*cos(t);
    vy = v*sin(t);
  }

  void move(){
    if(frameCount%agility==0){
      changeDirection(); 
    }
    if(x+vx>width||x+vx<0){
      vx*=-1; 
    }
    if(y+vy>height||y+vy<0){
      vy*=-1; 
    }
    x+=vx;
    y+=vy;
    age++;
    health-=v;
    setColor();
  }



  void eat(){ //adds to health 

    if( get(round(x),round(y)) ==color(greenGrass)){
      if(health<100){
        health+=4;
        set(round(x),round(y),white);
        //println("yum");
      }
    } else {
      health-=.1;
    }
  }

  void mutate(){ //makes slight changes to the creature at reproduction
    if(random(1)<mutationRate){
      growAge += random(-.1,.1);  
    }
    if(random(1)<mutationRate){
      deathAge += random(-100,100);  
    }
    if(random(1)<mutationRate){
      maxV += random(-.01,.01);  
    }
    if(random(1)<mutationRate){
      agility += random(-1,1);  
    }
    if(random(1)<mutationRate){
      mutationRate += random(-.1,.1);  
    }
    validate();
  }

  boolean isDead(){ //if health is bad or they've died of old age 
    if(age>deathAge||health<0){
      return true;
    } 
    else {
      return false;
    }
  }

  void display(){
    float r;
    r = map(deathAge, 1000,5000,5,30);
    fill(creatureColor);
    stroke(map(age,0,deathAge,0,100));
    ellipse(x,y,r,r);
    if(round(x)==mouseX&&round(y)==mouseY){
      println("mutationRate: " + mutationRate + " growAge: " + growAge + " deathAge: " + deathAge + " Speed: " + v); 
    }
  }
  
  void validate(){
    if(agility<=0){
      agility = 1;
    } 
    if(growAge<=.25){
      age = deathAge;
    }
    if(deathAge<=1000){
      deathAge=1000;
    }
    if(v<.02){
      v=.02; 
    }
    if(mutationRate>1){
      mutationRate=.99; 
    }
    if(mutationRate<.01){
      mutationRate=.01; 
    }
    if(maxV<0.05){
      maxV=0.06; 
    }


  }

  void setColor(){
    creatureColor = color(mutationRate*100, map(maxV, 0,1,50,100), health); 
  }

}





                
