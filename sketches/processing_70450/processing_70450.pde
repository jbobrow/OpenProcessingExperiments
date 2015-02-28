
//Only 20 shape calls!
int dim = 300; //Default size
int seed; //Random color
int biting = 0; //Positon on bite
int bitetime = 10; //Frames per bite
boolean flip = false; //Flip controller

void setup() {
  size(400, 400);
  rectMode(CENTER);
  ellipseMode(CENTER);
  strokeWeight(1);
  frameRate(30);
  chooseSeed();
}

void draw() {
  background(255);
  //Whole thing follows mouse
  pushMatrix();
    if (flip)
    {
      //Flip
      scale(-1,1);
      //Mouth on mouse
      translate(-mouseX-dim/4,mouseY-dim/2);
    }
    else
    {
      //Mouth on mouse
      translate(mouseX-dim/4,mouseY-dim/2);
    }
    //Change color on right click
    if (mousePressed && mouseButton == RIGHT) {
      chooseSeed();
    }
    randomSeed(seed);
    //Bite function on left click
    if (mousePressed && mouseButton == LEFT && biting == 0) {
      //Bite function
      biting++;
    }
    maketail();
    makefeet();
    makeface();
    makemouth();
    makeantennae();
  popMatrix();
  //noLoop();
}

void keyReleased() {
  //Flip on press
  if (key == 'f' || key == 'F') {
    if (flip) {
      flip = false;
    }
    else {
      flip = true;
    }
  }
}

void maketail() {
  //Tail wag
  pushMatrix();
    translate(3*dim/8,dim/2);
    rotate(-QUARTER_PI*biting/bitetime);
    translate(-3*dim/8,-dim/2);
    stroke(0);
    //Make the tail point
    noFill();
    strokeWeight(5);
    arc(dim-dim/8,3*dim/4+dim/32,dim/8,dim/8,PI+HALF_PI,TWO_PI);
    strokeWeight(1);
    //Add spike ball (square + rotated square)
    fill(0);
    rect(dim-dim/16,3*dim/4+dim/16, dim/16, dim/16);
    pushMatrix();
      translate(dim-dim/16,3*dim/4+dim/16);
      rotate(QUARTER_PI);
      rect(0,0, dim/16, dim/16);
    popMatrix();
    /* Dated version:
    triangle(dim-dim/8+dim/50, 3*dim/4+dim/16, dim-dim/50, 3*dim/4+dim/16,dim-dim/16,3*dim/4+dim/50);
    triangle(dim-dim/8+dim/50, 3*dim/4+dim/16, dim-dim/50, 3*dim/4+dim/16,dim-dim/16,3*dim/4+dim/8-dim/50);
    */
    //Make the tail length
    for (int i = 0; i < 12; i++) {
      for (int j = 0; j < .5*i; j++) {
        //Random color for each elipse
        fill(darkgreenchoose());
        ellipse(dim-i*dim/16-dim/8,3*dim/4-dim/32-i*dim/64-j*dim/32/1.5,dim/8,dim/8);
      }
      for (int j = i; j > .5*i; j--) {
        //Random color for each elipse
        fill(darkgreenchoose());
        ellipse(dim-i*dim/16-dim/8,3*dim/4-dim/32-i*dim/64-j*dim/32/1.5,dim/8,dim/8);
      }
    }
    //Center of tail length
    for (int i = 0; i < 12; i++) {
      int j = floor(.5*i);
      fill(darkgreenchoose());
      ellipse(dim-i*dim/16-dim/8,3*dim/4-dim/32-i*dim/64-j*dim/32/1.5,dim/8,dim/8);
    }
  popMatrix();
  /* Old tail
  for (int i = 0; i < 200; i++) {
    //Random color for each elipse
    fill(darkgreenchoose());
    //Limit elipses to dim/2 to dim and dim/2 to 3dim/4
    //Make triangle with limit k > .5*j+dim*.25
    int j = floor(random(3*dim/4)+dim/4-dim/8);
    int k = floor(random(dim/4)+dim/2);
    if (k >= .5*j+dim/4) {
      ellipse(j,k,dim/8,dim/8);
    }
  }
  */
}

