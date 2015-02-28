

/*
*/
Ball[] balls = new Ball[20];


void setup() {

  size(1024, 768);

  smooth();

  // create balls with random coordinates and size

  for (int i = 0; i < balls.length; i++) {

    balls[i] = new Ball(random(width), random(height), random(10, 100));  

  }

}

void draw() {

  background(0);

  // draw balls

  for (int i = 0; i < balls.length; i++) {

    balls[i].display();


    // run a hit test on all other balls

    for (int n = 0; n < balls.length; n++) {

      if (n != i) {

        balls[i].hitTest(balls[n]);


      } 



    }


  }


  // check for mouse over


  for (int i = 0; i < balls.length; i++) {

    balls[i].onMouseOver(mouseX, mouseY);

  }


}


void keyPressed() {

  // when any key is pressed, propell balls outward to change the composition


  for (int i = 0; i < balls.length; i++) {


    balls[i].propell();


  }

}


