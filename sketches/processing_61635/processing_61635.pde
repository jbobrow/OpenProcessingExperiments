
private static int numfood = 20;
static int[][] foodloc = new int[600][600];
public static boolean placeFood;
public static boolean placeCreature;
public static boolean kill = false;
public static boolean removeFood = false;
public static ArrayList<Creature> creatures = new ArrayList<Creature>();
int frame = 0;
public static boolean settingmenu = false;
public static int settingxLoc = 50;
public static int settingyLoc = 600;
public static int settingpress = 0;
public static int slider1 = 300;
public static int slider2 = 300;
public static boolean slider1cho = false;
public static boolean slider2cho = false;
public int foodgenrate = 1;
public boolean hellomenu = true;


public static int getNumFood() {
  return numfood;
}

public void setup() {
  size(600, 700);
  frameRate(15);
  background(0, 255, 255);
  popFood();
  creatures.add(new Creature((int)random(600),(int)random(600),0,11,false));
}



public void popFood() {
  int a = numfood;
  while (a > 0) {
    int x = (int)(Math.random()*600);
    int y = (int)(Math.random()*600);
    foodloc[x][y] = 1;
    a--;
  }
}

public void hellomenu() {
  if (hellomenu == true) {
    fill(200);
    rect(0, 0, 600, 700);
    fill(0);
    String s = "Hello!  Welcome to PetriDish, an evolution simulator.  In this game, you get to play with your own petri dish, where you can add creatures and food.  The creatures will move around and eat the food closest to them.  Their speed depends on how many legs they have, and how big the legs are.  After the creatures have eaten enough, they will reproduce.  Sometimes the daughter creature will be sligtly mutated, which may or may not be beneficial. You also have the ability to create your own creatures at will, the genetics for these creatures will be random.  Mutations are random, so be patient or speed up the process by adding more food, (creatures need to eat to mutate).";
    text(s, 50, 80, 450, 300);
    
    text("PetriDish",50,40);
    if (mousePressed && (mouseX > 175 && mouseX < 425 && mouseY > 450 && mouseY < 500)) {
      hellomenu = false;
      

  
}

    fill(255);
    rect(175, 450, 250, 50);
    fill(0);

    text("Begin!", 280, 480);
  }
  if (hellomenu == true) {
    
  line(200, 350, 200+11, 350+11);
  line(200, 350, 200-11, 350-11);
  line(200, 350, 200-11, 350+11);
  line(200, 350, 200+11, 350-11);
  fill(255, 0, 100);
  ellipse(200, 350, 20, 20);
  fill(250, 0, 0);
  ellipse(150, 300, 20, 20);
  text("Creatures", 100, 350);
  fill(0,255,0);
  ellipse(500,300,10,10);
  ellipse(440,260,10,10);
  ellipse(400,350,10,10);
  fill(0);
  text("Food",420,310);
  }
}

public void draw() {


  if (settingmenu == true) {
    if (settingyLoc > 50) {
      settingyLoc -= 15;
    }
  } 
  else {
    if (settingyLoc < 600) {
      settingyLoc += 15;
    }
  }
  background(0, 255, 255);
  Menu ui = new Menu();

  if (settingmenu != true) {
    // background(0, 255, 255);

    if (removeFood) {
      for (int x = 0 ; x < width ; x++) {
        for (int y = 0 ; y < height-100 ; y++) {
          foodloc[x][y] = 0;
        }
      }
    }
    removeFood = false;

    if (kill) {
      for (int a = 0 ; a < creatures.size() ; a++) {
        creatures.remove(a);
      }
      kill = false;
    }

    if (placeCreature == true) {
      if (mousePressed && (mouseY < height - 100 && mouseX < width)) {
        creatures.add(new Creature(mouseX, mouseY));
      }
    }

    if (placeFood == true) {
      if (mousePressed) {
        if (mouseY < height - 100 && mouseX < width && mouseY > 0 && mouseX > 0 )
          foodloc[mouseX][mouseY] = 1;
      }
    }

    growFood();



    for (int x = 0 ; x < width ; x++) {
      for (int y = 0 ; y < height-100 ; y++) {
        if (foodloc[x][y] == 1) {
          fill(0, 255, 0);
          ellipse(x, y, 10, 10);
          for (Creature a : creatures) {
            //if (a.getxLoc() == x && a.getyLoc() == y) {
            if (a.distance(x-a.getxLoc(), y-a.getyLoc()) < 10) {
              foodloc[x][y] = 0;
              a.foodeaten++;
              a.lastate = 0;
            }
          }
        }
      }
    }



    for (int a = 0 ; a < creatures.size(); a++) {
      creatures.get(a).move();
      creatures.get(a).display();
      creatures.get(a).life();
    }
  }
  fill(0);
  text("settings", 508, 660);
  hellomenu();
}

