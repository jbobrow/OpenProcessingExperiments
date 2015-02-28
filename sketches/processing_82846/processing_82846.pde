
//Type Filters by Hannah Kim
//This project could not have been completed without the help of Colin Willson. Many, many thanks to him for his time and generosity.


/*PImage explore;
 String textstream;
 int lightlocation;
 PFont trade;
 PImage images;
 int global;
 color wordcolor = #FFFFFF;
 */

LightFiller filterOne;
Springs filterTwo;
Grid filterThree;
// Circle[] circles;

//variables
String letters;
FilterButtons FilterLightBtn;
FilterButtons FilterWaveBtn;
FilterButtons FilterDissolveBtn;
FilterButtons FilterSketchBtn;



void setup () {
  size(1000, 600);
  FilterLightBtn = new FilterButtons (1, 0, height-150);
  FilterWaveBtn = new FilterButtons (2, 0, height-100);
  FilterDissolveBtn = new FilterButtons (3, 0, height-50);
  filterOne = new LightFiller();
  filterTwo = new Springs();
  filterThree = new Grid();
  //global = 0;

  //explore = loadImage("explore.png");

  //trade = loadFont("molesk-70.vlw");
  //textFont(trade, 150);

  // circles = new Circle[1000];

  //  for(int i = 0; i < circles.length; i++){
  // circles[i] = new Circle(random(width),random(height));
  //}
}



void draw () {
  //functionOne ();
  //functionTwo ();
  //functionThree ();
  
      FilterLightBtn.showFilter();
  FilterWaveBtn.showFilter();
  FilterDissolveBtn.showFilter();
  
  
  FilterLightBtn.display();
  FilterWaveBtn.display();
  FilterDissolveBtn.display();
  

}


void mousePressed() {
  FilterLightBtn.buttonpressed();
  FilterWaveBtn.buttonpressed();
  FilterDissolveBtn.buttonpressed();
}


//class
class FilterButtons {
  boolean selected;

  int coordX;
  int coordY;
  int filternum;


  //constructor
  FilterButtons (int _filternum, int _coordX, int _coordY) {
    selected = false;

    coordX = _coordX; 
    coordY = _coordY;
    filternum = _filternum;
  }


  //method
  void display () {
    if (selected == true) {
      strokeWeight(4);
    }
    else {
      strokeWeight(1);
    }
    stroke(0);
    fill(255, 255, 255);
    rect (coordX, coordY, 100, 50);
    strokeWeight(1);
  }
  
  void showFilter() {
        if (selected == true) {
              if (filternum == 1) {
        filterOne.display();
        }
        else if (filternum == 2) {
        filterTwo.display();
        }
        else if (filternum == 3) {
        filterThree.display();
        }
        }
    
  }



  //method
  void buttonpressed () {

    if (coordX < mouseX && coordX+100 > mouseX && coordY < mouseY && coordY+50 > mouseY) {
      println("click!");
      if (selected == true) {
        selected = false;
      }
      else {
        selected = true;
      }
    }
  }
}



class LightFiller {
  //Light Filter: Filter


    //variables
  String textstream;
  int lightlocation;
  PFont trade;
  PImage images;
  int global;


  LightFiller () {
    size(1000, 600);
    noStroke();
    background(1);
    trade = loadFont("molesk-70.vlw");
    textFont(trade, 150);
    fill(0);
    text("EXPLORE", 5, 200);
    images = get();
    global = 0;
  }


  void display () {
    //background(0, 0, 0);
    for (int i = 0; i < height; i++) {
      color cooler = images.get(global, i);
      float bar = brightness(cooler);
      if (bar == 0) {
        images.set (global, i, #FFFFFF);
      }
    }

    image(images, 0, 0);
    global++;
  }
}


class Springs {
  PImage explore;

  Circle[] circles;

  Springs() {
    background (200);
    explore = loadImage("explore.png");
    circles = new Circle[1000];
    for (int i = 0; i < circles.length; i++) {
      circles[i] = new Circle(random(width), random(height));
    }
  }


  void display() {
    fill(255, 10);
    rect(0, 0, width, height);
    for (int i = 0; i < circles.length; i++) {
      circles[i].move();
      circles[i].display();
      explore.loadPixels();
    }
    explore.updatePixels();
    image(explore, 75, 230);
  }
}


class Circle {
  float x, y, speedx, speedy;
  //constructor
  Circle(float _x, float _y) {
    x = _x;
    y = _y;
    speedx = random(-10, 10);
    speedy = random(-10, 10);
  }
  //methods
  void move() {
    x+=speedx;
    y+=speedy;
  }
  void display() {
    stroke(255);
    ellipse(x, y, 15, 15);
  }
}


class Grid {
  PImage explore;

  Grid () {
    smooth();
    strokeWeight(.5);
    explore = loadImage("explore.png");
  }

  void display() {
    //background(255);
    noFill();
    for (int x = 0;x < 100; x++) {
      for (int y = 0; y<100; y++) {
        rect (x*20, y*20, 10 + random(-5, 5), 10 + random(-5, 5));
        float rn = random (1);
        if (rn < .5) {
          fill(random(255), random(255), random(255));
        } 
        else {
          fill(255);
        }
        explore.loadPixels();
      }
      explore.updatePixels();
      image(explore, 100, 250);
    }
  }
}



