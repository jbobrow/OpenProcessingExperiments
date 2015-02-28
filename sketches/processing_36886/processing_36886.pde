

void setup() {
  size(800, 900);
  background(0, 244, 0);
}
void draw() {


  int oneTenthWidth = width / 10;
  int oneTenthHeight = height / 10;
  for (int x = 0; x <= 9; x++) {
    for (int y = 0; y <= 9; y++) {

      int r = int(random(256));
      int g = int(random(50));
      int b2 = int(random(90));
      fill(r, g, b2);


      if (mousePressed &&(mouseButton == LEFT)) {
        fill(r, g, b2);
        //if mouse pressed change button color randomly
      }
      else if (mousePressed && (mouseButton == RIGHT)) {
        fill(0);
        //right click changes one stationary color when pressed
      }
      else {
        fill(230, 40);
        //color of button when not pressed
      }

      rect(oneTenthWidth * x, oneTenthHeight * y, oneTenthWidth, oneTenthHeight);
    }

    smooth();
    strokeWeight(1);
    stroke(0);
  }

  for (int a = width/20; a < width; a = a + width/10) {
    for (int b = height/20; b < height; b = b + height/10) {  

      fill(0);
      ellipse(a, b, 59, 100);

      fill(74, 80, 103);
      ellipse( a - 50, b + 13, 15, 70);
      ellipse( a + 50, b + 13, 15, 70);

      fill(250, 215, 169);
      //triangle(150, 400, 100, 400, 105, 240);
      //possible ear

      ellipse(a, b - 20, 52, 68); //main head shape.



      fill(0);
      rect( a - 16, b - 60, 30, 12);
      //brimm of hat

      ellipse(a, b - 45, 45, 11);

      fill(72, 69, 69);
      ellipse(a, b - 70, 30, 95/10);

      noStroke(); 
      fill(242, 206, 161);
      ellipse(a, b - 15, 19, 30);
      //sides of nose shading

      //stroke(0);
      //fill(0);
      //curve(230, 240, 190, 190, 350, 270, 200, 30);
      //curve(460, 480, 190, 190, 350, 270, 200, 35);
      //fill(255);
      // left eye brow


      noStroke();
      fill(242, 206, 161);
      ellipse(a - 12, b - 25, 10, 5);
      //under left eye shadow

      ellipse(a + 12, b - 25, 10, 5);



      stroke(0);
      fill(255);
      ellipse(a - 12, b - 28, 10, 5); //left eye, outer circle.


      fill(23, 42, 180); //Makes eye blue


      ellipse(a - 12, b - 28, 45/10, 45/10); //left eye, inner circle


      fill(0); 
      ellipse(a - 12, b - 28, 1, 1);

      fill(250, 244, 232);
      ellipse(a - 12, b - 31, 10, 2); //left eye eyelid



      noStroke();
      fill(134, 41, 47);
      triangle(a + 15, b - 10, a + 17, b - 10, a + 16, b - 24);
      triangle(a + 15, b - 10, a + 17, b - 10, a + 16, b + 2);
      //right eye scar.

      stroke(0);
      fill(255);
      ellipse(a + 12, b - 28, 10, 5); //right eye, outer circle.

      fill(23, 42, 180); //Makes eye blue


      ellipse(a + 12, b - 28, 45/10, 45/10); //right eye, inner circle


      fill(0);
      ellipse(a + 12, b - 28, 1, 1);



      fill(242, 137, 137);
      ellipse(a, b, 6, 25/10);

      noStroke();
      fill(247, 210, 210);
      ellipse(a, b, 4, 05/10);
      //mouth

      fill(0);
      triangle(a + 5, b - 4, a - 5, b - 4, a - 19, b + 3);

      triangle(a + 5, b - 4, a - 5, b - 4, a - 15, b + 2);

      triangle(a + 5, b - 4, a - 5, b - 4, a - 9, b + 2);
      //three above for left mustache hairs

      triangle(a - 2, b - 4, a + 6, b - 4, a + 19, b + 3);

      triangle(a - 2, b - 4, a + 6, b - 4, a + 13, b + 3);

      triangle(a - 2, b - 4, a + 6, b - 4, a + 10, b + 3);
      //three above for right mustache hair


      stroke(0);
      fill(248, 215, 165);
      ellipse(a - 4, b - 6, 5, 5);
      //left nostril

      ellipse(a + 4, b - 6, 5, 5);
      //right nostril



      fill(250, 215, 169);
      ellipse(a, b - 18, 12, 30);
      //nose, main shape

      noStroke();
      fill(242, 206, 161);
      ellipse(a, b + 8, 24, 10);
      //chin shading, large ellipse.

      fill(242, 206, 161);
      triangle(a, b - 2, a, b - 5, a, b + 5);
      //nose shading
      //NOT SURE WHERE IT WENT. NEED TO FIGURE OUT TRIANGLES!

      ellipse(a, b - 26, 8, 9);
      rect(a, b - 23, 18/10, 13);
      ellipse(a, b - 8, 6, 43/10);
      //more nose shading



      int r = int(random(256));
      int g = int(random(256));
      int b2 = int(random(256));
      fill(r, g, b);


      if (mousePressed &&(mouseButton == LEFT)) {
        fill(r, g, b2);
        //if mouse pressed change button color randomly
      }
      else if (mousePressed && (mouseButton == RIGHT)) {
        fill(0, 120, 200);
        //right click changes one stationary color when pressed
      }
      else {
        fill(230, 40);
        //color of button when not pressed
      }

      ellipse(700, 700, 120, 120);
    }
    redraw();
  }
}

