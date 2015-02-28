
/**
 * The Owl and the Pussycat
 * Evangeline Garreau
 * March 23, 2010
 */

void setup() {
  size(605,600);
  smooth();
  noStroke();
  colorMode(HSB,360);
  noLoop();
}

void draw(){
  backdrop();
  words();
  storyLines(60,60,4,35,"The Owl and the Pussycat went to sea/In a beautiful pea-green boat/They took some honey, and pleanty of money,/Wrapped up in a five pound note./The Owl looked up to the stars above,/And sang to a small guitar,/'O lovely Pussy! O Pussy, my love,/What a beautiful Pussy you are, you are, you are,/What a beautiful Pussy you are.'/Pussy said to the Owl, 'You elegant fowl,/How charmingly sweet you sing./O let us be married, too long we have tarried;/But what shall we do for a ring?'");
}

void storyLines(int x, int y, int wide, int high, String story)  {
  if (story.length() > 0) {
    fill(11,270,90,65);
    int c = story.charAt(0);
    int changeX = 5;
    int changeY = 2;
    rect(x,y,wide,high);
    if (c <= 64) {
      storyLines(x+changeX, y+changeY, wide, high, story.substring(1));
    }
    if (c > 64 && c <= 96) {
      storyLines(x-changeX, y-changeY, wide, high, story.substring(1));
    }
    if (c > 96 && c <= 105) {
      storyLines(x, y+changeY, wide, high, story.substring(1));
    }
    if (c > 105 && c <= 114){
      storyLines(x+changeX, y, wide, high, story.substring(1));
    }
    if (c > 114) {
      storyLines(x-changeX, y, wide, high,story.substring(1));
    }
  } 
}

void backdrop() {
  background(220,329,334);
  stars(width, 350, 120, 65);
  moon(120,65,60);
  waves(320,120,-100,width,330,400,130);
  waves(350,150,-100,width,400,500,130);
  waves(350,150,-100,width,500,600,160);
  boat(540,540);
}

void wave(int x, int y, int wide, int high) {
  beginShape();
  curveVertex(x+30, y+high); //control 1
  curveVertex(x, y+high-10); //left point
  curveVertex(x+wide*.33, y); //top left curve
  curveVertex(x+wide*.66, y+high*.33); //top right curve
  curveVertex(x+wide, y+10); //right point
  curveVertex(x+wide*.66,y+high); //bottom right curve
  curveVertex(x+wide*.33,y+high*.66); //bottom left curve
  curveVertex(x, y+high-10); //left point
  curveVertex(x, y+high-30); //control 2
  endShape();
}

void waves(int wide, int high, int limitX1, int limitX2, int limitY1, int limitY2, int space) {
  fill(220,309,134,90);
  for(int i=limitX1; i<limitX2+wide; i+=space) {
    wave(i, int(random(limitY1, limitY2)), wide, high);
  }
}

void moon(int x,int y,int wide) {
  fill(58,65,353,200);
  ellipse(x,y,wide,wide);
}

void stars(int limitX, int limitY, int moonX, int moonY) {
  stroke(58,65,353,200);
  strokeWeight(5);
  for(int i=0;i<width;i+=8) {
    float rX = random(limitX);
    float rY = random(limitY);
    if(dist(moonX,moonY,rX,rY) > 30) { //check to make sure it's not inside the moon
      point(rX, rY);
    }
  }
  noStroke();
}

void boat(int x,int y) {
  strokeWeight(1);
  stroke(116,360,160);
  fill(116,360,230);
  beginShape();          //Hull
  curveVertex(x-25,y+10);
  curveVertex(x-25,y-5);
  curveVertex(x,y);
  curveVertex(x+25,y-5);
  curveVertex(x+9, y+20);
  curveVertex(x-9, y+20);  
  curveVertex(x-25,y-5);
  curveVertex(x-25,y-20);
  endShape();
  
  stroke(116,360,140);
  fill(116,360,190);
  rectMode(CORNERS);
  rect(x,y,x-3,y-40);  //Mast
  rectMode(CENTER);

  triangle(x,y-5, x+28,y-10, x,y-40); //Sail  
  noStroke();
}

void words() {
  PFont t;
  t = loadFont("PlantagenetCherokee-48.vlw");
  textFont(t);
  fill(360,37);
  text("The Owl and the Pussycat w", 0,35);
  text("ent to sea in a beautiful pea-",0,70);
  text("green boat. They took some",0,105);
  text("honey, and plenty of money,",0,140);
  text("wrapped up in a five-pound", 0,175);
  text("note. The Owl looked up to t",0,210);
  text("he stars above, and sang to a",0,245);
  text("small guitar, 'Oh lovely Puss",0,280);
  text("y, oh Pussy my love, what a",0,315);
  text("beautiful Pussy you are, you",0,350);
  text("are, you are, what a beautifu",0,385);
  text("l Pussy you are.' Pussy said t",0,420);
  text("o the Owl, 'You elegant fowl,",0,455);
  text("how charmingly sweet you",0,490);
  text("sing. Oh let us be married, t",0,525);
  text("oo long we have tarried; but",0,560);
  text("what shall we do for a ring?'",0,595);
}

