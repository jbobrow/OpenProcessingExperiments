
int startTime;

int radUS;
int radAus;

PFont font;

void setup() {
  
  startTime = millis();
  
  size(500, 500);
  background(255);
 
  
  PImage myImage = loadImage("toaster.gif");
   smooth();
  imageMode(CENTER);
  image(myImage, width/2, height/2);
  
  radUS = 100;
  radAus = 100;
 
 font = createFont("Arial", 24);
  
  
}

void draw() {
  
  if(millis() > startTime + 5000) {
    fill(0);
    textFont(font);
    smooth();
    text("stop looking at the clock or it'll take longer", 25, 25);
  }
  
  if(millis() > startTime + 8000) {
    fill(255);
    noStroke();
    rect(0, 0, width, 35);
  }
  
  
  
  if(millis() > startTime + 11000) {
    PImage myImage2 = loadImage("toast.jpg");
     smooth();
    imageMode(CENTER);
    image(myImage2, width/2, 110);
    
    PImage myImage = loadImage("toaster.gif");
   smooth();
  imageMode(CENTER);
  image(myImage, width/2, height/2);
  }
  
  if(millis() > startTime + 12000) {
    fill(0);
    textFont(font);
    text("see?", 230, 25);
  }
  
  
  if(millis() > startTime + 14000) {
    PImage myImage5 = loadImage("us.gif");
     smooth();
    imageMode(CENTER);
    image(myImage5, 144, 240);
    
    PImage myImage6 = loadImage("aus.gif");
     smooth();
    imageMode(CENTER);
    image(myImage6, 355, 240);
    
    fill(255);
    noStroke();
    rect(0, 0, width, 30);
    
    textFont(font);
    fill(0);
    text("so which one?", 180, 25);
    
  }
    
    float distance = dist(144, 240, mouseX, mouseY);
    
    if(mousePressed == true && distance < radUS) {
  
      PImage myImage5 = loadImage("pb.gif");
     smooth();
    imageMode(CENTER);
    image(myImage5, width/3, 350);
    
    
    PImage myImage6 = loadImage("jam.gif");
    smooth();
    imageMode(CENTER);
    image(myImage6, 350, 350);
    
    fill(255);
    noStroke();
    rect(0, 0, width, 30);
    
    textFont(font);
    fill(0);
    text("mmmmmmm nah", 160, 25);
      
      
    }
    
    float distance2 = dist(355, 240, mouseX, mouseY);
   
    if(mousePressed == true && distance2 < radAus) {
  
    PImage myImage3 = loadImage("butter.gif");
    smooth();
    imageMode(CENTER);
    image(myImage3, width/3, 350);
    
    
    PImage myImage4 = loadImage("veg.gif");
    smooth();
    imageMode(CENTER);
    image(myImage4, 350, 350);
    
     fill(255);
    noStroke();
    rect(0, 0, width, 30);
    
    textFont(font);
    fill(0);
    text("great taste man!", 165, 25);
    
    
    }
    

}

