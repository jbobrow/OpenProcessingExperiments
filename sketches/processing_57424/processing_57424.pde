
PImage img1;
PImage img2;

void setup() {
  frameRate(30);  //30 frames/second
  size (400, 300);  //size of sketch
  strokeWeight(3);
  background(255);
  ellipseMode(RADIUS);
  img1 = loadImage("Tatooine.JPG");  //load image of Tatooine
  img2 = loadImage("Leia.png");  //load image of Leia
}

void draw() {
  image(img1, 0, 0);  //set parameters for image
      if (mousePressed == true) {
        image(img2, 0, 0);
  }
  int x = 100;
  int y = 120;
  //Body
    stroke(0);      //set stroke to black
    fill(255);      //set fill to white
    rect(mouseX, 150, x, y);    //main body

    noStroke();
    fill(0, 0, 255);    //set fill to blue
    rect(mouseX+10, 160, x-20, y-110);    //rectangle detail 1
    rect(mouseX+10, 175, x-20, y-95);    //rectangle detail 2
    rect(mouseX+10, 205, x-20, y-115);    //rectangle detail 3
  
    fill(0);    //set fill to black
    rect(mouseX+30, 215, 40, 50);    //background for white rectangle details
    fill(255);    //set fill to white
    for (int a = 220; a < 240; a += 5) {
      rect (mouseX+35, a, 30, 3);
  }    //loop for white rectangle details
    for (int b = 245; b < 260; b += 5) {
      rect (mouseX+35, b, 30, 4);
  }    //loop for white rectangle details part two

  //Head
    stroke(0);    //set stroke to black
    fill(255);     //set fill to white
    arc(mouseX+50, 148, x/2, x/2, PI, TWO_PI);    //main head

    noStroke();
    fill(0, 0, 255);    //set fill to blue
    quad(mouseX+35, 110, mouseX+65, 110, mouseX+80, 130, mouseX+20, 130);    //quad detail background for centre  black eye
    fill(0);    //set fill to black
    ellipse(mouseX+48, 119, 7, 7);    //centre black eye
    fill(255);    //set fill to white
    ellipse(mouseX+50, 120, 3, 3);    //reflection white dot

    noStroke();
    fill(0, 0, 255);    //set fill to blue
    rect(mouseX+22, 132, 5, 15);
    rect(mouseX+32, 132, 45, 15);    //rectangle detail right of head
    fill(255, 0, 0);    //set fill to red
    ellipse(mouseX+65, 139, 5, 5);

  //Arms and Legs
    stroke(0);    //set stroke to black
    fill(255);    //set fill to white
    rect(mouseX-10, 150, 10, 120);    //left arm
    rect(mouseX+100, 150, 10, 120);    //right arm
    quad(mouseX-14, 270, mouseX+9, 270, mouseX+15, 290, mouseX-20, 290);    //left tripod
    quad(mouseX+90, 270, mouseX+113, 270, mouseX+119, 290, mouseX+84, 290);    //right tripod
    quad(mouseX+40, 270, mouseX+60, 270, mouseX+70, 295, mouseX+30, 295);    //tripod leg
    noStroke();
    fill(0, 0, 255);    //set fill to blue
    rect(mouseX-10, 170, 5, 90);    //left arm blue detail
    rect(mouseX+105, 170, 5, 90);    //right arm blue detail
}

