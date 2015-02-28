
void setup () {
  size (400, 400);
  background (155, 0, 0);
}


void draw() {
  for (int j=10; j<width-50; j+=30) {//j influences space from margin,j+= number of items/spacing-larger # less items
    for (int i=-60; i<height-5; i+=52) {//i=spacing from margin, i+= larger number less items
      myhand (j, i);
      fill (255, 255, 255, 50);//transparency set
    }
  }
  noLoop();
  
}

void myhand(float j, float i) {//points can start independently from previous points
  pushMatrix();
  translate(j, i);

  noStroke();
  fill (random(0));
  smooth ();//smooths pixalation


  stroke (188, 198, 224);

  quad (13, 94, 10, 88, 28, 88, 22, random(95)+50);//palm--+/- sends abstration up or down in direction
  quad (9, 82, 11, 81, 10, 88, 12, 88);//finger 1
  quad (13, 80, 16, 79, 15, 88, 13, 88);//finger 2
  quad (17, 88, 21, 78, 20, 88, 18, 88);//finger3
  quad (28, 79, 30, 82, 18, 90, 19, 88);//finger 4
  quad (21, 95, 27, 88, 30, 85, 31, 88);//finger 5
  quad (15, 103, random(13), 95, 22, 95, random(21), 103);//wrist-random element creates abstraction

  noStroke();

  rect (-10, 10, width, 10);

  fill (149, 155, 0, 50);
  rect (-10, 15, width, 15);

  stroke (255, 255, 255);
  line (-10, 4, 300, 4);  

  popMatrix();
}

//During this past week I have been looking into the patterns that are being
//used by indegenous Colombian tapestries. These patterns are rich with
//geometry and color that a reminiscent of architectural design.
//The image of a simple hand bordered with lines and bands of dark rich colors.
//http://innonthealameda.com/the-authentic-guide-to-santa-fe/wp-content/uploads/2010/03/osage-blanket_crop.jpg








