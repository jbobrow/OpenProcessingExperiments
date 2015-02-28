
String[] colors = { 
  "pink", "orange", "yellow", "green", "blue", "purple"
};
boolean victory = false;
int numColors = 0; //correct color present
int numPlaces = 0; //correct color and placement
int prevP = 0;
int prevC = 0;
int rowCount = 0; //where your guesses should be made
ArrayList<Circle> circs = new ArrayList<Circle>();
ArrayList<LogicBox> boxes = new ArrayList<LogicBox>();
int count = 0;


void setup() {  //setup function called initially, only once
  size(300, 650);
  background(225);  //set background white 255
  fill(245, 0, 0);
  rect(75, 25, 150, 40); //starts from corner x, y, length, width
  fill(0, 0, 150);
  rect(15, 80, 255, 45);
  // >:|
  fill(125);
  drawBoxes();
  fill(175);
  drawCircs();
  setAnswer();
}

void draw() {  
  if (rowCount == 10 && !victory) {
    fill(245, 0, 0);
    rect(75, 25, 150, 40);
    textSize(24); 
    fill(0, 200, 0);
    text("Game Over!", 87, 55);
    circs.get(10).fillCirc();
    circs.get(21).fillCirc();
    circs.get(32).fillCirc();
    circs.get(43).fillCirc();
  } 
  else if (victory) {
    fill(245, 0, 0);
    rect(75, 25, 150, 40);
    textSize(20); 
    fill(0, 255, 0);
    text("Congratulations!", 80, 55);
    circs.get(10).fillCirc();
    circs.get(21).fillCirc();
    circs.get(32).fillCirc();
    circs.get(43).fillCirc();
  } 
  else if(!victory && rowCount < 10) {
    textSize(24); 
    fill(0, 200, 0);
    text("Guess", 115, 55); //string, start from x, y
  }
}

void mousePressed() {
  PVector clik = new PVector(mouseX, mouseY);
  if (!victory) {
    for (Circle c : circs) { //cycle through colors when clicked
      if (c.clicked(clik)) {            
        if (c.getCount() > 4) {
          c.resetCount();
        }
        for (int i = rowCount; i < 43; i += 11) {
          if (c.equals(circs.get(i)) && !c.equals(circs.get(32)) && !c.equals(circs.get(21)) && !c.equals(circs.get(10))) {
            c.addC();
            c.setColor(colors[c.getCount()]);
            c.fillCirc();
          }
        }
      }
    }
    if (mouseX >= 75 && mouseX <= 225 && mouseY >= 25 && mouseY <= 65) { //guess box clicked
      numColors = 0;
      numPlaces = 0;
      for (int i = 0; i < 43; i++) { //change i++ to i += 11???
        //reset numplaces and colors?
        if (i != 10 && i != 21 && i != 32) {
          //where try used to be..
          if (circs.get(i).getColor().equals(circs.get(10).getColor())) {
            numColors++;
          } 
          else if (circs.get(i).getColor().equals(circs.get(21).getColor())) {
            numColors++;
          } 
          else if (circs.get(i).getColor().equals(circs.get(32).getColor())) {
            numColors++;
          } 
          else if (circs.get(i).getColor().equals(circs.get(43).getColor())) {
            numColors++;
          }

          if (i < 10) {
            if (circs.get(i).getColor().equals(circs.get(10).getColor())) {
              numPlaces++;
            }
          } 
          else if (i < 21) {
            if (circs.get(i).getColor().equals(circs.get(21).getColor())) {
              numPlaces++;
            }
          } 
          else if (i < 32) {
            if (circs.get(i).getColor().equals(circs.get(32).getColor())) {
              numPlaces++;
            }
          } 
          else if (i < 43) {
            if (circs.get(i).getColor().equals(circs.get(43).getColor())) {
              numPlaces++;
            }
          }
        }
      }
      numColors -= prevC;
      numPlaces -= prevP;
      String clrA = circs.get(rowCount).getColor();
      String clrB = circs.get(rowCount + 11).getColor();
      String clrC = circs.get(rowCount + 22).getColor();
      String clrD = circs.get(rowCount + 33).getColor();
      for (int i = rowCount; i >= 0; i--) {
        if (clrA.equals(clrB) || clrA.equals(clrC) || clrA.equals(clrD)) {
          numColors--;
          if (clrB.equals(clrC) || clrB.equals(clrD)) {
            numColors--;
            if (clrC.equals(clrD)) {
              numColors--;
            }
          }
        }
      }
      boxes.get(rowCount++).setGuesses(numPlaces, numColors);
    }
  }
}


public void drawCircs() {
  int m = 0;
  for (int i = 0; i < 4; i++) {
    for (int n = 12; n > 1; n--) {
      m = 0;
      circs.add(new Circle(i*50 + 100, n*50 + m, 25));
      m += 5; 
      //adds circles from bottom left corner up by column ^up, ^up, ^up, ^up
    }
  }
  for (Circle a: circs) {
    a.render();
  }
}

public void drawBoxes() {
  int m = 0;
  for (int i = 12; i > 1; i--) {
    m = 0;
    boxes.add(new LogicBox(20, i*50 + m - 13, 40, 25));
    m += 5;
  }
  for (LogicBox a: boxes) {
    a.render();
  }
}

