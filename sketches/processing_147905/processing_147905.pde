
int[] loc; //? haha
String[] colors = { 
  "pink", "orange", "yellow", "green", "blue", "purple"
};
boolean victory = false;
int numColors = 0; //correct color present
int numPlaces = 0; //correct color and placement
int rowCount = 0; //where your guesses should be made
boolean mouseClicked = false;
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
  println("set up done");
  frameRate(2);
}

void draw() {  
  if (!victory) {
    textSize(24); 
    fill(0, 200, 0);
    text("Guess!", 115, 55); //string, start from x, y
  } 
  else {
    textSize(20); 
    fill(0, 255, 0);
    text("Congratulations!", 80, 55);
  }
  println(count++);

}

void mousePressed() {
  println("mouse clicked");

  PVector clik = new PVector(mouseX, mouseY);
  for (Circle c : circs) { //cycle through colors when clicked
    if (c.clicked(clik)) {            
      println("circle clicked");
      if (c.getCount() > 4) {
        c.resetCount();
      }
      for (int i = rowCount; i < 43; i += 11) {
        println("for loop");  
        if (c.equals(circs.get(i)) && !c.equals(circs.get(32)) && !c.equals(circs.get(21)) && !c.equals(circs.get(10))) {
          println("not sure");
          c.addC();
          c.setColor(colors[c.getCount()]);
          c.fillCirc();
          println("color change?");
        }
      }
    }
  }


  if (mouseX >= 75 && mouseX <= 225 && mouseY >= 25 && mouseY <= 65) {
    int circIdx = 0;
    for (Circle c : circs) {
      numPlaces = 0;
      numColors = 0;
      //if(circIdx) {
      //try {
      if (c.getColor().equals(circs.get(10).getColor())) {
        numColors++;
        if (c.getColor().equals(circs.get(21).getColor())) {
          numColors++;
          if (c.getColor().equals(circs.get(32).getColor())) {
            numColors++;
            if (c.getColor().equals(circs.get(43).getColor())) {
              numColors++;
            }
          }
        }
      }
      if (circIdx < 10) {
        if (c.getColor().equals(circs.get(10).getColor())) {
          numPlaces++;
        }
      } 
      else if (circIdx < 21) {
        if (c.getColor().equals(circs.get(21).getColor())) {
          numPlaces++;
        }
      } 
      else if (circIdx < 32) {
        if (c.getColor().equals(circs.get(32).getColor())) {
          numPlaces++;
        }
      } 
      else if (circIdx < 43) {
        if (c.getColor().equals(circs.get(43).getColor())) {
          numPlaces++;
        }
      }
      //} 
      //catch (Exception E) {
      //thank cer
      //}
      //}    
      circIdx++;
    } 
    boxes.get(rowCount).numCorrect(numPlaces, numColors);
    numColors = 0;
    numPlaces = 0;
    boxes.get(rowCount).setGuesses();
    Circle yi = boxes.get(rowCount).getC1();
    Circle er = boxes.get(rowCount).getC2();
    Circle san = boxes.get(rowCount).getC3();
    Circle si = boxes.get(rowCount).getC4();
    if (!yi.equals("null") && yi.getColor().equals("black")) {
      fill(0);
      ellipse(yi.getX(), yi.getY(), yi.getSize(), yi.getSize());
    } 
    else if (!yi.equals("null") && yi.getColor().equals("white")) {
      fill(255);
      ellipse(yi.getX(), yi.getY(), yi.getSize(), yi.getSize());
    } 
    else if (!er.equals("null") && er.getColor().equals("black")) {
      fill(0);
      ellipse(er.getX(), er.getY(), er.getSize(), er.getSize());
    } 
    else if (!er.equals("null") && er.getColor().equals("white")) {
      fill(255);
      ellipse(er.getX(), er.getY(), er.getSize(), er.getSize());
    } 
    else if (!san.equals("null") && san.getColor().equals("black")) {
      fill(0);
      ellipse(san.getX(), san.getY(), san.getSize(), san.getSize());
    } 
    else if (!san.equals("null") && san.getColor().equals("white")) {
      fill(255);
      ellipse(san.getX(), san.getY(), san.getSize(), san.getSize());
    } 
    else if (!si.equals("null") && si.getColor().equals("black")) {
      fill(0);
      ellipse(si.getX(), si.getY(), si.getSize(), si.getSize());
    } 
    else if (!si.equals("null") && si.getColor().equals("white")) {
      fill(255);
      ellipse(si.getX(), si.getY(), si.getSize(), si.getSize());
    }
    rowCount++;
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
  nums.add((int)(Math.random()*6));
  circs.get(10).setColor(colors[nums.get(0)]);
  nums.add((int)(Math.random()*6));
  while (nums.get (0) == nums.get(1)) {
    nums.remove(1);
    nums.add((int)(Math.random()*6));
  }
  circs.get(21).setColor(colors[nums.get(1)]);
  nums.add((int)(Math.random()*6));
  while (nums.get (0) == nums.get(2) && nums.get(1) == nums.get(2)) {
    nums.remove(2);
    nums.add((int)(Math.random()*6));
  }
  circs.get(32).setColor(colors[nums.get(2)]);
  nums.add((int)(Math.random()*6));
  while (nums.get (0) == nums.get(3) && nums.get(1) == nums.get(3) && nums.get(2) == nums.get(3)) {
    nums.remove(3);
    nums.add((int)(Math.random()*6));
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
    if (counter == 0) {
      fill(255, 0, 255);
      ellipse(cx, cy, size, size);
    } 
    else if (counter == 1) {
      fill(255, 128, 0);
      ellipse(cx, cy, size, size);
    } 
    else if (counter == 2) {
      fill(255, 255, 0);
      ellipse(cx, cy, size, size);
    } 
    else if (counter == 3) {
      fill(0, 255, 0);
      ellipse(cx, cy, size, size);
    } 
    else if (counter == 4) {
      fill(0, 255, 255);
      ellipse(cx, cy, size, size);
    } 
    else if (counter == 5) {
      fill(127, 0, 255); //consider changing to 153, 51, 255
      ellipse(cx, cy, size, size);
    } 
    else if (colour.equals("black")) {
      fill(0);
      ellipse(cx, cy, size, size);
    } 
    else if (colour.equals("white")) {
      fill(255);
      ellipse(cx, cy, size, size);
    }
  }
}

public class LogicBox {
  Circle one, two, three, four;
  int ox, oy, l, w;
  int places = 0;
  int colours = 0;
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
  public void numCorrect(int place, int colour) {
    places = place;
    colours = colour;
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
  public void setGuesses() {
    if (places > 2) {
      one.setColor("white");
      two.setColor("white");
      three.setColor("white");
      if (places > 3) {
        four.setColor("white");
      }
    } 
    else if (places == 2) {
      one.setColor("white");
      two.setColor("white");
      if (colours - places > 1) {
        three.setColor("black");
        if (colours - places > 0) {
          four.setColor("black");
        }
      }
    } 
    else if (places == 1) {
      one.setColor("white");
      if (colours - places > 2) {
        two.setColor("black");
        if (colours - places > 1) {
          three.setColor("black");
          if (colours - places > 0) {
            four.setColor("black");
          }
        }
      }
    } 
    else if (places == 0) {
      if (colours > 0) {
        one.setColor("black");
        if (colours > 1) {
          two.setColor("black");
          if (colours > 2) {
            three.setColor("black");
            if (colours > 3) {
              four.setColor("black");
            }
          }
        }
      }
    }
  }
}


