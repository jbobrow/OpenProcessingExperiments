

Player[] snake;
Food food;
int puntuacion;
int maxFood;
long lastTime;
int numCells;

void setup(){
  size(240,240);
  snake = new Player[100];
  food = new Food();
  reboot();  
}

void draw(){
  background(0,122,143);
  noStroke();

  for(int i=0; i<=numCells; i++)
    snake[i].display();
    snake[0].move();
    if(maxFood < food.getFoodEaten()){
      maxFood = food.getFoodEaten();
      numCells++;
      snake[numCells] = new Player(0,0,new PVector(0,0));
      snake[numCells].pos.x = snake[numCells-1].getPos().x;
      snake[numCells].pos.y = snake[numCells-1].getPos().y;  
    }
    
    //update restriction
    if ( millis() - lastTime > 100 ) {
          
      for(int i=numCells;i>0;i--){   
        snake[i].pos.x = snake[i-1].getPos().x;
        snake[i].pos.y = snake[i-1].getPos().y;
      }              
      lastTime = millis();
      snake[0].update();
    }

    food.display();
    food.update();
    if(snake[0].Colisiona(snake,numCells))
      reboot();
}

public void reboot(){
  //Global reset
  food.Clear(); 
  lastTime = millis();
  for(int i=0; i<=3; i++)
    snake[i] = new Player(3,i,new PVector(8,0));
  
  food = new Food(snake[0]);
  maxFood = food.getFoodEaten();
  numCells = maxFood+3;
}

class Food{
 PVector pos;
 Player snake;
 int nFood;
 
 public Food(){
   //Generic constructor for Food
   pos = new PVector(0,0);
 }
 
 public Food(Player snake){
   pos=new PVector(0,0);
   restore(); 
   this.snake = snake;
 }
 
 void display(){
   fill(150);
   rect(pos.x,pos.y,8,8); 
 }
 
 void update(){
   //Replace snake collide
   if((snake.getPos().x == pos.x) && (snake.getPos().y == pos.y)){
     restore();
     nFood++;
   }
 }
 
 private void restore(){
   pos.x = 8*int(random(0,width/8));
   pos.y = 8*int(random(0,height/8)); 
 }
 
 public int getFoodEaten(){
   return nFood;
 }
 
 public void Clear(){
   restore();
   nFood = 0;
 }
}

class Player{
 PVector pos;
 PVector vel;
 boolean r,l,u,d;
 
 public Player(float x, float y, PVector vel){
   pos = new PVector(8*x, 8*y);
   this.vel = vel;
 }
 
 void display(){
   fill(111,222,333);
   rect(pos.x,pos.y,8,8); 
 }
 
 void update(){   
   pos.add(vel);
 }
 
 void move(){
   if(keyPressed){
      if (keyCode == UP && !getDir().equals("d")) 
        vel.set(0,-8);
      if (keyCode == DOWN && !getDir().equals("u")) 
        vel.set(0,8);    
      if (keyCode == LEFT && !getDir().equals("r")) 
        vel.set(-8,0);
      if (keyCode == RIGHT && !getDir().equals("l")) 
        vel.set(8,0);
    }
 }
 
 public boolean Colisiona(Player[] p,int numCells){
   //screen limits
   if(pos.x<0 || pos.x>(width-8))
     return true;
   if(pos.y<0 || pos.y>(height-8))
     return true;
   //tail collision
   for(int i=1; i<numCells; i++)
     if((p[i].getPos().x == pos.x) && (p[i].getPos().y == pos.y))
       return true;
   return false;
 }
 
 public PVector getPos(){
   return pos;
 }
 
 public String getDir(){
   String dir="";
   if(vel.x == -8) dir="l";
   if(vel.x == 8) dir="r";
   if(vel.y == -8) dir="u";
   if(vel.y == 8) dir="d";
   return dir;
 }
}


