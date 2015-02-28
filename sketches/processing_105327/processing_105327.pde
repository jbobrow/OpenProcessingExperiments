
boolean mouseOnLeft;
PImage homer;
PImage sleep;
PFont friday90;
PFont weekday25;


void setup() {
  size(520, 428);
  smooth();

  friday90 = loadFont("friday90.vlw");
  weekday25 = loadFont("weekday25.vlw");

  homer = loadImage("homer.jpg");
  sleep = loadImage("sleep.jpg");

  mouseOnLeft = true;
}

void draw () {
  background(255);



  //images
  if ((mouseX<=50) || (mouseX>=500)) {
    mouseOnLeft = true;
  }
  else { 
    mouseOnLeft = false;
  }

  print("Mouse on Left? "); //put this line so i can keep track of which is which
  println(mouseOnLeft);


  //new if

  if (mouseOnLeft == true) {
    image(homer, 0, 0); 
    textFont(weekday25);
    fill(0, 0, 0);
    text("Monday: CODE HW \nTuesday: CODE HW \nWednesday: CODE HW \nThursday: Code HW", 10, 25);
  }
  else { 
    image(sleep, mouseX, mouseY);

    textFont(friday90);
    fill(0, 0, 0);
    text("THANK \nGOD \nIT'S \nFRIDAY", 10, 90);
  }
}


