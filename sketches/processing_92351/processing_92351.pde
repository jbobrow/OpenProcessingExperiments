
/**
 * ArrayList of objects
 * by Daniel Shiffman.  
 * 
 * This example demonstrates how to use a Java ArrayList to store 
 * a variable number of objects.  Items can be added and removed
 * from the ArrayList.
 *
 * Click the mouse to add bouncing balls.
 */

ArrayList viks;
float ballWidth = 50;
int bw = 80;

void setup() {
  size(500, 600);
  noStroke();
  // Create the font
  textFont(createFont("Georgia",70));
  textAlign(CENTER, CENTER);

  // Create an empty ArrayList
  viks = new ArrayList();
  
  // Start by adding one element
 // viks.add(new Vik(width/2, 0, ballWidth,false));
}

void draw() {
  background(255);

  // With an array, we say balls.length, with an ArrayList, we say balls.size()
  // The length of an ArrayList is dynamic
  // Notice how we are looping through the ArrayList backwards
  // This is because we are deleting elements from the list  
  for (int i = viks.size()-1; i >= 0; i--) { 
    // An ArrayList doesn't know what it is storing so we have to cast the object coming out
    Vik w = (Vik) viks.get(i);
    w.jalan();
    w.display();
    if (w.finished()) {
      // Items can be deleted with remove()
      viks.remove(i);
    }
    
  } 
  
  //"Marriage: Love is the reason.  Lifelong friendship is the gift.  Kindness is the cause.  Til' death do us part is the length." -Fawn Weaver
 textSize(25);
 fill(50);
 text("Marriage:",width/2,height/4-25);
 fill(130);
 text("Love is the reason.",width/2,height/4);
 text("Lifelong friendship is the gift.",width/2,height/4 + 25);
 text("Kindness is the cause.",width/2,height/4 + 50);
 text("Til' death do us part is the length.",width/2,height/4 + 75);
 textSize(15);
 fill(50);
 text("-Fawn Weaver",width/2 + 140,height/4 + 100);
   textSize(40);
  fill(255);
  text("-Hata and Wani-",width/2,height/2-5);
  
}

void mousePressed() {
  // A new ball object is added to the ArrayList (by default to the end)
  boolean up = false;
  if(mouseY > height/2){
    up = true;
  }
  ballWidth =  width/2-(abs(mouseX-width/2));
  ballWidth = ballWidth/(width/2);
  ballWidth = ballWidth * bw;
  //System.out.println(ballWidth);
  viks.add(new Vik(mouseX, mouseY, ballWidth, up));
}

// Simple bouncing ball class

class Vik {
  
  float x;
  float y;
  float speed;
  float gravity;
  float w;
  int life = 1300;
  //int fil = int(random(0,1000));
  boolean up; 

  
  Vik(float tempX, float tempY, float tempW, boolean u) {
    x = tempX;
    y = tempY;
    w = tempW;
    speed = 0;
    gravity = 0.1;
    up = u;
  }
  void jalan(){
    if(up){
      moveup();
    }
    else{
      move();
    }
  }
  
    void move() {
    // Add gravity to speed
    speed = speed + gravity;
    // Add speed to y location
    y = y + speed;
    

    // If square reaches the bottom
    // Reverse speed
    if (y > height/2) {
      // Dampening
      speed = speed * -0.8;
      y = height/2;
    }
  }
  
   void moveup() {
    // Add gravity to speed
    speed = speed + gravity;
    // Add speed to y location
    y = y - speed;
    

    // If square reaches the bottom
    // Reverse speed
    if (y < height/2) {
      // Dampening
      speed = speed * -0.8;
      y = height/2;
    }
  }
  
  boolean finished() {
    // Balls fade out
    life--;
    if (life < 0) {
      return true;
    } else {
      return false;
    }
  }
  
  void display() {
    String name = "LOVE";
    // Display the circle
    fill(0,life);
    //stroke(0,life);
    ellipse(x,y,w*(y/(width/2)),w*(y/(width/2)));
    //textSize(70);
    //text(name,x,y);
  }
}
