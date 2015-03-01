
String [] one = {
  "Pork", "Chicken", "Beef", "Tofu", "Mashroom"
};
String [] two = {
  "Cabbage", "Basil", "Baby broccoli", "Ginger", "Green pepper"
};
String [] sauce ={
  "Fish sauce", "Oyster sauce", "Chilli sauce", "Thai Curry Sauce", "Tom Yum sauce"
};
String [] spice ={
  "1","2","3","4","5"
};
String [] optional ={
  "Garlic", "Pepper", "Salt", "Sugar"
}; 

boolean [] next;
PFont myFont;
int prevSec;
int prevMillis;
int current;

void setup() {
  size (400, 500);
  int random = int(random(two.length));
  int randomtwo = int(random(sauce.length));
  int randomthree = int(random(spice.length));
  int randomfour = int(random(optional.length));
  next = new boolean[one.length];
  for (int i = 0; i< next.length; i++) {
    next[i] = true;
  }
  myFont = createFont("Futura", 20);
  textFont( myFont);
  fill(100);
}

void draw () {
  background (255);
  frameRate(2);
  if (second()!=prevSec) { //if( millis() - prevMillis > delaytime)
    current++;

    // current%3
    // current = current % one.length;
    current %= one.length;
    current %= two.length;
    current %= sauce.length;
    current %= spice.length;
    current %= optional.length;
    prevSec = second();
  }
   textSize(20);
  int rand=int(random(0, 4));
  text("1.Meat : ", 70, 100);
  text(one[current], 160, 100);

  text("2.Vegatable : ", 70, 150);
  text(two[rand], 200, 150);
  
   text("3.Sauce : ", 70, 200);
  text(sauce[current], 180, 200);
  
    text("4.Spice : ", 70, 250);
  text(spice[rand], 160, 250);

  text("5.Optional : ", 70, 300);
  text(optional[rand], 200, 300);
  
  noStroke();
  ellipse(width/2, 380, 60, 60);
  ellipseMode(CENTER);
  fill (100);
  textSize(16);
  text("Get Recipe!", width/2-40, 440);
  rect(0,0,width,10);
  rect(0,490,width,10);
}
void mousePressed() {
    if (dist(width/2, 380, mouseX, mouseY)<60/2) {
      noLoop();
      fill (#33e6a9);
      ellipse(width/2, 380, 60, 60);
    }

    //  for (int i = 0; i<one.length; i++){

    //  text(one[i], 20, 20+40*i);
    //  }
}

