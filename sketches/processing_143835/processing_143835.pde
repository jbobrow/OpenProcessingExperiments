
PImage img, mask, world, colormap, numbermap, left, right, up, down;
PFont fuente, font;

float x, xDestino;
int page;
boolean on = true;
boolean over;

void setup() {
  size(600, 600);
  //Fuller
  img = loadImage("Buckminister-Fuller.jpg");
  mask = loadImage("circle.png");
  font = loadFont("LevenimMT-20.vlw");

  //World map
  world = loadImage("peacemap.jpg");
  colormap = loadImage("colormap.png");
  numbermap = loadImage("numbermap.png");
  fuente = loadFont("Hero-14.vlw");
  left = loadImage("left.png");
  right = loadImage("right.png");
  down = loadImage("down.png");
  up = loadImage("up.png");
}
void draw() {
  fill(50);
  noStroke();
  rect(0, 0, width, height);
  if (page == 0) {
    pageZero();
  }
  if (page == 1) {
    pageOne();
  }
  if (page == 2) {
    pageTwo();
  }
  if (page == 3) {
    pageThree();
  }
  if (page == 4) {
    pageFour();
  }
  if (page == 5) {
    pageFive();
  }
}

void mouseReleased() {
  page = page + 1;
  if (page > 5) {
    page = 0;
  }
  if (page == 1) {
    if (mouseX > 550 && mouseX < 590 && mouseY > 550 && mouseY < 590) {
      over = true;
    }
    else {
      over = false;
    }
  }
}

void pageZero() {
  background(255);
  textFont(fuente);
  fill(50);
  text("Learning about maps and games", width/4, height/2);
}

void pageOne() {

  fill(50);
  rect(0, 0, width, height);
  fill(255);
  textFont(font);
  text("Who is the man behind the canvas?", width/4, height/2);
  imageMode(CENTER);
  PImage frag = img.get(mouseX, mouseY, 50, 50);
  frag.mask(mask);
  if (1 > 0.9) {
    image(frag, mouseX, mouseY);
  }
}

