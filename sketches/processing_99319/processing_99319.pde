
//Pimage farmer;

ArrayList<Squirrel> squirrels = new ArrayList<Squirrel>();
float posDown;
int speed = 5;
float posX = 300;
float posY = 100;

void setup() {
  size(1000,500);
  background(0);
  posDown = height/2;
  for(int i = 0; i < 10; i++) {
    Squirrel temp = new Squirrel((int)(random(1100,2000)), (int)(random(0,450)));
    squirrels.add(temp);
  }

  

  //farmer = loadImage("farmer.png");
}

void draw() {
  //farmer(farmer, 100, 100);
  //rect(posX, posY, 100, 100);
  //fill(0,255,255);
  if (keyPressed == true) {
    if (keyCode == UP && posDown > 0) {
       posDown -= speed;
    }
    
    if (keyCode == DOWN && posDown < width) {
       posDown += speed;
    }
  }
  
  if(posDown < 0) {
    posDown = 100;
  }else if(posDown > height - 100) {
    posDown = height - 100;
  }  
  background(0);
  
  posX = 300;
  posY = 100;
  
  for(int i= 0; i < 5; i++) {
      posY += 50;
      ellipseMode(CENTER);
      fill(242,234,20);
      ellipse(posX, posY, 25, 25);
  }
   posY = 100;
   for(int i = 0; i < 5; i++) {
       posX = 400;
       posY+= 50;
       ellipseMode(CENTER);
      fill(242,234,20);
      ellipse(posX, posY, 25, 25);
   }
  
    
    fill(0,255,255);
    rect(100, posDown, 100, 100);
    
    for(int i = squirrels.size()-1; i>= 0; i--) {
        if(squirrels.get(i).xPos > 0) {
            squirrels.get(i).display();
        }else {
            squirrels.remove(i);
        }    
    }
  
}


//-------------------------------------------------------------
class Squirrel {
  int xPos;
  int yPos;
  int speed = 1;
  //PImage squirrelImage;
  
  Squirrel(int x, int y) {
    xPos = x;
    yPos = y;
    //squirrelImage = img;
  }
  
  void move() {
    xPos -= speed;
  }
  void display() {
    move();
    ellipseMode(CENTER);
    fill(255,124,200);
    ellipse(xPos, yPos, 35, 35);
  }
}





