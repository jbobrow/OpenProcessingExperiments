
PFont font;
float x;
float y;

void setup() {
  size(500, 500);
  smooth();
  font = loadFont("Pointy-55.vlw");
  //textAlign(CENTER);
  textFont(font);
}

void draw() {
  background(71,213,238);

  //base
  fill (16,191,90);
  rect (0,470, 500,30);

  //stem
  fill (105,67,42);
  noStroke();
  rect (445,430, 6,40); 

  //bud
  fill (255, 229, 8);
  ellipse (447, 425, 25,25);

  //sun
  ellipse (475,15, 115,115);

  //left cloud
  fill (255);
  ellipse (0,25, 100, 54);
  ellipse (40,15, 80, 35);
  ellipse (80,5, 60, 30);

  //middle cloud
  ellipse (220,10, 150, 50);
  ellipse (300,5, 80, 35);

  //title
  textSize(55);
  fill (0);
  text ("The Microbes", 90, 210);  
  text ("Alphabet",150, 275);


  textSize(40);
  text ("Press Any Key...", 120, 415);
  textSize(25);
  text ("(by Any, I meant a or y, I got lazy...)", 60, 460);
  // Need to add in "dot, dot, dot" blinks for last 3 keys

  if ((key == 'a') || (key == 'A')) { //brings up image when a or A is pressed)
    background(255);
    textSize(55);
    text ("Algae", 180, 415);

    //small alages
    fill (44, 184, 7);
    for (int i = 70; i < 460; i +=60) {
      ellipse (i, 220, 80, 80);
    }

    //small alages eye balls
    fill (255);
    for (int e = 70; e < 460; e +=60) {
      ellipse (e, 210, 25,25);
    }

    // small iris
    fill (0);
    for (int q = 62; q < 460; q +=60) { //so i don't have to map constrain for every small iris
      x = mouseX; //-20; //so the iris can never touch the mouse on its own
      y = mouseY; //-20;
      x = constrain (x,q,q + 16); 
      y = constrain (y,202,218);
      ellipse (x, y, 7, 7); //creates iris to follow the mouse
    }

    //big alage    
    fill (189, 190, 56);
    ellipse (220, 220, 130,130);

    //eyeball
    fill (255);
    ellipse (220, 210, 40,40);

    //iris
    fill (0);
    x = mouseX; //-20; //so the iris can never touch the mouse on its own
    y = mouseY; //-20;
    x = constrain (x,205,228); //stops the iris from leaving the eye 
    y = constrain (y,200,225);
    ellipse (x, y, 9,9); //creates iris to follow the mouse
  }

  if ((key == 'y') || (key == 'Y')) { //Yogurt image if y or Y is pressed
    background(255);
    textSize(55);
    text ("Yogurt", 170, 415);

    //Yogurt body
    fill (190,179,236);
    rect (220, 210, 70, 140);
    ellipse (255, 350, 70, 20);
    ellipse (255, 210, 70, 20);

    //Yogurt head
    fill (190,179,236);
    rect (220, 110, 70, 82);
    ellipse (255, 192, 70, 20);
    ellipse (255, 110, 70, 20);

    //eyeballs
    fill (255);
    ellipse (238, 140, 20, 30);
    ellipse (272, 140, 20, 30);

    // small iris
    fill (0);
    for (int o = 230; o < 280; o += 34) { //so i don't have to map constrain for every small iris
      x = mouseX;
      y = mouseY;
      x = constrain (x,o,o + 16);
      y = constrain (y,133,147);
      ellipse (x, y, 7, 13); //creates iris to follow the mouse

      textSize (35);
      text ("Pull me!", 40, 150);
      
      if (mousePressed) {
        background(255);
      text ("Sorry, but I haven't figured this feature out yet. It was hard enough getting six eyes looking at you all at once, this is hard work!", 40, 100, 460, 460);
      }
    }
  }
}


