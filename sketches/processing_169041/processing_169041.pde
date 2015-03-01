
leaves[] leavesarray= new leaves[180];
cloud[] clouds = new cloud[13];
PImage tree;

boolean begin = false;


void setup() {
  size(800, 600);

  for (int i = 0; i <  leavesarray.length; i++) { //length of the array. instead of 
    //putting everytime a number inside. you control it globally in array itself at the top
    // i++ _> icrease by 2

    tree = loadImage("tree.png");
    leavesarray[i]= new leaves(random(25, width/2.3), random(height/6.2, height/1.7), i*4); // changes size of the different leaves


    //because it takes the 1st slot of the array times 4 --> 0*4=0
    //then the 2nd slot: 1*4=4, then the 3rd: 3*4=12, 
    //then the 4th: 4*4=16, etc etc --> every bubble has another size
  }
  for (int r = 0; r <  leavesarray.length; r++) {
    leavesarray[r].display();
  }
  for (int q = 0; q< clouds.length; q++) {
    float a = random(120, 480);
    float b = random(120, 480);
    clouds[q] = new cloud(a, b, q);
    // clouds[q]= new cloud(random( 700, 800), random(150, 400), i*4); // changes size of the different leaves
  }
}

void draw() {
  background(50, 71, 84);
  fill(150, 100, 50);
  rect(0, 510, 800, 90);
  // fill(92,56,8);
  // rect(0, 480, 800,30);

  image(tree, 25, 95, 330, 450); //draw image tree at the position
  // 25 and 20 in asize of 330 x 550

    for (int i = 0; i <  leavesarray.length; i++) {
    leavesarray[i].display();
    if (mousePressed) {
      leavesarray[i].move();
    }
  }
  for (int q=0; q < clouds.length; q++) {
    clouds[q].display();
  }
}
void mousePressed() {
  for (int i = 0; i <  leavesarray.length; i++) {
    leavesarray[i]= new leaves(random(25, width/2.3), random(height/6.2, height/1.7), i*4);
  }
}

void keyPressed() {
  if (key == 'c')
    for (int q=0; q < clouds.length; q++) {
      clouds[q].raining();
    }

{   
    if(key == 'l')
    textSize(50);
    // textAlign(CENTER);
   text("HAPPY BIRTHDAY, \n LINDOR !!!!!", 30, 60); 
    fill(random(100, 230));
    // text("BIRTHDAY", 10, 60);
    // fill(0, 102, 153, 51);
    // text("LINDOR", 10, 90);
  }
}
class cloud{
  float cloudX, cloudY;
  int qd;
  
  cloud(float x, float y, int q) {
    cloudX = random(400, 700);
    cloudY = random(70, 250);
    q = qd;
  }
  
  void display() {
    fill(random(100, 230));
    noStroke();
    ellipse (cloudX, cloudY, 30, 20);
    ellipse (cloudX+10, cloudY, 30, 30);
    ellipse (cloudX+30, cloudY, 40, 40);
    ellipse (cloudX+30, cloudY+10, 40, 20);
    ellipse (cloudX+30, cloudY+10, 40, 20);
    ellipse (cloudX+30, cloudY-10, 40, 40);
    ellipse (cloudX+10, cloudY+10, 40, 20);
    ellipse (cloudX+30, cloudY-20, 40, 40);
    ellipse (cloudX+50, cloudY, 40, 40);   
    ellipse (cloudX+30, cloudY+10, 40, 20);
  }
  
  void raining() {
      for(int r = 1; r<=300; r++){
        float a = random(cloudX, cloudX+60);
        float b = cloudY+20;
        strokeWeight(2);
        stroke(255,255,255,random(100));
        line(a, b, a, b+r);
       }
    }
}
class leaves {

  float x = 0;
  float y = 0;
  float diameter;
  float xdir;
  float ydir;
  //  float xspeed;
  float yspeed;
  color myColor = color(random(100, 250), random(255), random(80));
  float xoff = 0.0;

  leaves(float tempX, float tempY, float tempD) {     //CONSTRUCTOR every class NEEDS a constructor, 
    //even though it can left blank
    //has to have the name of the class
    x = tempX;
    y = tempY;
    diameter = tempD;
    yspeed = 3;
  }


  void display() {

    smooth();
    noStroke();
    // strokeWeight(0.5);
    fill(myColor);

    //float measure = random(-20,20); //change the size of the leaves
    beginShape(); // start to draw a leaf
    vertex(x, y); // begin at this point x, y                        // draw the other half of the shape
    bezierVertex(x, y, x-25, y+30, x, y+60);
    bezierVertex(x, y, x+25, y+30, x, y+60); 
    endShape();
  }

  void move() {
    if (y < height-105) {

      x = x + random(-2, 2); 
      y = y + random(-2, 20);
    }  
    else {
      return;
    }


  }
}


