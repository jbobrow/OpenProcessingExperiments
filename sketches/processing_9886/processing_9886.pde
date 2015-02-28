
Boolean play = false; //default set up as false
int radius = 3; 
int radiusLimit = 8; // limite the radius till 8 and go back to start radius

void setup() {
  size(450,450);
  background(185,159,136);
  smooth();
  frameRate(15); //15 frames per sec
}

void draw() {
  background(185,159,136);//refresh
  if (play) { //whenever mouse pressed play the ellipse randomly move around with set up radius
    for(int i=0; i < 20; i++) {
      float rX = random(450);
      float rY = random(0, 450);
      fill(255);
      ellipse(rX, rY, radius, radius);
    } 
  }

  // all the drawings
  //rectangle on top
  fill(0);
  rect(175,0,103,115);

  //left rectangle
  fill(0);
  rect(68,111,106,106);

  //right rectangle
  fill(0);
  rect(280,111,106,106);

  //middle rectangle
  fill(255);
  noStroke();
  rect(173,111,106,225);

  //left triangle
  smooth();
  fill(20,18,18);
  triangle(68,217,173,217,173,338);

  //right triangle
  smooth();
  fill(20,18,18);
  triangle(280,217,387,217,280,339);

  //middle triangle
  smooth();
  fill(255);
  triangle(174,336,280,336,174,450);

  //blue triangle on the left
  smooth();
  fill(44,62,109);
  triangle(67,450,173,450,173,336);


  //green middle triangle
  smooth();
  fill(38,105,76);
  triangle(174,450,280,450,280,338);

  //red right bottom rectangle
  smooth();
  fill(212,41,45);
  rect(280,338,112,112);

  //forhead
  smooth();
  fill(96,58,97);
  rect(173,110,107,53);

  //check
  smooth();
  fill(220,112,134);
  rect(173,198,107,26);

  //eyes
  smooth();
  fill(212,41,45);
  ellipse(187,180,20,20);
  ellipse(265,180,20,20);

  //mouse
  smooth();
  if(mousePressed) {
    fill(162,26,30);
    ellipse(226,285,19,5);
    fill(212,41,45);
    ellipse(226,280,24,10); 

  }
  else {
    fill(162,26,30);
    ellipse(226,285,15,15);
    fill(212,41,45);
    ellipse(226,294,20,20);
  }
  //wink eyes2
  if(mousePressed) { //if mouse pressed show the pupills and the pupills made with two arcs
    smooth();  //left pupill set up
    fill(0);
    arc(188,181,15,15,PI,TWO_PI-PI/2);
    arc(187,181,15,15,TWO_PI-PI/2,TWO_PI);

    smooth();  //right pulill set up
    fill(0);
    arc(266,181,15,15,PI,TWO_PI-PI/2);
    arc(265,181,15,15,TWO_PI-PI/2,TWO_PI);
  } 
}

void mousePressed() {
  play = true;  //play when mouse pressed with radius 5 else graduate the radius
  if(radius >= radiusLimit) {
    radius = 5;
  } 
  else {
    radius += 5;
  }
}

void mouseReleased() {
  play = false;   // as set up default as false dont play when mouse released
}

//circle on top
void mouseMoved() {  //whenever mouse moved show the ellipse on top
  smooth();
  noStroke();
  fill(76,161,184);
  ellipse(336,55,93,93);
}

 //how to save
void keyPressed() {
if(key == 'c' || key == 'C') {
  save("Hanamoon_animate.png");
}
}





