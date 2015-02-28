
ArrayList<Entity> entities = new ArrayList<Entity>();
ArrayList<Food> foods = new ArrayList<Food>();

color RED = color(255,0,0);
color GREEN = color(0,255,0);
color BLUE = color(0,0,255);
int count;
int timer = 0;
final int ROT_TIME = 10;

void setup(){
  
   size(400,400);
   background(255);  
   count=0;
   
}

    
void mousePressed(){
  
   if(mouseButton == LEFT)
  {
    entities.add(new Entity());

    System.out.println(entities.size() + "entities!");
    
  }
  else if(mouseButton == RIGHT)
  {
  
   switch(count%3) {
      
    case 0: foods.add(new Food(color(255,0,0)));
            break;
    case 1: foods.add(new Food(color(0,255,0)));
            break;
    case 2: foods.add(new Food(color(0,0,255)));
            break;
   } 
  

  
  System.out.println(foods.size() + "foods!");
  
//  count++;
  }
  
 
}

void draw() {
  
  
  if(mousePressed==true){
       if(mouseButton == RIGHT){
           count++;
       }
  
  }
  
  if(timer%ROT_TIME==0){
  
    for(int i=0;i<entities.size();i++){
    
      
      entities.get(i).rot("red");
      entities.get(i).rot("green");
      entities.get(i).rot("blue");
    
    
    }
  
  }
  
  background(255);
  for(int i=0;i<entities.size();i++){
    
    if(entities.get(i).red == 0 || entities.get(i).green == 0 || entities.get(i).blue == 0) entities.remove(i);
    else {
      entities.get(i).decide();
      entities.get(i).checkCollision();
      entities.get(i).render();
    }
  }
  for(int j=0;j<foods.size();j++){
    
    
   
    foods.get(j).render();
    
    if(foods.get(j).radius == 0) foods.remove(j);
    
    }

  timer++;


  
}



class Entity
{
  public int red = 255;
  public int green = 255;
  public int blue =255;
  int maxindex1=0;
  int maxindex2=0;
  int radius = 10;
  public int MORALITY = 0;
  int VEL = 1;
  float x = 0;
  public PVector position;
  boolean hostility = false;
  Entity entityT;
  Food foodT;
  float angle;
  
  public Entity(){
    position = new PVector(mouseX,mouseY);
    
  
  }
  
  void render(){
    ellipse(position.x, position.y, 10, 10);
    stroke(0);
    fill(red,green,blue);
  }
  
  void rot(String col) {
    
    if (col=="red" && this.red>=5) this.red -= 5;
    else if (col=="green" && this.green>=5) this.green -= 5;
    else if (col=="blue" && this.blue >=5) this.blue -= 5;
  
  }
  
 
  void decide() {

   if(foods.size() > 0 && entities.size() > 0) {
      double[] eatPrior = new double[foods.size()];
      double[] killPrior = new double[entities.size()];
        double max = 0;
       maxindex1 = 0;
       maxindex2 = 0;
      int redPrior = (255-this.red)*2;
      int greenPrior = (255-this.green)*2;
      int bluePrior = (255-this.blue)*2;
    
      for(int i=0;i<foods.size();i++){
      
        if(foods.get(i).foodColor == color(255,0,0)) eatPrior[i] = redPrior - getDistance(foods.get(i).position)/VEL*5/ROT_TIME;
        else if (foods.get(i).foodColor == color(0,255,0)) eatPrior[i] = greenPrior - getDistance(foods.get(i).position)/VEL*5/ROT_TIME;
        else if (foods.get(i).foodColor == color(0,0,255)) eatPrior[i] = bluePrior - getDistance(foods.get(i).position)/VEL*5/ROT_TIME;
      
        if(max < eatPrior[i]){
          max = eatPrior[i];
          maxindex1 = i;
        }
      }
      max = 0;
      for(int j=0;j<entities.size();j++){
    
        killPrior[j]=0 - MORALITY;
        maxindex2 = j;
    
      }
    
     if(eatPrior[maxindex1] >= killPrior[maxindex2]){
        foodT = foods.get(maxindex1);
        entityT = null;
        goEat(foodT);
      }
      else { 
        entityT = entities.get(maxindex2);
        foodT = null;
        goKill(entityT);
      }
      
      
      
    
    }
 
  }
  float getDistance(PVector target){
    return sqrt(pow((target.x - this.position.x),2) + pow(target.y-this.position.y,2));
  }
 
  void goEat(Food food) {
   
    //PVector foodV = food.position;
    
 //   angle = PVector.angleBetween(this.position, food.position);
   
//    this.position.x += VEL*cos(angle);
//    this.position.y += VEL*sin(angle);
    
   if(food.position.x > this.position.x) this.position.x += VEL;
   else if (food.position.x< this.position.x) this.position.x -= VEL;
   if(food.position.y > this.position.y) this.position.y += VEL;
   else if (food.position.y< this.position.y) this.position.y -= VEL;
   
   
  }
  
  void goKill(Entity prey) {
    if(prey == this) return;
    this.hostility = true;
    if(prey.position.x > this.position.x) this.position.x += VEL;
    else if (prey.position.x< this.position.x) this.position.x -= VEL;
    if(prey.position.y > this.position.y) this.position.y += VEL;
    else if (prey.position.y< this.position.y) this.position.y -= VEL;
  }
  
  void checkCollision() {
  
    
    if(entityT == null && foodT == null) this.decide();
    float xDist;
    float yDist;
    float distance;
    
   if(entities.size() < 1 || foods.size() < 1) return;
   
   if(foodT != null){
    xDist = this.position.x-foodT.position.x;                                   // distance horiz
    yDist = this.position.y-foodT.position.y;                                   // distance vert
    distance = sqrt((xDist*xDist) + (yDist*yDist));  // diagonal distance

    // test for collision
    if (this.radius/2 + foodT.radius/2 > distance) {
      foodT.eaten(); 
      
      if(foodT.foodColor==color(255,0,0)) this.red+=100;
      else if(foodT.foodColor == color(0,255,0)) this.green+=100;
      else if(foodT.foodColor == color(0,0,255)) this.blue += 100;
      
    }
    if(entityT!=null){
      xDist = this.position.x-entityT.position.x;                                   // distance horiz
      yDist = this.position.y-entityT.position.y;                                   // distance vert
      distance = sqrt((xDist*xDist) + (yDist*yDist));  // diagonal distance

    // test for collision
      if (this.radius/2 + entityT.radius/2 > distance) 
      {
        if(entityT.hostility)
        {
          this.red /= 2;
          this.green /= 2;
          this.blue /= 2;  
        }
        else
        {
          this.red += entityT.red;
          this.green += entityT.green;
          this.blue += entityT.blue;
          entities.remove(maxindex2);
        }
      }
    
   }
   
 }
 
 
  }
}



public class Food
{
   public PVector position;
   public color foodColor;
  public int radius = 40;
  
  public Food(color C)
  {
    position = new PVector(mouseX, mouseY);   
    this.foodColor = C;
  }
  
  
  public void render()
  {
    ellipse(position.x, position.y, radius, radius);
    noStroke();
    fill(foodColor);
  }

  public void eaten()
  {
    this.radius -= 5;
  }
 
}
