
int x = 0;
int speed = 3;


void setup () {// Setting up the size of the canvas 
  background(0, 255,210); // Set the background to Orange
  size(600, 600); // 600 pixels by 600 pixels
  smooth(); // Smooth makes quailty better
}

void draw() {// Setting up the static functions
  for (int i = 0; i < 25; i = i + 1) {// Loop Function, Using variable i  for the x axis, which starts at 0 and goes on greater than 25 by adding one each time the loop excutes
    for (int j = 0; j < 25; j = j + 1) {// Same as pervious line, creating a new variable j of the y axis

      ellipse(i * 25, j * 25, 22, 22);//creates an ellispe 20 by 20 in size. Multiplyng variable i by 25 creating 25 ellispes across the x axis
    }                               //The same method is done by multiplying variable j by 25 creating 25 ellispes down the y axis
  } 

  {

    x = x + speed;// x = x + speed means that the speed will increase by one each time

    if ((x > width) || (x < 0)) {// This if statement lets the ellipse travel across the x axis until it excedes the width and the it performs a - 1 so they travel backwards again

      speed = speed * -1;
    }


    stroke(0); 
    fill(0, 255,210);                              

    ellipse(x, 45, 40, 40);// Created 6 Circles travelling across the x axis all set at different heights
    ellipse(x, 120, 40, 40);
    ellipse(x, 195, 40, 40); 
    ellipse(x, 270, 40, 40);
    ellipse(x, 345, 40, 40);
    ellipse(x, 420, 40, 40);
    ellipse(x, 495, 40, 40);
    ellipse(x, 570, 40, 40);
  }

  if (mouseX < 300 && mouseY < 300) { // This is the code that makes the four quadrons change colour, starting the top left 300 by 300
    fill(255, 0, 0); // Red
  } 
  else if (mouseX > 300 && mouseY < 300) { // Top right 300 by 300
    fill(0, 255, 0); //Green
  } 
  else if (mouseX < 300 && mouseY > 300) { // Bottom left 300 by 300 
    fill(0, 0, 255); // Blue
  } 
  else if (mouseX > 300 && mouseY > 300) { // Bottom right 300 by  300
    fill(255, 255, 0); // Yellow
  }
}