public static ArrayList<Creature> getCreatures() {
  return creatures;
}

public void growFood() {
  int a = foodgenrate*20;
  if ( frame > 0) {
    if (frame % a == 0) {
      int x = (int)random(600);
      int y = (int)random(600);

      foodloc[x][y] = 1;
    }
  }
}


public class Creature {

  private int xLoc;
  private int yLoc;
  int wan = 0;
  private int c, d;
  private int life;
  private int lastate;
  private int R = 255;
  private int G = 0;
  private int B = 0;
  public int foodeaten = 0;
  int repro;
  private boolean mutate;
  private int legnumber;
  private int legsize;
  private float speed;

  public Creature(int x, int y) {

    xLoc = x; 
    yLoc = y;
    legnumber = (int)random(4);
    legsize = 11;
  }
  public Creature(int x, int y, int legnum, int legsiz, boolean mut) {

    xLoc = x; 
    yLoc = y;
    legnumber = legnum;
    legsize = legsiz;
    if (mut == true) {
      if (legnumber == 0) {
        legnumber=1;
      } else {
      
      B =+ 20;
      if (random(10) > 5) {
        if (random(10) > 5) {
          legsize += (int)random(4);
        } 
        else {
          legsize -= (int)random(4);
        }
      } 
      else {
        if (random(10) > 5) {
          legnumber+=1;
        } 
        else {
          legnumber-=1;
        }
      }
    }
    }
  }


  public int getxLoc() {
    return xLoc;
  }

  public int getyLoc() {
    return yLoc;
  }

  public void life() {
    frame++;
    if (frame % 20 == 0) {
      life++;
    }
    if (lastate == 1 ) {
      R = 85*legnumber;
      if (legnumber > 1) {
        B = 8*legsize;
      } 
      else {
        R = 255;
        B = 0;
      }
    }
    if (lastate  > 400 || life > 120) {
      G++;
      B++;
    }
    if (lastate > 650 || life > 120) {
      creatures.remove(this);
    }
    if ((foodeaten == 3) && repro == 0 || (foodeaten == 6 && repro == 1)) {
      if (foodeaten == 6) {
        mutate = true;
      }
      reproduce();
      repro++;
    }
  }



  void display() {



    if (legnumber >= 2) {
      line(xLoc, yLoc, xLoc+legsize, yLoc+legsize);
      line(xLoc, yLoc, xLoc-legsize, yLoc-legsize);
      line(xLoc, yLoc, xLoc-legsize, yLoc+legsize);
      line(xLoc, yLoc, xLoc+legsize, yLoc-legsize);
    }
    if (legnumber == 3) {

      B = 100;
      line(xLoc-legsize-4, yLoc, xLoc+legsize+4, yLoc);
    }
    if (legnumber <= 1) {
    }

    fill(R, G, B);
    ellipse(xLoc, yLoc, 20, 20);
  }



  public double distance(int x, int y) {
    return Math.sqrt((Math.pow(x, 2))+(Math.pow(y, 2)));
  }




  void move() {
    int a = -1;
    int b = -1;

    if ((legsize + legnumber) > 6 && (legsize + legnumber) < 20) {
      speed = 2;
    }
    if ((legsize + legnumber) > 13 && (legsize + legnumber) < 16) {
      speed = 3;
    }
    if (legnumber <= 1) {
      speed = 1;
    }

    for (Creature cr : getCreatures()) {
      if (cr != this) {
        if (distance(cr.getxLoc()-xLoc, cr.getyLoc()-yLoc) <= 20) {
          // detection = true;
          if (cr.getxLoc() > xLoc) {
            xLoc-=speed;
          } 
          else {
            xLoc+=speed;
          }
          if (cr.getyLoc() > yLoc) {
            yLoc-=speed;
          } 
          else {
            yLoc+=speed;
          }
        }
      }
    }




    int i = 0;
    for (int x = 0 ; x < width ; x++) {
      for (int y = 0 ; y < height-100 ; y++) {
        if (foodloc[x][y] == 1) {

          if (i == 0) {
            a = x;
            b = y;
            i++;
          } 
          else if (distance(x - xLoc, y - yLoc) < distance(a - xLoc, b - yLoc)) {
            a = x;
            b = y;
            i++;
          } 
          else {
            i++;
          }
        }
      }
    }


    if (a == -1 && b == -1) { // If the creature cant find any food

      if (wan == 0 || (xLoc == c && yLoc == d)) {
        c = (int)(Math.random()*600+1);
        d = (int)(Math.random()*600+1);
      }
      if (c > xLoc) {
        xLoc+=speed;
        if (c - xLoc < 3) {
          xLoc = c;
        }
        lastate++;
      } 
      else if (c < xLoc) {
        xLoc-=speed;
        if (xLoc - c < 3) {
          xLoc = c;
        }
        lastate++;
      }
      if (d > yLoc) {
        if (d - yLoc < 3) {
          yLoc = d;
        }
        yLoc+=speed;

        lastate++;
      } 
      else if (d < yLoc) {
        yLoc-=speed;
        if (yLoc - d < 3) {
          yLoc = d;
        }
        lastate++;
      }
      wan++;
    } 
    else {
      wan = 0;
      if (a > xLoc) {
        xLoc+=speed;
        if (a - xLoc < 3) {
          xLoc = a;
        }
      } 
      else if (a < xLoc) {
        xLoc-=speed;
        if (xLoc - a < 3) {
          xLoc = a;
        }
      }
      if (b > yLoc) {
        yLoc+=speed;
        if (b - yLoc < 3) {
          yLoc = b;
        }
      } 
      else if (b < yLoc) {
        yLoc-=speed;
        if (yLoc - b < 3) {
          yLoc = b;
        }
      }
      lastate++;
      if (a == xLoc && b == yLoc) {
        lastate = 0;
      }
    }
  } 





