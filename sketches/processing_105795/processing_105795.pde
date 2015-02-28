
float speedX;
float speedY;
int px;
int py;
int nx, ny;
boolean swipe = false;
int counter;
String s=" ";

void setup() {
  size(1024, 576); 
  fill(255);
}

void draw() {
  println(speedX);
  speedX = mouseX-px;
  speedY = mouseY-py; 

  px = mouseX;
  py = mouseY; 


  int threshold = 100;

  background(0);
  if (!swipe) {
    // println("swiped!");
    if (speedX>threshold) {
      println("Swipe Right "+frameCount);
      swipe = true;
      s = "swipe right";
    } 
    else if (speedX<-threshold) {
      println("Swipe Left "+frameCount);
      swipe = true;
      s = "swipe left";
    }  
    else if (speedY>threshold) {
      println("Swipe Down "+frameCount);
      swipe = true;
      s = "swipe down";
    }
    else if (speedY<-threshold) {
      println("Swipe Up "+frameCount);
      swipe = true;
      s = "swipe up";
    }
  }
  if (swipe) {
    println("noSwipe");
    counter++;
    ellipse((counter )*10+100, height-20, 10, 10);
    if (counter>50) {
      counter=0;
      swipe=false;
    }
  }
  text(s+" "+frameCount, width/2, height/2);
}

