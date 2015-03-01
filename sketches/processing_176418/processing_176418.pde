
/* @pjs preload="vinyl.png" ; font = "Pacifico.ttf" ; */

int[] data ;
PImage vinyl ;
PFont pacifico ;

void setup() {
  size(500, 350) ;
  vinyl = loadImage("vinyl.png") ;
  pacifico = createFont("Pacifico.ttf", 40) ;
  String[] stuff = loadStrings("vinylsales.txt") ;
  println(stuff) ;

  data = int(split(stuff[0], ',')) ;
  noLoop() ;
}

void draw() {
  background(#3278ED) ;
  stroke(0) ;

  for (int i = 0; i < data.length; i++) {
    //fill(random(255), random(255), random(255)) ;
    image(vinyl, i*55, 0, 50, data[i]*3) ;
    // image(vinyl, 0, 0, width, height) ;
  }

  textFont(pacifico, 40) ;
  textAlign(CENTER) ;
  text("Vinyl sales from 2004-2012", 250, 250) ;
  text("[in millions]", 250, 300) ;

  //boxes around text
  fill(#CE323F) ;
  rect(3, 137, 54, 22, 7);
  rect(54, 114, 53, 23, 7);
  rect(108, 80, 53, 23, 7);
  rect(163, 77, 54, 23, 7);
  rect(218, 56, 54, 23, 7);
  rect(275, 12, 54, 23, 7);
  rect(329, 34, 54, 23, 7);
  rect(382, 34, 54, 23, 7);
  rect(438, 40, 54, 23, 7);

  //labels for years
  fill(255) ;
  textSize(27) ;
  text("2012", 30, 155) ; 
  text("2011", 80, 133) ; 
  text("2010", 135, 100) ;
  text("2009", 190, 95) ;
  text("2008", 245, 75) ;
  text("2007", 300, 30) ;
  text("2006", 355, 53) ;
  text("2005", 410, 53) ;
  text("2004", 465, 60) ;

  //data amounts
  textSize(22) ;
  text("46", 28, 178) ;
  text("39", 79, 155) ;
  text("28", 132, 122) ;
  text("25", 189, 119) ;
  text("18", 242, 100) ;
  text("1", 299, 54) ;
  text("9", 354, 80) ;
  text("9", 410, 80) ;
  text("12", 462, 89) ;
}



