
int numCats = 38;
PImage [] cats = new PImage[numCats];
int across = 10;
int down = 10;

void setup(){
  size(800, 800);
  background(225);
  smooth();
  strokeJoin(ROUND);
  for (int i = 0; i < cats.length; i++){
    String name = "cat_" + (i + 1) + ".jpg";
    cats[i] = loadImage(name);
  }
  frameRate(3);
}

void draw (){
  for (int i = 100; i < width - 100; i+= 75){
      for (int j = 25; j < height - 100; j+= 75){
        image(cats[int(random(1,numCats))], i, j, 75, 75);
      }
  }



  strokeWeight(15);
  stroke(255);
  line(width/2 - 75, height/2 + 20, 50, height/2 );
  line(width/2 - 75, height/2 + 70, 50, height/2 + 70 );
  line(width/2 - 75, height/2 + 120, 50, height/2 + 150);
  line(width/2 + 75, height/2 + 20, width - 50, height/2 );
  line(width/2 + 75, height/2 + 70, width - 50, height/2 + 70 );
  line(width/2 + 75, height/2 + 120, width - 50, height/2 + 150);
  
  strokeWeight(25);
  noFill();
  arc(width/2, height/2 + 50, 25, 50, PI, TWO_PI);
  
  arc(width/2 - 150, height/2 - 100, 150, 150, PI, TWO_PI);
  arc(width/2 + 150, height/2 - 100, 150, 150, PI, TWO_PI);
  
  stroke(225);
  strokeWeight(1);
  fill(225);
  triangle(100, 25, 100, 175, 250, 25);
  triangle(700, 25, 700, 175, 550, 25);
  triangle(550, 25, 475, 25, 475, 100);
  triangle(250, 25, 325, 25, 325, 100);
  
  rect(325, 25, 150, 75);
  
}

