
boolean click = false;

//array
String[] filenames = { 
  "AAthumb1.gif", 
  "AAthumb2.gif", 
  "AAthumb3.gif", 
  "AAthumb4.gif", 
  "AAthumb5.gif", 
  "AAthumb6.gif", 
  "AAthumb7.gif", 
  "AAthumb8.gif", 
  "AAthumb9.gif",
};

PImage[] images = new PImage[filenames.length]; 

// Image swap
int imageIndex1 = int(random(filenames.length));
int imageIndex2 = int(random(filenames.length));
int imageIndex3 = int(random(filenames.length));
int imageIndex4 = int(random(filenames.length));
int imageIndex5 = int(random(filenames.length));
int imageIndex6 = int(random(filenames.length));
int imageIndex7 = int(random(filenames.length));
int imageIndex8 = int(random(filenames.length));
int imageIndex9 = int(random(filenames.length));
int imageIndex10 = int(random(filenames.length));
int imageIndex11 = int(random(filenames.length));
int imageIndex12 = int(random(filenames.length));
int imageIndex13 = int(random(filenames.length));
int imageIndex14 = int(random(filenames.length));
int imageIndex15 = int(random(filenames.length));



//Image coordinate
int x = 50;
int y = 100;
//Timer
int savedTime;
int totalTime = 1000;

void setup() { 
  size(900, 560); 
  textSize(10);
  //Timer
  savedTime = millis(); 
  // Loading the images into the array
  for (int i = 0; i<filenames.length; i++) { 
    images[i] = loadImage(filenames[i]);
  }
} 

void draw() { 

  if (click) {
    background(0);
    fill(255);
    text("click to switch background - white", mouseX+20, mouseY+20);
    text("Njoy Design Studio   Project Name: American Airline  Posted: 10/01/13", 50, 50);
  } 
  else {
    background(255);
    fill(0);
    text("click to switch background - black", mouseX+20, mouseY+20);
    text("Njoy Design Studio   Project Name: American Airline  Posted: 10/01/13", 50, 50);
  }

  //Rotation
  float viewport = 0.0;
  if (mousePressed) {
    pushMatrix();
    translate(mouseX, mouseY);
    rotate( viewport);
     //group 1
       float diameter = map(mouseX, 0, width, 25, 100);

  image(images[imageIndex1], x, y, diameter, diameter); 
  image(images[imageIndex2], x * 4.5, y, diameter, diameter); 
  image(images[imageIndex3], x * 8, y, diameter, diameter); 
  image(images[imageIndex4], x * 11.5, y, diameter, diameter); 
  image(images[imageIndex5], x * 15, y, diameter, diameter); 
  //group 2
  image(images[imageIndex6], x, y*2.5, diameter, diameter); 
  image(images[imageIndex7], x * 8, y*2.5, diameter, diameter); 
  image(images[imageIndex8], x * 11.5, y*2.5, diameter, diameter); 
  image(images[imageIndex9], x * 4.5, y*2.5, diameter, diameter); 
  image(images[imageIndex10], x * 15, y*2.5, diameter, diameter); 
  //group 3
  image(images[imageIndex11], x, y*4, diameter, diameter); 
  image(images[imageIndex12], x * 8, y*4, diameter, diameter); 
  image(images[imageIndex13], x * 11.5, y*4, diameter, diameter); 
  image(images[imageIndex14], x * 4.5, y*4, diameter, diameter); 
  image(images[imageIndex15], x * 15, y*4, diameter, diameter); 
    popMatrix();

    viewport += .5;
  }
  //timer
  int passedTime = millis() - savedTime;
  translate(50, 50);
  //image Mode
  imageMode(CENTER);
  float diameter = map(mouseX, 0, width, 25, 100);
  //group 1
  image(images[imageIndex1], x, y, diameter, diameter); 
  image(images[imageIndex2], x * 4.5, y, diameter, diameter); 
  image(images[imageIndex3], x * 8, y, diameter, diameter); 
  image(images[imageIndex4], x * 11.5, y, diameter, diameter); 
  image(images[imageIndex5], x * 15, y, diameter, diameter); 
  //group 2
  image(images[imageIndex6], x, y*2.5, diameter, diameter); 
  image(images[imageIndex7], x * 8, y*2.5, diameter, diameter); 
  image(images[imageIndex8], x * 11.5, y*2.5, diameter, diameter); 
  image(images[imageIndex9], x * 4.5, y*2.5, diameter, diameter); 
  image(images[imageIndex10], x * 15, y*2.5, diameter, diameter); 
  //group 3
  image(images[imageIndex11], x, y*4, diameter, diameter); 
  image(images[imageIndex12], x * 8, y*4, diameter, diameter); 
  image(images[imageIndex13], x * 11.5, y*4, diameter, diameter); 
  image(images[imageIndex14], x * 4.5, y*4, diameter, diameter); 
  image(images[imageIndex15], x * 15, y*4, diameter, diameter); 


  if (passedTime > totalTime) {
    println ("3 seconds have passed!");
    imageIndex1 = int(random(filenames.length));
    imageIndex2 = int(random(filenames.length));
    imageIndex3 = int(random(filenames.length));
    imageIndex4 = int(random(filenames.length));
    imageIndex5 = int(random(filenames.length));
    imageIndex6 = int(random(filenames.length));
    imageIndex6 = int(random(filenames.length));
    imageIndex7 = int(random(filenames.length));
    imageIndex8 = int(random(filenames.length));
    imageIndex9 = int(random(filenames.length));
    imageIndex10 = int(random(filenames.length));
    imageIndex11 = int(random(filenames.length));
    imageIndex12 = int(random(filenames.length));
    imageIndex13 = int(random(filenames.length));
    imageIndex14 = int(random(filenames.length));
    imageIndex15 = int(random(filenames.length));

    savedTime = millis();
  }
}

//mouse click events
void mousePressed() {
  click = !click;
}



