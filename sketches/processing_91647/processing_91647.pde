
float startTime; //Needed for timing calculations
boolean pause;   //A boolean that pauses the selection process.
int totalFrame;
int selector;

PImage wonder;
PImage check;
PImage time;
PImage sad;
PImage birdie_a;
PImage birdie_b;
PImage grim_a;
PImage grim_b;
PImage ham_a;
PImage ham_b;



void setup() {
  size(640, 480);
  smooth();

  selector = 1;
  startTime = millis();
  pause = false;
  totalFrame = 11;

  //load Image
  //imageMode(CENTER);
  wonder = loadImage("wonder.jpg");
  check = loadImage("check.jpg");
  time = loadImage("time_machine.jpg");
  sad = loadImage("ronald_sad.jpg");
  birdie_a = loadImage("birdie_a.jpg");
  birdie_b = loadImage("birdie_b.jpg");
  grim_a = loadImage("grim_a.jpg");
  grim_b = loadImage("grim_b.jpg");
  ham_a = loadImage("hamburglar_a.jpg");
  ham_b = loadImage("hamburglar_b.jpg");
}

void draw() {
  background(0);
  if (selector == 1) { //wonder
    pause = true;
    wonder();
  }

  if (selector == 2) { //bird_a
    birdie_a();
  }

  if (selector == 3) { //grim_a
    grim_a();
  }

  if (selector == 4) { //ham_a
    ham_a();
  }

  if (selector == 5) { //sad
    sad();
  }

  if (selector == 6) { //time
    pause = true;
    time();
  }
  if (selector == 7) { //bird_b
    birdie_b();
  }
  if (selector == 8) { //grim_b
    grim_b();
  }
  if (selector == 9) { //_ham_b
    ham_b();
  }
  if (pause == false) {
    if (millis() - startTime >= 1300) {
      selector++;
      startTime = millis();
      if (selector > totalFrame) {
        selector = 1;
      }
    }
  }
}

//--------------------
void wonder() {
  image(wonder, 0, 0);

  if (mouseX > 400 && mouseX<500 && mouseY>410 && mouseY<440) {
    fill(255, 0, 0);
    if (mousePressed) {
      selector = 2; 
      startTime = millis(); //reset timer
      pause = false;
    }
  }
  else {
    fill(0);
  }
  //The actual button drawing.
  rect(400, 410, 150, 30);
  fill(255);
  text("They quit McDonald", 420, 430);

  if (mouseX > 100 && mouseX<430 && mouseY>410 && mouseY<440) {
    fill(255, 0, 0);
    if (mousePressed) {
      selector = 7; 
      startTime = millis(); //reset timer
      pause = false;
    }
  }
  else {
    fill(0);
  }
  //The actual button drawing.
  rect(100, 410, 150, 30);
  fill(255);
  text("Still meet at McDonald", 115, 430);
}

//-------------------------

void birdie_a() {
  image(birdie_a, 0, 0);
}

void grim_a() {
  image(grim_a, 0, 0);
}

void ham_a() {
  image(ham_a, 0, 0);
}



void time() {
  image(time, 0, 0);

  if (mouseX > 400 && mouseX<500 && mouseY>410 && mouseY<440) {
    fill(255, 0, 0);
    if (mousePressed) {
      selector = 1; 
      startTime = millis(); //reset timer
      pause = false;
    }
  }
  else {
    fill(0);
  }
  //The actual button drawing.
  rect(400, 410, 150, 30);
  fill(255);
  text("Use time machine!", 420, 430);
}

//---------------------------

void birdie_b() {
  image(birdie_b, 0, 0);
}

void grim_b() {
  image(grim_b, 0, 0);
}

void ham_b() {
  image(ham_b, 0, 0);
  selector = 5;
}

void sad() {
  image(sad, 0, 0);
}

/*
void time() {
  image(time, 0, 0);

  if (mouseX > 400 && mouseX<500 && mouseY>410 && mouseY<440) {
    fill(255, 0, 0);
    if (mousePressed) {
      selector = 1; 
      startTime = millis(); //reset timer
      pause = false;
    }
  }
  else {
    fill(0);
  }
  //The actual button drawing.
  rect(400, 410, 150, 30);
  fill(255);
  text("Use time machine!", 470, 430);
}
*/





