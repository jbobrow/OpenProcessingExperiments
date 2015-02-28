
/* Valerie Leo 
 The concept of this piece is basically a animated narration of a green car driving through the city during the night.
 */



// Looping Car
int counter =0; 
int speed = 3;

// Floating Car
float x = 0;
float y = 640;
float colour = 120;

// Looping Cityscapes
float buildings = 0;
int ypos = 0;


Cloud cloudOne, cloudTwo, cloudThree;


void setup() {
  frameRate(20);
  size(800, 800);

  cloudOne = new Cloud(100, 50);
  cloudTwo = new Cloud(500, 250);
  cloudThree = new Cloud(250, 150);
}


void draw() {
  background(10, 10, 10);



  //calls cloud function
  fill(random(200));
  cloudOne.makeCloud();
  fill(random(200));
  cloudTwo.makeCloud();
  fill(random(200));
  cloudThree.makeCloud();



  // Controls the Speed of the Car
  x = x + random (-10, 15);
  y = y + random (-1, 1);
  colour = colour + random (0, 2);



  // ----- GREEN CAR


  // exhaust pipes
  fill(150);
  rect(counter - 50, y + 170, 40, 5);

  // back Wheels
  fill(random(30));
  ellipse(counter + 60, y + 150, 80, 80);
  fill(random(30));
  ellipse(counter + 310, y + 150, 80, 80);

  // whole body
  fill(138, 245, 17);
  rect(counter+50, y+10, 180, 100, 10, 200, 17, 6); 

  //backside top
  fill(138, 245, 17);
  triangle(counter-20, y+100, counter+55, y+10, counter+220, y+10);
  fill(138, 245, 17);
  triangle(counter-100, y+70, counter+20, y+60, counter+100, y+80);
  fill(138, 245, 17);
  rect(counter - 60, y + 90, 100, 70, 10, 10, 10, 5);
  //backside bottom
  fill(138, 245, 17);
  rect(counter - 102, y + 69, 200, 70, 10, 10, 10, 5);
  fill(138, 245, 17);
  triangle(counter - 102, y +  137, counter - 45, y + 140, counter - 55, y + 160);
  fill(138, 245, 17);
  rect(counter + 250, y + 80, 150, 65, 1, 2, 50, 1);

  // top right side
  fill(138, 245, 17);
  triangle(counter + 55, y + 10, counter+200, y-20, counter+275, y+100);
  // bottom right side
  fill(138, 245, 17);
  triangle(counter + 230, y + 150, counter+235, y + 50, counter + 440, y + 80);
  fill(138, 245, 17);
  triangle(counter + 380, y +  80, counter + 450, y + 80, counter + 386, y + 145);
  fill(138, 245, 17);
  triangle(counter + 320, y +  160, counter + 260, y + 60, counter + 389, y + 143);

  // bottom part
  fill (138, 245, 17);
  rect(counter - 30, y + 75, 350, 85, 5, 5, 5, 5); 

  //bumper
  fill(200);
  rect(counter - 100, y + 145, 90, 15);
  rect(counter + 300, y + 145, 70, 15);

  //headlight
  fill(250);
  ellipse(counter + 420, y + 100, 30, 30);

  // front Wheels
  fill(random(100));
  ellipse(counter + 20, y + 160, 90, 90);
  fill(0);
  ellipse(counter + 20, y + 160, 35, 35);
  fill(random(100));
  ellipse(counter + 270, y + 160, 90, 90);
  fill(0);
  ellipse(counter + 270, y + 160, 35, 35);

  // windows
  fill(random(100), random(29), random(100));
  quad(counter + 65, y + 60, counter + 90, y + 15, counter + 190, y, counter + 230, y + 60);

  //car design
  //car door
  fill(10);
  rect(counter + 190, y + 80, 25, 5);

  // Loop the car
  counter = counter + speed;
  if (counter >= 900) 
    counter = 0;
}


////////////////////////////////////////

class Cloud {

  float a, b, x, y;

  Cloud(float parameterX, float parameterY) {
    a = parameterX;
    b = parameterY;
    x = random(50, 300);
    y = random(25, 50);
  }
  void makeCloud() {
    ellipse(a, b, x, y);
    ellipse(a-100, b+25, x+10, y+5);
    ellipse(a-75, b, x-20, y-10);
    a = a - 1;

    // looping clouds
    if (a <= 0) {
      a = width;
    }



    // Cityscape

    for (int x = 0; x <= width; x = x+50) {
      buildings = int(random(700));
      cityscape (x, buildings);
    }
    buildings++;
  }

  void cityscape (int xpos, float ysize) {
    fill(random(100), random(10), random(100));
    noStroke();
    rect(xpos, 800, 170, -ysize);
  }
}

