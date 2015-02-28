
float i = 0;
float x = 0;
PImage[] images = new PImage[4];

void setup() {
  size(1000, 600);
  background(255);
  //noCursor();
  smooth();
  images[0] = loadImage("pikachu.png");
  images[1] = loadImage("charmander.png");
  images[2] = loadImage("squirtle.png");
  images[3] = loadImage("bulbasaur.png");
}

void draw() {
  i = i + .08;
  x = x + 5;
  if (keyPressed) {
    if (key == ' ') {
      background(255);
    }
  }


  if (keyPressed) {
    //pokeball    
    if (key == '1') {
      translate(mouseX, mouseY);
      stroke(0);
      fill(#BC1B1B);
      arc(0, 0, 50, 50, PI, TWO_PI);
      fill(255);
      arc(0, 0, 50, 50, 0, PI);
      strokeWeight(3);
      line(-24, 0, 24, 0);
      ellipse(0, 0, 15, 15);
      strokeWeight(2);
      ellipse(0, 0, 7, 7);
      strokeWeight(1);
    }

    if (key == '2') {
      
      stroke(0);
      translate(mouseX, mouseY);
      rotate(i);  
      strokeWeight(1);
      rotate(-50);
      fill(#BC1B1B);
      arc(0, 0, 50, 50, PI, TWO_PI);
      strokeWeight(2);
      line(-24, 0, 24, 0);
      fill(255);
      strokeWeight(3);
      ellipse(0, 0, 15, 15);
      strokeWeight(2);
      ellipse(0, 0, 7, 7);
      translate(4, 12);
      rotate(100);
      fill(255);
      strokeWeight(1);
      arc(0, 0, 50, 50, 0, PI);
      strokeWeight(2);
      line(-24, 0, 24, 0);
      

      
      strokeWeight(0.5);
      stroke(#83C2FF, 50);
      line(0, 0, -100, -150);
      stroke(#83C2FF, 50);
      line(0, 0, -105, -145);
      stroke(#83C2FF, 50);
      line(0, 0, -110, -140);
      stroke(#83C2FF, 50);
      line(0, 0, -115, -135);
      stroke(#83C2FF, 50);
      line(0, 0, -120, -130);
      stroke(#83C2FF, 50);
      line(0, 0, -125, -125);
      stroke(#83C2FF, 50);
      line(0, 0, -130, -120);
      stroke(#83C2FF, 50);
      line(0, 0, -135, -115);
      stroke(#83C2FF, 50);
      line(0, 0, -140, -110);
      stroke(#83C2FF, 50);
      line(0, 0, -145, -105);
      stroke(#83C2FF, 50);
      line(0, 0, -150, -100);
      stroke(#83C2FF, 50);
      line(0, 0, -155, -95);
      stroke(#83C2FF, 50);
      line(0, 0, -160, -90);
      stroke(#83C2FF, 50);
      line(0, 0, -165, -85);
      stroke(#83C2FF, 50);
      line(0, 0, -170, -80);
      stroke(#83C2FF, 50);
      line(0, 0, -175, -75);
      stroke(#83C2FF, 50);
      line(0, 0, -180, -70);
      stroke(#83C2FF, 50);
      line(0, 0, -185, -65);
      stroke(#83C2FF, 50);
      line(0, 0, -190, -60);
      stroke(#83C2FF, 50);
      line(0, 0, -195, -55);
      stroke(#83C2FF, 50);
      line(0, 0, -200, -50);
      stroke(#83C2FF, 50);
      line(0, 0, -205, -45);
      stroke(#83C2FF, 50);
      line(0, 0, -210, -40);
      stroke(#83C2FF, 50);
      line(0, 0, -215, -35);
      stroke(#83C2FF, 50);
      line(0, 0, -220, -30);
      stroke(#83C2FF, 50);
      line(0, 0, -225, -25);
      stroke(#83C2FF, 50);
      line(0, 0, -230, -20);
      stroke(#83C2FF, 50);
      line(0, 0, -235, -15);
      stroke(#83C2FF, 50);
      line(0, 0, -240, -10);
      stroke(#83C2FF, 50);
      line(0, 0, -245, -5);
      stroke(#83C2FF, 50);
      line(0, 0, -250, 0);
      stroke(#83C2FF, 50);
      line(0, 0, -245, 5);
      stroke(#83C2FF, 50);
      line(0, 0, -240, 10);
      stroke(#83C2FF, 50);
      line(0, 0, -235, 15);
      stroke(#83C2FF, 50);
      line(0, 0, -230, 20);
      stroke(#83C2FF, 50);
      line(0, 0, -225, 25);
      stroke(#83C2FF, 50);
      line(0, 0, -220, 30);
      stroke(#83C2FF, 50);
      line(0, 0, -215, 35);
      stroke(#83C2FF, 50);
      line(0, 0, -210, 40);
      stroke(#83C2FF, 50);
      line(0, 0, -205, 45);
      stroke(#83C2FF, 50);
      line(0, 0, -200, 50);
      stroke(#83C2FF, 50);
      line(0, 0, -195, 55);
      stroke(#83C2FF, 50);
      line(0, 0, -190, 60);
      stroke(#83C2FF, 50);
      line(0, 0, -185, 65);
      stroke(#83C2FF, 50);
      line(0, 0, -180, 70);
      stroke(#83C2FF, 50);
      line(0, 0, -175, 75);
      stroke(#83C2FF, 50);
      line(0, 0, -170, 80);
      stroke(#83C2FF, 50);
      line(0, 0, -165, 85);
      stroke(#83C2FF, 50);
      line(0, 0, -160, 90);
      stroke(#83C2FF, 50);
      line(0, 0, -155, 95);
      stroke(#83C2FF, 50);
      line(0, 0, -150, 100);
      stroke(#83C2FF, 50);
      line(0, 0, -145, 105);
      stroke(#83C2FF, 50);
      line(0, 0, -140, 110);
      stroke(#83C2FF, 50);
      line(0, 0, -135, 115);
      stroke(#83C2FF, 50);
      line(0, 0, -130, 120);
      stroke(#83C2FF, 50);
      line(0, 0, -125, 125);
      stroke(#83C2FF, 50);
      line(0, 0, -120, 130);
      stroke(#83C2FF, 50);
      line(0, 0, -115, 135);
      stroke(#83C2FF, 50);
      line(0, 0, -110, 140);
      stroke(#83C2FF, 50);
      line(0, 0, -105, 145);
      stroke(#83C2FF, 50);
      line(0, 0, -100, 150);
      }
    }
  
//pikachu
  if (key == '3'){
    strokeWeight(1);
    stroke(#D6C509);
    fill(random(200, 255), random(200, 255), 0, 100);
    triangle(500, 300, 500, 350, mouseX, mouseY);
    image(images[0], 375, 175);
  }
  
//charmander
  if (key == '4'){
    strokeWeight(1);
    stroke(#791616);
    fill(random(255), 0, 0, 100);
    triangle(500, 300, 500, 350, mouseX, mouseY);
    image(images[1], 375, 175);
  }

//squirtle
  if (key == '5'){
    strokeWeight(1);
    stroke(#292E83);
    fill(0, 0, random(255), 100);
    triangle(500, 300, 500, 350, mouseX, mouseY);
    image(images[2], 375, 175);
}

//bulbasaur
  if (key == '6'){
    strokeWeight(1);
    stroke(#155224);
    fill(0, random(255), 0, 100);
    triangle(500, 300, 500, 350, mouseX, mouseY);
    image(images[3], 325, 150);
  }

}