public void setAnswer() {
  //int random = (int)(Math.random()*6);
  ArrayList<Integer> nums = new ArrayList<Integer>();
  nums.add((int)random(6));
  circs.get(10).setColor(colors[nums.get(0)]);
  nums.add((int)random(6));
  while (nums.get (0) == nums.get(1)) {
    nums.remove(1);
    nums.add((int)random(6));
  }
  circs.get(21).setColor(colors[nums.get(1)]);
  nums.add((int)random(6));
  while (nums.get (0) == nums.get(2) || nums.get(1) == nums.get(2)) {
    nums.remove(2);
    nums.add((int)random(6));
  }
  circs.get(32).setColor(colors[nums.get(2)]);
  nums.add((int)random(6));
  while (nums.get (0) == nums.get(3) || nums.get(1) == nums.get(3) || nums.get(2) == nums.get(3)) {
    nums.remove(3);
    nums.add((int)random(6));
  }
  circs.get(43).setColor(colors[nums.get(3)]);
}

public Circle circClicked() {
  PVector clickLoc = new PVector(mouseX, mouseY);
  for (Circle b: circs) {
    if (clickLoc.dist(b.getCenter()) <= b.getSize()/2.0) {
      return b;
    }
  }
  return new Circle(0, 0, 1);
}

public class Circle {
  int cx, cy, size;
  int counter = -1;
  PVector center;
  String colour = "null";
  public Circle(int x, int y, int s) {
    cx = x;
    cy = y;
    center = new PVector(x, y);
    size = s;
  }
  public void addC() {
    counter++;
  }
  public int getCount() {
    return counter;
  }
  public void resetCount() {
    counter = -1;
  }
  public int getX() {
    return cx;
  }
  public int getY() {
    return cy;
  }
  public PVector getCenter() {
    return center;
  }
  public int getSize() {
    return size;
  }
  public void setColor(String cl) {
    colour = cl;
  }
  public String getColor() {
    return colour;
  }
  public boolean clicked(PVector clik) {
    if (clik.dist(center) <= size/2.0) {
      return true;
    }
    return false;
  }
  public void render() {
    ellipse(cx, cy, size, size);
  }
  public boolean equals(Circle ot) {
    if (cx == ot.getX() && cy == ot.getY()) {
      return true;
    }
    return false;
  }

  public void fillCirc() {       
    if (counter == 0 || colour.equals("pink")) {
      fill(255, 0, 255);
      ellipse(cx, cy, size, size);
    } 
    else if (counter == 1 || colour.equals("orange")) {
      fill(255, 128, 0);
      ellipse(cx, cy, size, size);
    } 
    else if (counter == 2 || colour.equals("yellow")) {
      fill(255, 255, 0);
      ellipse(cx, cy, size, size);
    } 
    else if (counter == 3 || colour.equals("green")) {
      fill(0, 255, 0);
      ellipse(cx, cy, size, size);
    } 
    else if (counter == 4 || colour.equals("blue")) {
      fill(0, 255, 255);
      ellipse(cx, cy, size, size);
    } 
    else if (counter == 5 || colour.equals("purple")) {
      fill(127, 0, 255); //consider changing to 153, 51, 255
      ellipse(cx, cy, size, size);
    }
  }
  public void fillCirc(String culr) {
    if (culr.equals("black")) {
      fill(0);
      ellipse(cx, cy, size, size);
    } 
    else if (culr.equals("white")) {
      fill(255);
      ellipse(cx, cy, size, size);
    }
  }
}

public class LogicBox {
  Circle one, two, three, four;
  int ox, oy, l, w;
  public LogicBox(int x, int y, int sl, int sw) {
    ox = x;
    oy = y;
    l = sl;
    w = sw;
    one = new Circle(x + 10, y + 8, 7);
    two = new Circle(x + 25, y + 8, 7);
    three = new Circle(x + 10, y + 18, 7);
    four = new Circle(x + 25, y + 18, 7);
  }
  public Circle getC1() {
    return one;
  }
  public Circle getC2() {
    return two;
  }
  public Circle getC3() {
    return three;
  }
  public Circle getC4() {
    return four;
  }
  public void render() {
    rect(ox, oy, l, w);
    ellipse(one.getX(), one.getY(), one.getSize(), one.getSize());
    ellipse(two.getX(), two.getY(), two.getSize(), one.getSize());
    ellipse(three.getX(), three.getY(), three.getSize(), one.getSize());
    ellipse(four.getX(), four.getY(), four.getSize(), one.getSize());
  }
  public void setGuesses(int places, int colours) {
    prevC += numColors;
    prevP += numPlaces;
    if (places > 2) {
      one.fillCirc("white");
      two.fillCirc("white");
      three.fillCirc("white");
      if (places > 3) {
        four.fillCirc("white");
        victory = true;
      }
    } 
    else if (places == 2) {
      one.fillCirc("white");
      two.fillCirc("white");
      if (colours - places > 0) {
        three.fillCirc("black");
        if (colours - places > 1) {
          four.fillCirc("black");
        }
      }
    } 
    else if (places == 1) {
      one.fillCirc("white");
      if (colours - places > 0) {
        two.fillCirc("black");
        if (colours - places > 1) {
          three.fillCirc("black");
          if (colours - places > 2) {
            four.fillCirc("black");
          }
        }
      }
    } 
    else if (places == 0) {
      if (colours > 0) {
        one.fillCirc("black");
        if (colours > 1) {
          two.fillCirc("black");
          if (colours > 2) {
            three.fillCirc("black");
            if (colours > 3) {
              four.fillCirc("black");
            }
          }
        }
      }
    }
  }
}

