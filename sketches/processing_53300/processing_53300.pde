
int maxImages = 14; // Total # of images
int imageIndex = 0; // Initial image to be displayed is the first
PShape Find;
PShape Dead;
PShape Bullet;
PImage Solved;
PImage Unsolved;

// Declaring an array of images.
PImage[] images = new PImage[maxImages]; 

void setup() {
  size(300,500);
  imageMode(CENTER);
  for (int i = 0; i < images.length; i ++ ) {
    images[i] = loadImage( "Noir" + i + ".png" ); 
  }
  Find = loadShape("Find.svg");
  Dead = loadShape("Dead.svg");
  Bullet = loadShape("Bullet.svg");
  Solved = loadImage("Solved.png");
  Unsolved = loadImage("Unsolved.png");
  smooth();
  noStroke();
  shapeMode(CENTER);
  rectMode(CENTER);
  frameRate(20);
}

void draw() {
  // Displaying one image
  image(images[imageIndex],width/2,height/2); 
  if (imageIndex == 3){
    shape(Bullet,200,450,11,11);
  }
  
  fill(35,31,32);
  rect(250,60,70,100);
  fill(255);
  float sec = millis()/1000.0;
  float s = TWO_PI - map(sec,0,30,0,TWO_PI);
  arc(250,50,60,60,0,s);
  fill(35,31,32);
  ellipse(250,50,20,20);
  shape(Find, 250, 100, 100, 100);
  if(frameCount > 600){
    shape(Dead,250,140,50,50);
    float t = TWO_PI - map(frameCount,600,1200,0,TWO_PI);
    fill(255);
    arc(250,50,60,60,0,t);
    fill(35,31,32);
    ellipse(250,50,20,20);

  }
  
  if (frameCount > 1200){
     shape(Dead,250,190,50,50);
  }
 
  
  if (mouseX < 205 && mouseX > 195 && mouseY < 455 && mouseY > 445 && imageIndex == 3){
  fill(255,242,0);
  ellipse(mouseX,mouseY,20,20);
  image (Solved,width/2,height/2);
  }  
  else{
  fill(255);
  ellipse(mouseX,mouseY,20,20);
  }
  
  if (frameCount > 1220) {
    image(Unsolved,width/2,height/2);
  }
  
  
}

void mousePressed() {
  // A new image is picked randomly when the mouse is clicked
  // Note the index to the array must be an integer!
  imageIndex = int(random(images.length));
}

