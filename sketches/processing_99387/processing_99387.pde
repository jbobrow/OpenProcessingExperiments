
boolean begin = true;
Gardener player;
Flower[]  flowers = new Flower[8];
ArrayList<Squirrel> squirrels = new ArrayList<Squirrel>();
int flowerY = 0;
int flowerX = 300;
    
void setup() {
  
      player = new Gardener(5,height, loadImage("farmer.png"));
      size(1000,500);
      background(34,139,34);
  
      //create flowers
      for(int i= 0; i < flowers.length; i++) {
        if(i<4) {
          flowerY += 100;
          flowers[i] = new Flower(300, flowerY, loadImage("retroflower.png"));     
        }else {
          if(i == 4) flowerY = 0;
          flowerY+= 100;
          flowers[i] = new Flower(400, flowerY, loadImage("retroflower.png"));
       }
      }
      //create squirrels
      for(int i = 0; i < 10; i++) {
        Squirrel temp = new Squirrel((int)(random(1100,2500)), (int)(random(0,450)),           loadImage("squirrel.png"));
        squirrels.add(temp);
      }
      
}
void draw() {
    //if(begin) {
        //background(6,245,60);
    //}else {
    player.display();
  
    for(Flower x: flowers) {
        x.display();
    }
    //println(squirrels.size());
    for(int i = squirrels.size()-1; i >=0; i--) {
      
        if(squirrels.get(i).xPos > 0) {
           squirrels.get(i).display();
        }else {
           squirrels.remove(i);
         }
   }
  //}
}

}
//-------------------------------------------------------------
class Gardener {
  //y coordinate
  float posDown;
  int speed;
  PImage gardenerImage;
  
  Gardener(int speed, int h, PImage img) {
    this.speed = speed;
    posDown = h/2;
    gardenerImage = img;
  }
  
  void display() {
    
     move();
     background(34,139,34);
     /*fill(0,255,255);
     rect(100, posDown, 100, 100);
     */
     image(gardenerImage, 100, posDown);
   }
   

  void move() {
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
    
    
  }
}
//------------------------------------------------------------
class Flower {
  int xPos;
  int yPos;
  int width;
  int height;
  PImage flowerImage;
  
  //posX = 300;
  //posY = 100;
  //constructs a flower
  Flower(int x, int y, PImage img) {
    xPos = x;
    yPos = y;
    flowerImage = img;
  }
  
  void display() {
    image(flowerImage, xPos, yPos);
    /*
    ellipseMode(CENTER);
    fill(242,234,20);
    ellipse(xPos, yPos, 25, 25);
    */
    //move this to game class
    /*for(int i= 0; i < 5; i++) {
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
    */
  }
}
//-------------------------------------------------------------
class Squirrel {
  int xPos;
  int yPos;
  int speed = 1;
  PImage squirrelImage;
  
  Squirrel(int x, int y, PImage img) {
    xPos = x;
    yPos = y;
    squirrelImage = img;
  }
  
  void move() {
    xPos -= speed;
  }
  void display() {
    move();
    image(squirrelImage, xPos, yPos);
  }
}








