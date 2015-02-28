
int card = 0;
PImage people,detailface,tear,knife;
PFont Text;

void setup() {
  size(600, 600);
   Text = loadFont("Impact-78.vlw");
   textFont(Text);
}

void draw() {

  if (card == 0) {
    background(255);
    noStroke();
    fill(67,41,64);
    ellipse(300,460,250,30);
    cardOne();
  }  
  else if (card == 1) {
    cardTwo();
  } 
  else if (card  == 2) {
    cardThree() ;
  }
  else if (card  == 3) {
    cardFour();
  }
  else if (card  == 4) {
    cardFive();
  } 
  else if (card  == 5) {
    cardSix();
  } 
  else if (card  == 6) {
    fill(255);
    rect(0,0,600,600);
  }
}

void mousePressed() {  

  if (card == 0) {  
    card = 1;
  } 
  else if (card == 1) {  
    card = 2;
  }
  else if (card == 2) {
    card = 3;
  }
  else if (card == 3) {
    card = 4;
  }  
  else if (card == 4) {
    card = 5;
  }  
  else if (card == 5) {
    card = 6;
  } 
  else if (card == 6) {
    card = 0;
  }
}



void cardOne() {
  pig(0,0,1,1,200,280,300);
}
void cardTwo() {  
  background(255);
  noStroke();
  fill(67,41,64);
  ellipse(300,460,250,30);
  pig(0,0,1,20,200,280,320);
  people = loadImage("people.png");
  tint(29,37,89,50);
  image(people,100,300,400,600);
}
void cardThree() {  
  background(255);
  noStroke();
  fill(67,41,64);
  ellipse(300,460,250,30);
  pig(0,0,1,20,190,290,310);
  people = loadImage("people.png");
  tint(29,37,89,90);
  image(people,50,0,500,700);
  text("?",410,200);
}
void cardFour() {  
  background(255);
  noStroke();
  fill(67,41,64);
  ellipse(300,460,250,30);
  pig(0,0,1,20,190,275,325);
  people = loadImage("people.png");
  tint(29,37,89,100);
  image(people,50,0,500,700);
  knife = loadImage("knife.png");
  tint(29,37,89,100);
  image(knife,465,350,150,150);
  text("!",410,200);
}
void cardFive() {  
  pig(-750,-400,3.5,20,200,280,320);
  detailface= loadImage("detailface.png");
  noTint();
  image(detailface,0,2,600,600);  
  noStroke();
  fill(255);
  ellipse(262,197,10,10);
  ellipse(258,205,5,5);
  ellipse(342,197,10,10);
  ellipse(338,205,5,5);
}
void cardSix() {  
  
  pig(-750,-400,3.5,20,200,280,320);
  detailface= loadImage("detailface.png");
  noTint();
  image(detailface,0,2,600,600);
  
  noStroke();
  fill(255);
  ellipse(262,197,10,10);
  ellipse(258,205,5,5);
  ellipse(342,197,10,10);
  ellipse(338,205,5,5);
  tear= loadImage("tear.png");
  image(tear,247,205,9,9);
  image(tear,345,205,9,9);
  
}



//pig 
void pig(int x,int y, float s,int Eye,int Eyepositstion, int mouse1,int mouse2) {

  translate(x,y);
  scale(s);

  smooth();
  noStroke();
  //body
  fill(137,105,86);
  triangle(185,440,205,440,195,455);
  triangle(225,440,205,440,215,455);
  triangle(365,440,385,440,375,455);
  triangle(225,440,205,440,215,455);
  triangle(405,440,385,440,395,455);
  fill(205,158,130);
  quad(165,340,225,370,225,440,185,440);
  quad(435,340,375,370,365,440,405,440);
  fill(172,132,110);
  triangle(200,450,220,450,210,465);
  triangle(240,450,220,450,230,465);
  triangle(350,450,370,450,360,465);
  triangle(390,450,370,450,380,465);
  fill(228,174,143);
  ellipse(300,280,300,300);
  quad(180,350,240,380,240,450,200,450);
  quad(420,350,350,350,350,450,390,450);
  fill(255);
  rect(296,130,4,15);
  //ear1
  fill(251,191,157);
  rect(205,160,100,100);
  rect(295,160,100,100);
  //ear2
  fill(228,174,143);
  rect(214,169,90,90);
  rect(296,169,90,90);
  //face
  fill(251,191,157);
  ellipse(300,250,200,200);
  fill(0);
  ellipse(260,Eyepositstion,20,Eye);
  ellipse(340,Eyepositstion,20,Eye);
  fill(254,211,164);
  ellipse(300,250,85,55);
  fill(255,222,176);
  ellipse(300,250,70,50);
  fill(66,45,33);
  ellipse(280,250,9,25);
  ellipse(320,250,9,25);
  stroke(66,45,33);
  strokeWeight(5);
  line(mouse1,295,mouse2,295);
}