void pageTwo() {
  background(50);
  textFont(font);
  fill(255);
  text("Follow the numbers in order to know the information behind one another until the end.", width/4, height/3, 300, 100);
}
void pageThree() {
  imageMode(CENTER);
  image(world, width/2, height/2);
  image(numbermap, width/2, height/2);
  color c = colormap.get(mouseX, mouseY);
  fill(c);
  noStroke();
  ellipse(mouseX, mouseY, 10, 10);
  fill(0);
  ellipse(mouseX, mouseY, 3, 3);

  //for number 1
  if (c == color(255, 0, 0)) {
    fill(255);
    rect(mouseX-5, mouseY-10, 205, 120);
    textFont(fuente);
    fill(0);
    text ("This is the World Game.  The World Game was created by R. Buckminster Fuller, the eminent geometer, architect and thinker, as a creative alternative to war games.", mouseX, mouseY, 200, 400);
  }
  //for number 2
  if (c == color(255, 84, 0)) {
    fill(255);
    rect(mouseX-5, mouseY-10, 205, 120);
    textFont(fuente);
    fill(0);
    text ("To make the World work for 100% of Humanity in the shortest possible time. Through spontaneous cooperation without ecological offense or the disadvantage of anyone.", mouseX, mouseY, 200, 400);
  }
  //for number 3
  if (c == color(255, 216, 0)) {
    fill(255);
    rect(mouseX-5, mouseY-10, 205, 80);
    textFont(fuente);
    fill(0);
    text ("Buckminster Fuller initiated the World Game in 1969 as one means of accomplishing this worthy goal.", mouseX, mouseY, 200, 400);
  }
  //for number 4
  if (c == color(150, 255, 0)) {
    fill(255);
    rect(mouseX-5, mouseY-10, 205, 120);
    textFont(fuente);
    fill(0);
    text ("The idea is that with enough data on world resources and their distribution (including accumulated technology and problem-solving skills), the world's citizens will do what's best for all.", mouseX, mouseY, 200, 400);
  }
  //for number 5
  if (c == color(0, 255, 144)) {
    fill(255);
    rect(mouseX-5, mouseY-10, 205, 160);
    textFont(fuente);
    fill(0);
    text ("Fuller assumed that once it was obvious that there was enough of everything to go around, people would stop fighting wars and get to work making the world work -- if not as a utopia at least not continuing the current suicidal path.", mouseX, mouseY, 200, 400);
  }
  //for number 6
  if (c == color(0, 255, 252)) {
    fill(255);
    rect(mouseX-5, mouseY-10, 205, 150);
    textFont(fuente);
    fill(0);
    text ("Then the World Game Insitute was developed. World Game Institute is a non-profit, non-partisan, global education and research organization dedicated to developing and disseminating problem solving and educational tools.", mouseX, mouseY, 200, 400);
  }
  //for number 7
  if (c == color(0, 210, 255)) {
    fill(255);
    rect(mouseX-5, mouseY-10, 205, 200);
    textFont(fuente);
    fill(0);
    text ("World Game is still developing. Recent sessions use an enormous basketball-court-size map in order to more easily visualize various strategies as they are suggested by participants. A formidable software database called Global Data Manager allows individuals to play with the numbers on their PCs.", mouseX, mouseY, 200, 400);
  }
  //for number 8
  if (c == color(0, 144, 255)) {
    fill(255);
    rect(mouseX-5, mouseY-10, 205, 80);
    textFont(fuente);
    fill(0);
    text ("Buckminster Fuller initiated the World Game in 1969 as one means of accomplishing this worthy goal.", mouseX, mouseY, 200, 400);
  }
  //for number 9
  if (c == color(0, 90, 255)) {
    fill(255);
    rect(mouseX-5, mouseY-10, 205, 150);
    textFont(fuente);
    fill(0);
    text ("Some of the World Game Institutes games are for example questions like: ''Did you know that some scientists have determined that the air could cleanse itself of all pollutants in TWO WEEKS if polluting stopped for that period of time?''", mouseX, mouseY, 200, 400);
  }
  //for number 10
  if (c == color(24, 0, 255)) {
    fill(255);
    rect(mouseX-5, mouseY-10, 205, 200);
    textFont(fuente);
    fill(0);
    text ("Briefly, The World Game is a three hour experience including a 1 1/2 hour trading simulation game played on a dymaxion projection of the Earth. Lots of slides and music is used to make it entertaining as well as educational. Fuller's intent was to design a game that would be an alternative to war games.", mouseX, mouseY, 200, 400);
  }
  //for number 11
  if (c == color(90, 0, 255)) {
    fill(255);
    rect(mouseX-5, mouseY-10, 205, 170);
    textFont(fuente);
    fill(0);
    text ("Although the game content deals with many issues besides the environment such as hunger, nuclear proliferation, and education, the ideas of cooperation and coordination are pervasive and based on up-to-the-moment data on all of the issues.", mouseX, mouseY, 200, 400);
  }
  //for number 12
  if (c == color(150, 0, 255)) {
    fill(255);
    rect(mouseX-5, mouseY-10, 205, 380);
    textFont(fuente);
    fill(0);
    text ("If information is power, Global Data Manager is a powerful tool. Its intended purpose is to make accessible the vast amounts of statistical data upon which all fundamental resource allocation decisions in the world are made... Global Data Manager makes available for the first time, in an easy to use personal data computer format, the vital statistics of the world. Its purpose is to integrate into one system the world's most complete inventory of global data into an easy to use, personal computer based, problem analysis and solving system that is accessible to the researcher, policy maker, social activist, student, teacher, media and general public", mouseX, mouseY, 200, 400);
  }
  //for number 13
  if (c == color(222, 0, 255)) {
    fill(255);
    rect(mouseX-5, mouseY-10, 205, 210);
    textFont(fuente);
    fill(0);
    text ("The World Game offers a solution to the world hunger problem, for example the Ho-Ping: Food for everytone game (by Medard Gabel) addresses the World's Food supply/distribution problems from a holistic, comprehensive, design science, approach.  That is, by considering the entire planet, and 100% of humanity and all its study.", mouseX, mouseY, 200, 400);
  }
  //for number 14
  if (c == color(255, 0, 186)) {
    fill(255);
    rect(mouseX-5, mouseY-10, 205, 170);
    textFont(fuente);
    fill(0);
    text ("Fuller based his World Game on the dymaxion map.  He wanted to employ an undistorted map in his efforts to coordinate people’s needs with existing resources, and although the Dymaxion Map is a worthy addition to the history of cartography, it is not a map free of distortion.", mouseX, mouseY, 200, 400);
  }
  //for number 15
  if (c == color(255, 0, 66)) {
    fill(255);
    rect(mouseX-5, mouseY-10, 205, 140);
    textFont(fuente);
    fill(0);
    text ("All flat maps of curved surfaces are distorted.  The Dymaxion Map distorts in a novel way, but it still distorts.  Fuller claims that the Dymaxion Map was described as “pure invention” by “several great experts.”", mouseX, mouseY, 200, 400);
  }
  //for number 16
  if (c == color(243, 132, 132)) {
    fill(255);
    rect(mouseX-5, mouseY-10, 205, 100);
    textFont(fuente);
    fill(0);
    text ("For the purposes of navigation it is important to have maps or charts on flat or plane sheets which fulfill three mathematical conditions.", mouseX, mouseY, 200, 400);
  }
  //for number 17
  if (c == color(243, 132, 187)) {
    fill(255);
    rect(mouseX-5, mouseY-10, 205, 300);
    textFont(fuente);
    fill(0);
    text ("First, the construction should be such that it will be convenient to draw on the map the course of the shortest sea-level line between any two points, and to ascertain the latitude and longitude at any intermediate point of the course. Such a line is commonly known as the arc of a great circle and would be if the earth were a true sphere but is in, fact a line to be otherwise defined since the earth approximates closely to a spheroid or ellipsoid of revolution, and will be termed a geodesic line.", mouseX, mouseY, 200, 400);
  }
  //for number 18
  if (c == color(223, 132, 243)) {
    fill(255);
    rect(mouseX-5, mouseY-10, 205, 90);
    textFont(fuente);
    fill(0);
    text ("Second, it should be convenient to ascertain the angle at which any geodesic line crosses any intermediate meridian.", mouseX, mouseY, 200, 400);
  }
  //for number 19
  if (c == color(171, 132, 243)) {
    fill(255);
    rect(mouseX-5, mouseY-10, 205, 120);
    textFont(fuente);
    fill(0);
    text ("The Dymaxion Map is resolved into six equilateral square sections and eight equilateral triangular sections.  This flat map shows the world in many perspectives.", mouseX, mouseY, 200, 400);
  }
  //for number 20
  if (c == color(132, 148, 243)) {
    fill(255);
    rect(mouseX-5, mouseY-10, 205, 120);
    textFont(fuente);
    fill(0);
    text ("The Dymaxion map or Fuller map is a projection of a world map onto the surface of an icosahedron, which can be unfolded and flattened to two dimensions. The flat map is heavily interrupted in order to preserve shapes and sizes.", mouseX, mouseY, 200, 400);
  }
  //for number 21
  if (c == color(132, 231, 243)) {
    fill(255);
    rect(mouseX-5, mouseY-10, 205, 120);
    textFont(fuente);
    fill(0);
    text ("The World Game was also known or called the World Peace Game.  It was an alternative to war games uses Fuller's Dymaxion map and requires a group of players to cooperatively solve a set of metaphorical scenarios, thus challenging the dominant nation-state perspective with a more wholistic total world view. ", mouseX, mouseY, 200, 400);
  }
  //for number 22
  if (c == color(132, 243, 182)) {
    fill(255);
    rect(mouseX-5, mouseY-10, 205, 120);
    textFont(fuente);
    fill(0);
    text ("Fuller first publicly proposed the concept as the core curriculum at the (then new) Southern Illinois University Edwardsville. He proposed it again in 1964 for the 1967 International and Universal Exposition in Montreal, Quebec.", mouseX, mouseY, 200, 400);
  }
  //for number 23
  if (c == color(239, 243, 132)) {
    fill(255);
    rect(mouseX-5, mouseY-10, 205, 120);
    textFont(fuente);
    fill(0);
    text ("In a preamble to World Game documents released in 1970, Fuller identified it very closely with his 'Guinea Pig 'B' experiment' and his 'Comprehensive Anticipatory Design Science' lifework. He claimed intellectual property rights as well to control what he considered to be misapplication of his idea by others. He also claimed he had been playing it 'longhand' without the assistance of computers since 1927.", mouseX, mouseY, 200, 400);
  }
}

void pageFour() {
  fill (50);
  noStroke();
  rect(0, 0, width, height);
  fill(255);
  textFont(font);
  text("Thank you very much", width/4, height/2);
}

void pageFive() {
  fill (50);
  noStroke();
  rect(0, 0, width, height);
  fill(255);
  textAlign(CENTER);
  textFont(font);
  text("Andrea Torres Spatial Art Workshop", x, height/2, 200, 100);
  x = x + (xDestino-x)*0.01;
  xDestino = mouseX;
  if (keyPressed) {
    pushMatrix();
    translate(mouseX, mouseY);
    rotate(mouseX);
    text("A", 50, 50);
    popMatrix();
  }
}



