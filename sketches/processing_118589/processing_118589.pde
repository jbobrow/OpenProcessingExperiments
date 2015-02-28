
Ship ship1;
Ship ship2;
Ship ship3;
float diff1; 
float diff2; 
float diff3; 

void setup(){
  size(800, 600); // 
  ship1 = new Ship(width/4, height/2);
  ship2 = new Ship(2*(width/4), height/2);
  ship3 = new Ship(3*(width/4), height/2);
  
  frameRate(20);
  /*ship1.diff = 30; 
  ship2.diff = 200;
  ship3.diff = 500; */ 
  ship1.move(); 
  ship2.move(); 
  ship3.move();
}
void draw() {
  background(255);

  diff1 = abs(ship1.r - ship2.r); 
  diff2 = abs(ship2.r- ship3.r); 
  diff3 = abs(ship3.r - ship1.r); 
  
  ship1.display();
  ship2.display();
  ship3.display();
  
  if (diff1 < 5.0 && diff2 < 5.0 || diff2 < 5.0 && diff3 < 5.0 || diff3 < 5.0 && diff1 < 5.0)
  {
    //do nothing
    println("locked");
  }
  else if (diff1 < 5.0)
  {
    ship3.move(); 
    println("ship3"); 
  }
  else if (diff2 < 5.0) 
  {
    ship1.move(); 
    println("ship1");
  }
  else if (diff3 < 5.0)
  {
    ship2.move();
    println("ship2"); 
  }
  else
  {
  ship1.move(); 
  ship2.move(); 
  ship3.move(); 
  println("display");
  }

}

/*x=4; 
y=7;
int diff = abs(x-y);
println(diff); */
class Ship {
  float low; 
  float high; 
  float sizeX;
  float sizeY;
  float posX;
  float posY;
  float r;
  float g; 
  float b; 
  //float diff; 

  Ship(float tPosX, float tPosY) { // A constructor.
    low = 50;
    high = 500;
    posX = tPosX;
    posY = tPosY;
  }
  void move(){
    //sizeX=random(low, high);
    //sizeY=10; 
    r = random(0.0,255.0);
    g = 15.0; 
    b = 15.0; 
    
  }
  void display() { // Function.
    ellipseMode(CENTER);
    noStroke(); 
    fill(r,g,b);
    ellipse(posX,posY,100,100);

  }

}


