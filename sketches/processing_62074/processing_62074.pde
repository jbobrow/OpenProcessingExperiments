
import fisica.*;
FCircle myCircle;
FBox winBox;
FPoly myPoly;
FWorld world;
ArrayList<PVector> pointyTips = new ArrayList<PVector> ();
//ArrayList<FPoly> trig = new ArrayList<FPoly>();


void setup() {
  size(800, 500);
  background(0);
  Fisica.init(this);
  //triangle(30, 75, 58, 20, 86, 75);
  world = new FWorld();
  world.setGrabbable(false);
  world.setEdges();
  

  //Circle
  myCircle = new FCircle(50); // creating myCircle
  myCircle.setPosition(75, 200); //where myCircle starts
  //myCircle.setDensity(20);
  myCircle.setFill(300, 0, 0);//color of myCircle
  world.add(myCircle);
  
  //Box Winner spot
  winBox = new FBox(100,25);
  winBox.setFill(0,300,150);
  winBox.setPosition(700,500);
  winBox.setStatic(true);
  world.add(winBox);
  

  //template of triangle
  /*
  FPoly NAME = new FPoly();
  NAME.vertex(x1,y1); //edge
  NAME.vertex(x2,y2); //edge
  NAME.vertex(x3,y3); //pointyTip
  pointyTips.add(new PVector(x3,y3)); //pointyTip loc
  NAME.setStatic(true);
  world.add(NAME);
  
  */


  //Triangle_top#1
  FPoly trigTopOne = new FPoly();
  trigTopOne.vertex(50, 0); //edge
  trigTopOne.vertex(150, 0); //edge
  trigTopOne.vertex(100, 150); //pointyTip
  pointyTips.add(new PVector(100,150));
  trigTopOne.setStatic(true);
  world.add(trigTopOne);
  
  //Triangle_top#2
  FPoly trigTopTwo = new FPoly();
  trigTopTwo.vertex(500, 0); //edge
  trigTopTwo.vertex(700, 0); //edge
  trigTopTwo.vertex(650, 300); //pointyTip
  pointyTips.add(new PVector(650, 300));
  trigTopTwo.setStatic(true);
  world.add(trigTopTwo);

  //Triangle_top#3
  FPoly trigTopThird = new FPoly();
  trigTopThird.vertex(300, 0); //edge
  trigTopThird.vertex(400, 0); //edge
  trigTopThird.vertex(350, 300); //pointyTip
  pointyTips.add(new PVector(350, 300));
  trigTopThird.setStatic(true);
  world.add(trigTopThird);
  
   //Triangle_top#4
  FPoly trigTopForth = new FPoly();
  trigTopForth.vertex(0, 0); //edge
  trigTopForth.vertex(100, 0); //edge
  trigTopForth.vertex(50, 100); //pointyTip
  pointyTips.add(new PVector(50, 100));
  trigTopForth.setStatic(true);
  world.add(trigTopForth);

  //Triangle_top#5
  FPoly trigTopFive = new FPoly();
  trigTopFive.vertex(400, 0); //edge
  trigTopFive.vertex(500, 0); //edge
  trigTopFive.vertex(450, 100); //pointyTip
  pointyTips.add(new PVector(450, 100));
  trigTopFive.setStatic(true);
  world.add(trigTopFive);


  //Triangle_side#1
  FPoly trigSideOne = new FPoly();
  trigSideOne.vertex(800, 400); //edge
  trigSideOne.vertex(800, 300); //edge
  trigSideOne.vertex(700, 400); //pointyTip
  pointyTips.add(new PVector(700,200));
  trigSideOne.setStatic(true);
  pointyTips.add(new PVector(700, 200));
  world.add(trigSideOne);

  //Trig below#1
  FPoly trigBelOne = new FPoly();
   trigBelOne.vertex(60,500); //edge
   trigBelOne.vertex(100,500); //edge
   trigBelOne.vertex(45,250); //pointyTip
   pointyTips.add(new PVector(45,250));
   trigBelOne.setStatic(true);
   world.add(trigBelOne); 
   
   //Trig below#2
   FPoly trigBelTwo = new FPoly();
   trigBelTwo.vertex(500,500); //edge
   trigBelTwo.vertex(400,500); //edge
   trigBelTwo.vertex(450,250); //pointyTip
   pointyTips.add(new PVector(450,250));
   trigBelTwo.setStatic(true);
   world.add(trigBelTwo);
   
   //Trig below#3
   FPoly trigBelThird = new FPoly(); //width & height
   trigBelThird.vertex(300,500); //edge
   trigBelThird.vertex(200,500); //edge
   trigBelThird.vertex(250,200); //pointyTip
   pointyTips.add(new PVector(250,200));
   trigBelThird.setStatic(true);
   world.add(trigBelThird);
   
   //Trig below#4
   /*FPoly trigBelForth = new FPoly(); //width & height
   trigBelForth.vertex(100,200); //edge
   trigBelForth.vertex(200,500); //edge
   trigBelForth.vertex(250,200); //pointyTip
   pointyTips.add(new PVector(150,300));
   trigBelForth.setStatic(true);
   world.add(trigBelForth);*/

  //List of Triangle's pointyTips
  /*ArrayList<PVector> pointyTips = new ArrayList<PVector>();
   //add triangle's to world
   pointyTips.add(new PVector(100,50)); //trigOne's point
   pointyTips.add(new PVector(700,200)); //trigTwo's point */


  // Create and add bodies to the world here
  // ...
  
  /*if(myCircle.isTouchingBody(winBox)) {
    print("win");
  }*/
}