void makefeet() {
  stroke(0);
  //Choose legs
  fill(midgreenchoose());
  ellipse(dim/8,3*dim/4,dim/8,dim/3);
  ellipse(3*dim/8,3*dim/4,dim/8,dim/3);
  //Choose feet
  fill(midgreenchoose());
  ellipse(dim/8,7*dim/8,dim/6,dim/10);
  ellipse(3*dim/8,7*dim/8,dim/6,dim/10);
  //Make toes
  fill(midgreenchoose());
  for (int i = 0; i < 3; i++) {
    ellipse(dim/8-dim/16+i*dim/16,15*dim/16,dim/10,dim/12);
    ellipse(3*dim/8-dim/16+i*dim/16,15*dim/16,dim/10,dim/12);
  }
} 

void makeface() {
  stroke(0);
  //New face equation.
  int jtimes = 20;
  pushMatrix();
    //Center of face
    translate(dim/4,dim/2);
    for (int i = 0; i <= 5; i++) {
      for (int j = 1; j <= jtimes; j++) {
      //Determine fixed position (no longer random)
      pushMatrix();
        //Circle around face
        rotate(HALF_PI+TWO_PI*j/jtimes);
        //Radiate inward
        translate(dim/4-dim*i/4/5,0);
        //Random color
        fill(greenchoose());
        ellipse(0,0,dim/8,dim/8);
      popMatrix();
      }
    }
  popMatrix();
  /* Old face equation
  for (int i = 0; i < 2000; i++) {
    //Random color for each elipse
    fill(greenchoose());
    //Limit elipses to 0 to dim/2 and dim/4 to 3dim/4
    //Make circular with limit x^2+y^2< (dim/4)^2
    //int j = floor(random(dim/2)+dim/16);
    //Let circles go off page.
    int j = floor(random(dim/2));
    int k = floor(random(dim/2)+dim/4);
    if (sq(j-dim/4)+sq(k-dim/2) <= sq(dim/4)) {
      ellipse(j,k,dim/8,dim/8);
    }
  }
  */
}

void makemouth() {
  stroke(0);
  //Green elipse face
  fill(greenchoose());
  ellipse(dim/4, dim/2, dim/3, dim/3);
  //black mouth square in center of face
  fill(0);
  //Adjust as mouth moves
  rect(dim/4, dim/2, dim/4, dim/8-dim*biting/16/bitetime);
  //red tongue
  fill(floor(random(128)+128),0,0);
  //Adjust as mouth moves.
  ellipse(dim/4,17*dim/32-dim*biting/32/bitetime,dim/8,dim/16);
  //white teeth
  fill(255);
  for (int i = 0; i < 4; i++) {
    //Tooth position adjusted by bite function
    triangle(dim/8+dim*i/16,9*dim/16-dim*biting/32/bitetime,3*dim/16+dim*i/16,9*dim/16-dim*biting/32/bitetime,5*dim/32+dim*i/16,dim/2-dim*biting/32/bitetime);
    triangle(dim/8+dim*i/16,7*dim/16+dim*biting/32/bitetime,3*dim/16+dim*i/16,7*dim/16+dim*biting/32/bitetime,5*dim/32+dim*i/16,dim/2+dim*biting/32/bitetime);
  }
  //Next step of bite function
  if (biting > 0) {
    biting++;
    //Reset when done
    if (biting > bitetime) {
      biting = 0;
    }
  }
}

void makeantennae() {
  //Makes a pair of black lines for eyebrows
  //centered around dim/8,dim/2-3dim/16 and 3dim/8,dim/2-3dim/16
  stroke(0);
  fill(0);
  strokeWeight(10);
  //Added in function to move antennae while biting
  line(dim/8-dim/12-dim*biting/12/bitetime,dim/2-3*dim/16-dim/12+dim*biting/12/bitetime,dim/8+dim/12,dim/2-3*dim/16+dim/12);
  line(3*dim/8-dim/12,dim/2-3*dim/16+dim/12,3*dim/8+dim/12+dim*biting/12/bitetime,dim/2-3*dim/16-dim/12+dim*biting/12/bitetime);
  strokeWeight(1);
}

color greenchoose() {
  return color(floor(random(128)),floor(random(128)+128),floor(random(128)));
}

color midgreenchoose() {
  return color(floor(random(96)),floor(random(96)+96),floor(random(96)));
}

color darkgreenchoose() {
  return color(floor(random(64)),floor(random(64)+64),floor(random(64)));
}

void chooseSeed() {
  seed = floor(random(1000000));
}
