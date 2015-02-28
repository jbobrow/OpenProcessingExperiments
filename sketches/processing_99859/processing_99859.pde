
/*Final Project
Nafis Sabir
Professor Calli Higgins*/

NinjaStar[] myStar = new NinjaStar [0];

MyNaruto RealNaruto;
boolean shootstar = false;

PImage leafVillage,NinjaImage, star, clone1, clone2, gOver;
ArrayList CloneCollection;

void setup() {
  size(600, 600);
  smooth();


  //INITIALIZE
  CloneCollection = new ArrayList();
  leafVillage = loadImage("leaf.jpg");
  star = loadImage("star.png");
  NinjaImage = loadImage("naruto.jpg");
  clone1 = loadImage("naruto2.jpg");
  gOver = loadImage("gOver.jpg");

  for (int i=0; i<myStar.length;i++) {
    myStar[i]= new NinjaStar(star, width/2, height/2);
  }
  // myStar = new NinjaStar(star);
  RealNaruto = new MyNaruto(NinjaImage, width/2, height/2, 50, 50);
}

void draw() {
  //background(leafVillage);//disabled because it wasn't working in javascript
  background(0);
  RealNaruto.display();

  RightClone rClone = new RightClone(gOver, clone1, random(1, 3), 0, height/2, 100, 100);
  LeftClone lClone = new LeftClone(gOver, clone1, random(-1, -3), width, height/2, 100, 100);
  BottomClone bClone = new BottomClone(gOver, clone1, random(1, 3), width/2, height, 100, 100);
  TopClone tClone = new TopClone(gOver, clone1, random(-1, -3), width/2, 0, 100, 100);

  CloneCollection.add(rClone);
  CloneCollection.add(lClone);
  CloneCollection.add(bClone);
  CloneCollection.add(tClone);


  //CALL FUNCTIONALITY

  //for (int i = 1; i < CloneCollection.size(); i+=2) {

  RightClone rc = (RightClone) CloneCollection.get(0);
  rc.run();

  LeftClone lc = (LeftClone) CloneCollection.get(1);
  lc.run();

  BottomClone bc = (BottomClone) CloneCollection.get(2);
  bc.run();

  TopClone tc = (TopClone) CloneCollection.get(3);
  tc.run();



  for (int i = 0; i<myStar.length; i++) {
    myStar[i].starDisplay();
    myStar[i].moveStar();
  }
}

void mousePressed() {
  NinjaStar a= new NinjaStar(star, width/2, height/2);
  myStar = (NinjaStar[]) append(myStar, a);
}

 class BottomClone {
  PImage cloneImage, deathImage;
  int  cloneW, cloneH;
  float cloneX, cloneY, Attack;



  BottomClone(PImage tempgO, PImage tempImage, float tempAttack, float tempX, float tempY, int tempW, int tempH) {
    deathImage = tempgO;
    cloneImage = tempImage;//input for clone image
    cloneX = tempX;//starting x loacation for ninjas
    cloneY = tempY;//starting y location for images
    cloneW = tempW;
    cloneH = tempH;
    Attack = tempAttack;//speed for converging clones
  }

  //FUNCTIONS
  void run() {
    display();
    MoveUp();
  }

  void display() {

    imageMode(CENTER);
    image(cloneImage, cloneX, cloneY, cloneW, cloneH);
  }
  void MoveUp() { 
   cloneY -= Attack;
    
    if (cloneY - cloneH/2 < height/2) { 
      println("game over");
      remove();
//      cloneY = height;
    }
    

 }
  void remove() {
    cloneX = 9999;
    background(deathImage);
  }
}

class LeftClone {
  PImage cloneImage, deathImage;
  int  cloneW, cloneH;
  float cloneX, cloneY, Attack;



  LeftClone(PImage tempgO, PImage tempImage, float tempAttack, float tempX, float tempY, int tempW, int tempH) {
    deathImage = tempgO; 
    cloneImage = tempImage;//input for clone image
    cloneX = tempX;//starting x loacation for ninjas
    cloneY = tempY;//starting y location for images
    cloneW = tempW;
    cloneH = tempH;
    Attack = tempAttack;//speed for converging clones
  }

