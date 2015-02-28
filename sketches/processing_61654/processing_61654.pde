
import java.util.ArrayList;
PImage img, cover, egg, beef, carrot, rice, spinach, shiitake, sesameoil, soysauce, chilipaste, boss1, boss2, boss3, boss4, boss5;
PImage eggF, beefF, carrotF, riceF, spinachF, shiitakeF, sesameoilF, soysauceF, chilipasteF;
PFont font1 = createFont("shanghai", 80);
PFont font2 = createFont("korean calligraphy", 32);
PFont font3 = createFont("pho tai", 20);
PFont font4 = createFont("shanghai", 16);
PFont font5 = createFont("shanghai", 40);
PFont font6 = createFont("pho tai", 18);
PFont font7 = createFont("pho tai", 16);
PFont font8 = createFont("shanghai", 30);

boolean play, end;
int numGame, numEgg, numBeef, numCarrot, numRice, numSpinach, numShiitake, numSOil, numSSauce, numCPaste, totalIng, totalDropped, anger, ticker, wage;
int c = (int)random(8);
ArrayList<Ingredient> ing = new ArrayList<Ingredient>();
ArrayList<Integer> randomIndex = new ArrayList<Integer>();
PVector imagePoint, bowlPoint1, bowlPoint2, bowlPoint3, bowlPoint4, bowlPoint5;

void generateWage() {
  textFont(font8);
  text("YOUR CURRENT WAGE: $" + wage, CENTER, 680);
}  
void generateAmount() {
  ArrayList<Integer> amount = new ArrayList<Integer>();
  for (int i = 0 ; i < 10 ; i++) {
    if (totalIng < 30) {
      int a = (int)random(10);
      amount.add(a);
      totalIng += a;
    }
    amount.add(0);
  }
  numEgg = amount.get(0);
  numBeef = amount.get(1);
  numCarrot = amount.get(2);
  numRice = amount.get(3);
  numSpinach = amount.get(4);
  numShiitake = amount.get(5);
  numSOil = amount.get(6);
  numSSauce = amount.get(7);
  numCPaste = amount.get(8);
}

void starting() {
  cover = loadImage("image.jpg");
  image(cover, 0, 0);
  fill(255, 0, 0);
  textFont(font1);
  text("GOT BIBIMBAP?", 30, 250);
  textFont(font2);
  text("Click anywhere to begin.", 135, 300);
} 

void ending() {
  if (anger >= 100) {
    background(0);
    fill(255);
    text("YOU ARE FIRED!", 135, 300);
  } 
  else {
    int finalPay = wage - (wage * anger)/100;
    background(0);
    fill(255, 0, 0);
    textFont(font5);
    text("CONGRATULATIONS!", 125, 250);
    textFont(font6);
    text("YOU ARE A BIBIMBAP MASTER!", 145, 300);
    text("MONEY EARNED: $" + finalPay, 200, 350);
    textFont(font7);
    text("CLICK ANYWHERE IF YOU WOULD MAKE MORE MONEY", 70, 450);
  }
}
void mouseClicked() {
  play = true;
}

void angerLevel() {
  textFont(font3);
  text(anger, 548, 670);
}

void makeBowl() {
  bowlPoint1 = new PVector(mouseX, 560);
  bowlPoint2 = new PVector(mouseX + 50, 560);
  bowlPoint3 = new PVector(mouseX - 50, 560);
  bowlPoint4 = new PVector(mouseX + 25, 560);
  bowlPoint5 = new PVector(mouseX - 25, 560);
  if (mouseX > 445)
    mouseX -= (mouseX - 445);
  //bowl  
  stroke(0);
  fill(225, 0, 0);
  curve(mouseX + 25, 150, mouseX - 50, 585, mouseX + 50, 585, mouseX - 25, 150);
  fill(255);
  ellipse(mouseX, 580, 100, 45);
}

void makeIngredientBox() {
  fill(111, 10, 12); 
  rect(500, 0, 100, 700);  
  fill(0);
  textFont(font3);
  text("RECIPE", 506, 30);
  textFont(font4);
  Egg e = new Egg(525, 50);
  e.render();
  text("EGG x " + numEgg, 525, 100);
  Beef b = new Beef(525, 100);
  b.render();
  text("BEEF x " + numBeef, 520, 150); 
  Carrot c = new Carrot(525, 150);
  c.render();
  text("CARROT x " + numCarrot, 510, 200); 
  Rice r = new Rice(525, 200);
  r.render();
  text("RICE x " + numRice, 523, 250); 
  Spinach sp = new Spinach(525, 250);
  sp.render();
  text("SPINACH x " + numSpinach, 510, 300); 
  Shiitake sh = new Shiitake(525, 300);
  sh.render();
  text("SHIITAKE x " + numShiitake, 510, 350); 
  SesameOil so = new SesameOil(525, 350);
  so.render();
  text("S. OIL x " + numSOil, 521, 400); 
  SoySauce ss = new SoySauce(525, 400);
  ss.render();
  text("S. SAUCE x " + numSSauce, 508, 450); 
  ChiliPaste cp = new ChiliPaste(525, 450);
  cp.render();
  text("C. PASTE x " + numCPaste, 510, 500);
}
void checkType(Ingredient d) {
  if (d instanceof Egg && numEgg != 0) {
    numEgg--;
  } 
  else if (d instanceof Beef && numBeef != 0) { 
    numBeef--;
  } 
  else if (d instanceof Carrot && numCarrot != 0) {
    numCarrot--;
  } 
  else if (d instanceof Rice && numRice != 0) {
    numRice--;
  } 
  else if (d instanceof Spinach && numSpinach != 0) {
    numSpinach--;
  } 
  else if (d instanceof Shiitake && numShiitake != 0) {
    numShiitake--;
  } 
  else if (d instanceof SesameOil && numSOil != 0) {
    numSOil--;
  } 
  else if (d instanceof SoySauce && numSSauce != 0) {
    numSSauce--;
  } 
  else if (d instanceof ChiliPaste && numCPaste != 0) {
    numCPaste--;
  }
} 

