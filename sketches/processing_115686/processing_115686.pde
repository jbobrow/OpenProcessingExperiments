
boolean button = false;
//array
String[] filenames = { 
  "1.gif", 
  "2.gif", 
  "3.gif", 
  "4.gif", 
  "5.gif", 
  "6.gif", 
  "7.gif", 
  "8.gif", 
  "9.gif",
}; 
PImage[] images = new PImage[filenames.length]; 

// Image swap
int imageIndex = int(random(filenames.length));

//Timer
int savedTime;
int totalTime = 100;

void setup() { 
  size(500, 560); 
  smooth();
  textSize(12);
  background(255);
  //Timer
  savedTime = millis(); 
  // Loading the images into the array
  for (int i = 0; i<filenames.length; i++) { 
    images[i] = loadImage(filenames[i]);
  }
} 

void draw() { 
  fill(0);
  text("My Lucky number Today is ", 100, 120);

  text("Try it again~", mouseX+20, mouseY+20);
  if (mousePressed) {

    button = true; 
    background(255);

    //timer
    int passedTime = millis() - savedTime;
    //image Mode
    imageMode(CENTER);
    image(images[imageIndex], width/2, height/2); 

    if (passedTime > totalTime) {
      println ("1..2..3!");
      imageIndex = int(random(filenames.length));
      savedTime = millis();
    }

    else { 
      button = false;
    }
  }
}