  //FUNCTIONS
  void run() {
    display();
    MoveLeft();
  }


  void display() {

    imageMode(CENTER);
    image(cloneImage, cloneX, cloneY, cloneW, cloneH);
  }

  void MoveLeft() {

    cloneX += Attack;
    if (cloneX - cloneW/2 < width/2) {

      println("game over");
      remove();
//      cloneX = width;
    }
  }

  void remove() {
    cloneX = 9999;
        background(deathImage);
  }
}

 class RightClone {
  PImage cloneImage,deathImage;
  int  cloneW, cloneH;
  float cloneX, cloneY, Attack;



  RightClone(PImage tempgO, PImage tempImage, float tempAttack, float tempX, float tempY, int tempW, int tempH) {
    deathImage = tempgO;
    cloneImage = tempImage;//input for clone image
    cloneX = tempX;//starting x loacation for ninjas
    cloneY = tempY;//starting y location for images
    cloneW = tempW;
    cloneH = tempH;
    Attack = tempAttack;//speed for converging clones
  }
  
  //FUNCTIONS
  void run() {
    display();
    MoveRight();
    
  }
  void display() {

    imageMode(CENTER);
    image(cloneImage, cloneX, cloneY, cloneW, cloneH);
  }



  void MoveRight() {

    cloneX += Attack;
    if (cloneX + cloneW/2 > width/2) {
     
      println("game over");
     remove();
//     cloneX = 0;

    }
  }
  
void remove(){
 cloneX = 9999;
    background(deathImage);
}
}
 class TopClone {
  PImage cloneImage, deathImage;
  int  cloneW, cloneH;
  float cloneX, cloneY, Attack;



  TopClone(PImage tempgO, PImage tempImage, float tempAttack, float tempX, float tempY, int tempW, int tempH) {
    deathImage = tempgO;
    cloneImage = tempImage;//input for clone image
    cloneX = tempX;//starting x loacation for ninjas
    cloneY = tempY;//starting y location for images
    cloneW = tempW;
    cloneH = tempH;
    Attack = tempAttack;//speed for converging clones
  }
  
  //FUNCTIONS
  void run() {
    display();
    MoveDown();
    //collision();
  }
  
  void display() {

    imageMode(CENTER);
    image(cloneImage, cloneX, cloneY, cloneW, cloneH);
  }
  
void MoveDown() {
  cloneY -= Attack;
    if (cloneY + cloneH/2 > height/2) {

      println("game over");
      remove();
     // cloneY = 0;
    }
  }
  
  void remove() {
    cloneX = 9999;
        background(deathImage);
  }

}
 class MyNaruto {
  PImage NinjaImage;
  int x, y, w, h;
  

  MyNaruto(PImage tempImage, int _x, int _y, int _w, int _h) {
    NinjaImage = tempImage;
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    
  }

  void display() {
    imageMode(CENTER);
    image(NinjaImage, x, y, w, h);
  }
}


 class NinjaStar {
  public int starY;
  public int starX;
  int starSize;
  int starSpeed;

    public NinjaStar(PImage _star, int tempX, int tempY) {
    starX = tempX;
    starY = tempY;
    starSize = 40;
    starSpeed = 3;
    star = _star;
  }

  void starDisplay() {
    imageMode(CENTER); 
    image(star, starX, starY, starSize, starSize);
  }


  void moveStar() {

    
    if (mouseX > width/2+25) {
      starY = height/2;
      starX += starSpeed;
   }else
   if (mouseX < width/2-25) {
      starY = height/2;
      starX -= starSpeed;
   } else
  if (mouseY < height/2-25) {
      starX = width/2;
      starY -= starSpeed;
    } else
    if (mouseY > height/2+25) {
     starX =width/2;
      starY += starSpeed;
    }
      if (starX >= width || starX <= 0 || starY >= height || starY <= 0) {
        noStar();
  }
}

void noStar(){
  
  

    starX = 99999;
    
  
}
}