boolean isNeeded(Ingredient d) {
  boolean needed = false;  
  if (d instanceof Egg && numEgg != 0 || numEgg > 0) {
    needed = true;
  } 
  else if (d instanceof Beef && numBeef != 0 || numBeef > 0) {
    needed = true;
  } 
  else if (d instanceof Carrot && numCarrot != 0 || numCarrot > 0) {
    needed = true;
  } 
  else if (d instanceof Rice && numRice != 0 || numRice > 0) {
    needed = true;
  } 
  else if (d instanceof Spinach && numSpinach != 0 || numSpinach > 0) {
    needed = true;
  } 
  else if (d instanceof Shiitake && numShiitake != 0 || numShiitake > 0) {
    needed = true;
  } 
  else if (d instanceof SesameOil && numSOil != 0 || numSOil > 0) {
    needed = true;
  } 
  else if (d instanceof SoySauce && numSSauce != 0 || numSSauce > 0) {
    needed = true;
  } 
  else if (d instanceof ChiliPaste && numCPaste != 0 || numCPaste > 0) {
    needed = true;
  }
  return needed;
}  

void setup() {
  size(600, 700);
  img = loadImage("background.jpg");
  starting();
  generateAmount();
}    

void play() {
  makeIngredientBox();
  angerLevel();
  Boss b = new Boss(anger);
  int randPos = (int)random(450);
  int a = (int)random(8);
  if ( ticker % 30 == 0) {
    if (a == 0) {
      ing.add(new Egg(randPos));
    } 
    else if (a == 1) {
      ing.add(new Beef(randPos));
    } 
    else if (a == 2) {
      ing.add(new Carrot(randPos));
    } 
    else if (a == 3) {
      ing.add(new Rice(randPos));
    } 
    else if (a == 4) {
      ing.add(new Spinach(randPos));
    } 
    else if (a == 5) {    
      ing.add(new Shiitake(randPos));
    } 
    else if (a == 6) {
      ing.add(new SesameOil(randPos));
    } 
    else if (a == 7) {
      ing.add(new SoySauce(randPos));
    } 
    else if (a == 8) {
      ing.add(new ChiliPaste(randPos));
    }
  }
  for (int i = 0 ; i < ing.size() ; i++ ) {
    imagePoint = new PVector(ing.get(i).getX(), ing.get(i).getY());

    Ingredient item = ing.get(i);
    if (item.detectCatch(imagePoint, bowlPoint1) || item.detectCatch(imagePoint, bowlPoint2) 
      || item.detectCatch(imagePoint, bowlPoint3) || item.detectCatch(imagePoint, bowlPoint4) 
      || item.detectCatch(imagePoint, bowlPoint5)) { 
      if (!isNeeded(item)) {
        checkType(ing.get(i));
        ing.remove(i);
        i--; 
        anger += 10;
      } 
      else {
        checkType(ing.get(i));
        ing.remove(i);
        wage += 5;
        i--;
      }
    }
     item.drop();
    if (anger == 100) {
      play = false;
      ending();
    } 
    else if (numEgg == 0 && numBeef == 0 && numRice == 0 && numCarrot == 0 && numSpinach == 0 
      && numShiitake == 0 && numSOil == 0 && numSSauce == 0 && numCPaste == 0) {
      play = false;
      ending();
    }
  }
}
  void draw() {
    frameRate(30); 
    ticker += 2;
    if (play) {
      strokeWeight(3);
      smooth();
      image(img, 0, 0);
      makeBowl();
      generateWage();
      play();
    }
  }

  class Boss {

    Boss(int a) {
      if (a <= 20) {
        boss1 = loadImage("Boss1.jpg");
        image(boss1, 510, 550);
      } 
      else if ( a > 20 && a <= 40 ) {
        boss2 = loadImage("Boss2.jpg");
        image(boss2, 510, 550);
      } 
      else if ( a > 40 && a <= 60 ) {
        boss3 = loadImage("Boss3.jpg");  
        image(boss3, 510, 550);
      } 
      else if (a > 60 && a <= 80) {
        boss4 = loadImage("Boss4.jpg");
        image(boss4, 510, 550);
      } 
      else {
        boss5 = loadImage("Boss5.jpg");
        image(boss5, 510, 550);
      }
    }
  }  
  class Ingredient {
    PVector position, vel;
    Ingredient(int xLoc) {
      position = new PVector(0, 0);
      position.x = xLoc;

      vel = new PVector(0, 7);
    }
    Ingredient(int xLoc, int yLoc) {
      this(xLoc);
      position.y = yLoc;
    }
    void render() {
      position.add(vel);
    }

    void drop() {
      this.render();
    }  

    int getX() {
      return (int)position.x;
    }

    int getY() {
      return (int)position.y;
    }

    boolean detectCatch(PVector p1, PVector p2) {
      if (p2.dist(p1) < 22.5) {
        return true;
      } 
      else {
        return false;
      }
    }
  }
  class Egg extends Ingredient {
    Egg(int xLoc) {
      super(xLoc);
    }
    Egg(int x1, int y1) {
      super(x1, y1);
      egg = loadImage("egg.jpg");
      eggF = loadImage("eggF.jpg");
    }  
    void render() {
      super.render(); 
      image(egg, position.x, position.y);
    }

    void drop() {
      super.render(); 
      image(eggF, position.x, position.y);
    }
  }    

  class Beef extends Ingredient {
    Beef(int xLoc) {
      super(xLoc);
    }
    Beef(int x1, int y1) {
      super(x1, y1);
      beef = loadImage("beef.jpg");
      beefF = loadImage("beefF.jpg");
    }  
    void render() {
      super.render(); 
      image(beef, position.x, position.y);
    }

    void drop() {
      super.render(); 
      image(beefF, position.x, position.y);
    }
  } 

  class Carrot extends Ingredient {
    Carrot(int xLoc) {
      super(xLoc);
    }
    Carrot(int x1, int y1) {
      super(x1, y1);
      carrot = loadImage("carrot.jpg");
      carrotF = loadImage("carrotF.jpg");
    }  
    void render() {
      super.render();
      image(carrot, position.x, position.y);
    }
    void drop() {
      super.render();
      image(carrotF, position.x, position.y);
    }
  }  

  class Rice extends Ingredient {
    Rice(int xLoc) {
      super(xLoc);
    }
    Rice(int x1, int y1) {
      super(x1, y1);
      rice = loadImage("rice.jpg");
      riceF = loadImage("riceF.jpg");
    }  
    void render() {
      super.render();
      image(rice, position.x, position.y);
    }
    void drop() {
      super.render();
      image(riceF, position.x, position.y);
    }
  }  

  class Spinach extends Ingredient {
    Spinach(int xLoc) {
      super(xLoc);
    }
    Spinach(int x1, int y1) {
      super(x1, y1);
      spinach = loadImage("spinach.jpg");
      spinachF = loadImage("spinachF.jpg");
    }  
    void render() {
      super.render();
      image(spinach, position.x, position.y);
    }
    void drop() {
      super.render();
      image(spinachF, position.x, position.y);
    }
  }

  class Shiitake extends Ingredient {
    Shiitake(int xLoc) {
      super(xLoc);
    }
    Shiitake(int x1, int y1) {
      super(x1, y1);
      shiitake = loadImage("shiitake.jpg");
      shiitakeF = loadImage("shiitakeF.jpg");
    }  
    void render() {
      super.render();
      image(shiitake, position.x, position.y);
    }
    void drop() {
      super.render();
      image(shiitakeF, position.x, position.y);
    }
  }

  class SesameOil extends Ingredient {
    SesameOil(int xLoc) {
      super(xLoc);
    }
    SesameOil(int x1, int y1) {
      super(x1, y1);
      sesameoil = loadImage("sesame oil.jpg");
      sesameoilF = loadImage("sesame oilF.jpg");
    }  
    void render() {
      super.render();
      image(sesameoil, position.x, position.y);
    }
    void drop() {
      super.render();
      image(sesameoilF, position.x, position.y);
    }
  }

  class SoySauce extends Ingredient {
    SoySauce(int xLoc) {
      super(xLoc);
    }
    SoySauce(int x1, int y1) {
      super(x1, y1);
      soysauce = loadImage("soy sauce.jpg");
      soysauceF = loadImage("soy sauceF.jpg");
    }  
    void render() {
      super.render();
      image(soysauce, position.x, position.y);
    }
    void drop() {
      super.render();
      image(soysauceF, position.x, position.y);
    }
  }

  class ChiliPaste extends Ingredient {
    ChiliPaste(int xLoc) {
      super(xLoc);
    }
    ChiliPaste(int x1, int y1) {
      super(x1, y1);
      chilipaste = loadImage("chili paste.jpg");
      chilipasteF = loadImage("chili pasteF.jpg");
    }  
    void render() {
      super.render();
      image(chilipaste, position.x, position.y);
    }
    void drop() {
      super.render();
      image(chilipasteF, position.x, position.y);
    }
  }


