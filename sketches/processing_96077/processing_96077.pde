

void setup() {
  size(600, 600);
  //frameRate(10);
}

void draw() {

  int x=mouseX;
  int y=mouseY;

  background(140, 218, 252);
  stroke(0);
  strokeWeight(5);

  //amagar el cursor
  noCursor();

  //Figura
  //cap
  noStroke();
  fill(255, 0, 0);
  ellipse(x, y-70, 150, 115);
  fill(255);
  ellipse(x-60, y-70, 40, 115/2);
  ellipse(x+60, y-70, 40, 115/2);

  //outline barret
  noFill();
  stroke(5);
  ellipse(x, y-70, 155, 120);

  //cos
  fill(255);
  ellipse(x, y, 80, 40);
  //outline cos 2
  noFill();
  stroke(5);
  ellipse(x, y, 80, 40);
  //C1
  fill(255);
  rect(x-40, y-40, 80, 40);

  //ulls
  fill(0);
  ellipse(x+15, y-20, 6, 20);
  ellipse(x-15, y-20, 6, 20);


  //cap2
  noStroke();
  fill(255);
  ellipse(x, y-60, 50, 50);



  //outline cos 1
  noFill();
  stroke(5);
  rect(x-40, y-40, 80, 40);

  //Linia de "borrar"
  stroke(255);
  line(x-35, y, x+35, y);

  //Text
  //PFont font;
  //font = loadFont("LetterGothicStd-32.vlw");
  textSize(32);
  //Canviant de posició les x i y en les tres posicions de RGB obtenim games canviants de colors diferents, aquesta consta de negres, blancs, vermells i blaus a joc amb els colors principals
  fill(x+0, y+0, y+0);
  text("POWER UP!", x-80, y+100);
}



