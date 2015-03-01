
//variables

int count = 0;



void setup() {
  size(600, 600);
  background(255, 229, 193);

}


void draw() {


  translate(200, 300);
  pushMatrix();


  for (int i= 0; i<10; i++) {


    rotate(radians(random(-150, 150)));


    fill(255, 229, 193);
    stroke(255, 229, 193);
    strokeWeight(1);



    scale(1);
    line(0, 0, 0, -25);
    translate(0, -25);
  }



  for (int i= 0; i<10; i++) {


    rotate(radians(random(15, 300)));


    noFill();
    stroke(255, 229, 193);
    strokeWeight(0.5);



    scale(1);
    line(0, 0, 0, - width);
    translate(0, -25);
  }




  for (int i= 0; i<10; i++) {


    rotate(radians(random(15, 300)));


    noFill();
    stroke(255, 2, 79);
    strokeWeight(0.1);



    scale(1);
    line(0, 0, 0, -50);
    translate(0, -50);
  }



  {

    for (int i= 0; i<10; i++) {
      rotate(radians(random(15, 300)));

      fill(255, 2, 79);
      stroke(255, 2, 79);
      strokeWeight(1);
    }


    scale(0.3);
    ellipse(random(300), random(300), 100, 100);
    translate(0, -50);
  }


  {

    for (int i=1; i<10; i++) {
      rotate(radians(random(15, 300)));

      fill(255, 2, 79);
      stroke(255, 2, 79);
      strokeWeight(1);
    }


    scale(0.3);
    ellipse(300, random(600), 100, 100);
    translate(0, -25);
  }

  {
    for (int i=1; i<10; i++) {
      rotate(random(0, 300));

      fill(255, 2, 79);
      stroke(255, 2, 79);
      strokeWeight(0.1);
    }


    scale(20);
    ellipse(300, random(600), 100, 100);
    translate(0, 0);
  }


  popMatrix();


}

