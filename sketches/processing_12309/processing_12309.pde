
//Assignment#2
//Name:Mengyu Liu
//E-mail: mliu01@brynmawr.edu 
// Date: Sept.16,2010

void setup() {
  size(800,600);
  smooth();
}
void draw() {
  background(60,93,219);
  if(mousePressed) {

    //rainbow
    noFill();
    stroke(255,0,0);
    strokeWeight(8);
    arc(510,670,1000,1000,13*PI/12,39*PI/20);
    stroke(255,135,5);
    arc(510,670,990,990,13*PI/12,39*PI/20);
    stroke(255,243,5);
    arc(510,670,980,980,13*PI/12,39*PI/20);
    stroke(22,219,46);
    arc(510,670,970,970,13*PI/12,39*PI/20);
    stroke(35,19,232);
    arc(510,670,960,960,13*PI/12,39*PI/20);
    stroke(135,77,245);
    arc(510,670,950,950,13*PI/12,39*PI/20);
    stroke(69,13,85);
    arc(510,670,940,940,13*PI/12,39*PI/20);
    //sun
    float n;
    n = 100;
    while (n>70) {
      stroke(236,240,53);
      fill(250,243,103);
      ellipse(100,100,n,n);
      n = n - 10;
    }
  }
  else {
    //snow
    frameRate(5);
    noStroke();
    fill(247,240,243,50);
    ellipse(random(width),random(height),10,10);
    //snowman head and body   
    noStroke();
    fill(255);
    ellipse(600,430,70,70);
    ellipse(600,500,110,120);
    //snowman eyes
    noStroke();
    fill(0);
    ellipse(590,420,10,10);
    ellipse(610,420,10,10);
    //snowman nose  
    noStroke();
    fill(247,106,17);
    triangle(600,430,600,445,630,430);
  }
  //land
  noStroke();
  fill(245,247,247);

  arc (400,800,1500,500,PI,2*PI);
  fill(245,247,247,150);
  arc (100,800,800,600,PI,2*PI);
  //christmas trees 
  stroke(0);
  strokeWeight(1);
  fill(20,131,47);
  beginShape() ;
  vertex(195,460);
  vertex(165,470);
  vertex(185,470);
  vertex(155,480);
  vertex(185,480);
  vertex(145,490);
  vertex(185,490);
  vertex(135,500);
  vertex(185,500);
  vertex(185,520);
  vertex(205,520);
  vertex(205,500);
  vertex(255,500);
  vertex(205,490);
  vertex(245,490);
  vertex(205,480);
  vertex(225,480);
  vertex(205,470);
  vertex(225,470);
  vertex(195,460);
  endShape(CLOSE);


  stroke(0);
  fill(20,131,47);
  beginShape() ;
  vertex(75,470);
  vertex(45,480);
  vertex(65,480);
  vertex(35,490);
  vertex(65,490);
  vertex(25,500);
  vertex(65,500);
  vertex(15,510);
  vertex(65,510);
  vertex(65,520);
  vertex(85,520);
  vertex(85,510);
  vertex(135,510);
  vertex(85,500);
  vertex(125,500);
  vertex(85,490);
  vertex(105,490);
  vertex(85,480);
  vertex(105,480);
  vertex(75,470);
  endShape(CLOSE);



  stroke(0);
  fill(20,131,47);
  beginShape() ;
  vertex(395,320);
  vertex(350,370);
  vertex(380,370);
  vertex(325,420);
  vertex(380,420);
  vertex(300,470);
  vertex(380,470);
  vertex(275,520);
  vertex(380,520);
  vertex(380,560);
  vertex(410,560);
  vertex(410,520);
  vertex(515,520);
  vertex(410,470);
  vertex(490,470);
  vertex(410,420);
  vertex(465,420);
  vertex(410,370);
  vertex(440,370);
  vertex(395,320);
  endShape(CLOSE);
}