void draw() {
  background(0); //background color
  world.step();
  world.draw();
  world.setGravity(0, -30); //floating
  

  //text("WINNER", width/2,height/2);

  //CONTROLS
  if (keyPressed) {
    if ((keyCode == LEFT || key == 'a') && myCircle.getX() >= 30) {//LEFT
      myCircle.setPosition(myCircle.getX()-5, myCircle.getY() );
    } 
    else if ((keyCode == RIGHT || key == 'd') && myCircle.getX() >= 30) {//RIGHT
      myCircle.setPosition(myCircle.getX()+5, myCircle.getY() );
    } 
    else if ((keyCode == UP || key == 'w') && myCircle.getY() >= 30) {//UP
      myCircle.setPosition(myCircle.getX(), myCircle.getY()-5 );
    } 
    else if ((keyCode == DOWN || key == 's') && myCircle.getY() >= 30) {
      myCircle.setPosition(myCircle.getX(), myCircle.getY()+5 );
    }
  }
  
  if(myCircle.isTouchingBody(winBox)) {
    myCircle.setStatic(true);
    fill(0,500,500);
    text("WINNER", width/2,height/2);
  }

  /*See of balloon popped;
   for each point in pointyTips; (using for-each loop)
   if pt is touching balloon,
   
   die();
   */


  //List of Triangle's pointyTips
  /*  ArrayList<PVector> pointyTips = new ArrayList<PVector>();*/
  //add triangle's to world
  /*pointyTips.add(new PVector(100, 50)); //trigOne's point
  pointyTips.add(new PVector(700, 200)); //trigTwo's point */

  //PVector middle= new PVector(myCircle.getX(), myCircle.getY());//Point of center of myCircle

  for (int i = 0; i < pointyTips.size(); i++) {
  balloonTouching(pointyTips.get(i));
  }
  
}

boolean balloonTouching(PVector pointyTips) {

  PVector balloonCenter = new PVector(myCircle.getX(),myCircle.getY());
  float distan = balloonCenter.dist(pointyTips);
  
  if( distan < 25) { //25 is radius of myCircle
     //print("poke");
     world.remove(myCircle);
     return true; 
  } else{
    return false;
  }


}

/*boolean winBoxTouching() {
  PVector balloonCenter = new PVector(myCircle.getX(),myCircle.getY());
  float winDistan = balloonCenter.dist(winBox.getX(), winBox.getY());
  
  if(winDistan < 25) {
    text("WINNER", width/2,height/2);
  }
  
}*/