  public void reproduce() {
    int x = (int)random(3);
    int y = (int)random(3);
    if (mutate) {
      creatures.add(new Creature(xLoc+x, yLoc+y, legnumber, legsize, true));
    } 
    else {
      creatures.add(new Creature(xLoc+x, yLoc+y, legnumber, legsize, false));
    }
  }
}

public class Menu {



  public Menu() {

    settingBut();
    fill(255);
    rect(0, 600, 600, 100);
    addFoodBut();
    addCreature();
    kill();
    removefood();
    fill(0);
    text("settings", 523, 664);
    fill(200);
    rect(490, 640, 90, 30);
  }
  public void settingBut() {

    if (mousePressed && (mouseX > 480 && mouseX < 600 && mouseY > 640 && mouseY < 670)) {
      placeFood = false;
      placeCreature = false;
      settingpress++;
      if (settingpress > 0 && settingpress % 2 != 0) {
        settingmenu = true;
      } 
      else {
        settingmenu = false;
      }
      System.out.println(settingmenu);
    }



    fill(0, 255, 0);
    rect(480, 640, 90, 30);
    fill(0);

    stroke(255);

    fill(200);
    rect(settingxLoc, settingyLoc, 500, 500);
    fill(255);
    stroke(0);


    rect(settingxLoc+20, settingyLoc+20, 460, 30);
    fill(0);
    if (mousePressed && (mouseX > settingxLoc+50 && mouseX < settingxLoc+200 && mouseY > 150 && mouseY < 190)) {
     System.out.println("true");
    }
    text("SETTING MENU", 250, settingyLoc+40);
    fill(0,255,0);
    rect(settingxLoc+50, settingyLoc+100,150,40);//foodgenrate
    fill(255,0,0);
    rect(settingxLoc+50, settingyLoc+200,150,40);//mutation rate, once and a while / every other / always
    fill(255);
    rect(settingxLoc+50, settingyLoc+300,150,40);//flash?
    rect(settingxLoc+280, settingyLoc+100,150,40);//background color
    rect(settingxLoc+280, settingyLoc+200,150,40);//food color
    rect(settingxLoc+280, settingyLoc+300,150,40);//reset
  }





  public void addFoodBut() {

    if (mousePressed && (mouseX > 12 && mouseX < 102 && mouseY > 640 && mouseY < 670)) {
      placeFood = true;
      placeCreature = false;
    }
    if (placeFood) {
      stroke(204, 102, 0);
    }
    fill(0, 255, 0);
    rect(12, 640, 90, 30);
    fill(0);
    text("Add Food", 20, 660);
    stroke(0);
  }

  public void addCreature() {

    if (mousePressed && (mouseX > 132 && mouseX < 222 && mouseY > 640 && mouseY < 670)) {
      placeCreature = true;
      placeFood = false;
    }


    if (placeCreature) {
      stroke(204, 102, 0);
    }
    fill(255, 0, 0);
    rect(132, 640, 90, 30);
    fill(0);
    text("Add Creature", 137, 660);
    stroke(0);
  }

  public void kill() {

    if (mousePressed && (mouseX > 252 && mouseX < 342 && mouseY > 640 && mouseY < 670)) {
      placeCreature = false;
      placeFood = false;
      stroke(204, 102, 0);
      kill = true;
    }

    fill(0);
    rect(252, 640, 90, 30);
    fill(255);
    text("Kill Creatures", 256, 660);
    stroke(0);
  }

  public void removefood() {

    if (mousePressed && (mouseX > 382 && mouseX < 472 && mouseY > 640 && mouseY < 670)) {
      placeCreature = false;
      placeFood = false;
      stroke(204, 102, 0);
      removeFood = true;
    }

    fill(0);
    rect(372, 640, 90, 30);
    fill(255);
    text("Remove Food", 376, 660);
    stroke(0);
  }
}


