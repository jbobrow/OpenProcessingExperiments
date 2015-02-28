
import processing.opengl.*;

int numdots = 3;
float chance;
float ang;
boolean expectancy;
int oldFamily = 0;

Cyan [] dots = new Cyan[numdots];
Mag [] dots2 = new Mag[numdots];
Yel [] dots3 = new Yel[numdots];



float conception = 1000;

void setup() {
  size(1284 , 720, OPENGL);
  frameRate(15);
  background(0);
  smooth();
  for (int i = 0; i < dots.length; i++) {
    float x = width/2;
    float y = height/2;
    float z = random(-1000, 0);
    dots[i] = new Cyan(x, y, z, 10, 100, 0);
    dots2[i] = new Mag(x, y, z, 10, 100, 0);
    dots3[i] = new Yel(x, y, z, 10, 100, 0);
    println("dots1" + ":" + dots.length);
    println("dots2" + ":" + dots2.length);
    println("dots3" + ":" + dots3.length);
  }
}

void draw() {
  noCursor();
  //pointLight(51, 102, 255, 65, 60, 100); 
  //pointLight(200, 40, 60, -65, -60, -150);
  //ambientLight(70, 70, 10); 

  camera (width/2, height/2, 1000,
  width/2, height/2, 0.0,
  width/2, height/2, 0.0);

  noStroke();
  fill(0, 0, 0, 1);//Change the alpha value to fade faster/slower
  //rect(0, 0, width, height);

  for (int i = 0; i <dots.length; i++) {
    //background(0,0,0,50);
    dots [i].display();
  }
    for (int i = 0; i <dots2.length; i++) {
    //background(0,0,0,50);
    dots2 [i].display();
  }
    for (int i = 0; i <dots3.length; i++) {
    //background(0,0,0,50);
    dots3 [i].display();
  }
}

void mousePressed () {
  

  createBall();


}

void createBall () {
  
  int newFamily =oldFamily + 25;
  
  for (int i = 0; i <numdots; i++) { 
  float newX = dots[i].x;
  float newY = dots[i].y;
  float newZ = dots[i].z;
  dots = (Cyan []) append (dots, new Cyan(newX, newY, newZ, 15, 100, newFamily));  
  //dots[dots.length-1] = new Cyan (0,0, 0, 20);
  }
  
  for (int i = 0; i <numdots; i++) { 
  float newX = dots2[i].x;
  float newY = dots2[i].y;
  float newZ = dots2[i].z;
  dots2 = (Mag []) append (dots2, new Mag(newX, newY, newZ, 15, 100, newFamily)); 
    float chance = random (0, 100);
   /*if (chance < 80) {
    dots 
    
    
   } */
  
  //dots[dots.length-1] = new Cyan (0,0, 0, 20);
  }
  
  for (int i = 0; i <numdots; i++) { 
  float newX = dots3[i].x;
  float newY = dots3[i].y;
  float newZ = dots3[i].z;
  dots3 = (Yel []) append (dots3, new Yel(newX, newY, newZ, 15, 100, newFamily));  
  //dots[dots.length-1] = new Cyan (0,0, 0, 20);
  }
  oldFamily = newFamily;
  println(oldFamily);
  println(dots.length);
  // creates a new Ball when moused is pressed
}





