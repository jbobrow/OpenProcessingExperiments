
PFont font1; 

void setup() {
  size(1000,600);
  background(255); 
  smooth();
  noStroke();

  font1 = loadFont ("Helvetica-48.vlw"); 

  fill(0,150); 
  rect(180,300,600, 5); 
  rect(180,280,5,40);
  rect(330,280,5,40);
  rect(480,280,5,40);
  rect(630,280,5,40);
  rect(780,280,5,40);

  fill(229,0,0);
  ellipse(30,30,30,30);

  fill(28,180,18); 
  ellipse(30,80,30,30);

  fill(65,81,214); 
  ellipse(30,130,30,30);

 
}

void draw() {
  smooth(); 
  fill(0,150); 
  textFont(font1,15); 
  text("The New York Times, USA", 50, 30); 
  text("The Guardian, UK", 50,80); 
  text("Le Monde, France", 50, 130); 
 

  text("1980",180,340); 
  text("1990",330,340);
  text("2000",480,340);
  text("2010",630,340);
  text("2020",780,340);

  textFont(font1,30);
  text("Media Coverage of the Conflict in Western Sahara", 150, 500);


  if ((mouseX<60)&&(mouseX>0)&&(mouseY<60)&&(mouseY>0)&&(mousePressed)) {
    fill(229,0,0,80);
    ellipse(200,280,9,9);
    ellipse(215,280,4,4); 
    ellipse(230,280,10,10); 
    ellipse(245,280,13,13); 
    ellipse(275,280,2,2); 
    ellipse(290,280,13,13);
    ellipse(305,280,4,4); 
    ellipse(320,280,1,1); 
    ellipse(335,280,7,7); 
    ellipse(355,280,5,5); 
    ellipse(400,280,7,7); 
    ellipse(430,280,4,4); 
    ellipse(460,280,1,1); 
    ellipse(490,280,2,2);
    ellipse(505,280,2,2);
    ellipse(520,280,1,1); 
    ellipse(565,280,3,3); 
    ellipse(580,280,2,2); 
    ellipse(610,280,2,2); 
    ellipse(624,280,2,2);
  }

  if ((mouseX<60)&&(mouseX>0)&&(mouseY<120)&&(mouseY>60)&&(mousePressed)) {
    fill(28,180,18,80);
     
    ellipse(430,310,3,3); 
    ellipse(460,310,2,2); 
    ellipse(475,310,2,2);
    ellipse(520,310,2,2); 
    ellipse(535,310,4,4);
    ellipse(550,310,2,2);
    ellipse(565,310,4,4); 
    ellipse(580,310,6,6); 
    ellipse(610,310,8,8); 
    ellipse(624,310,4,4);
  }
  
    if ((mouseX<60)&&(mouseX>0)&&(mouseY<180)&&(mouseY>120)&&(mousePressed)) {
    fill(65,81,214,80);
     
    ellipse(275,295,11,11); 
    ellipse(290,295,26,26);
    ellipse(305,295,16,16); 
    ellipse(320,295,13,13); 
    ellipse(335,295,22,22); 
    ellipse(350,295,13,13); 
    ellipse(365,295,13,13); 
    ellipse(380,295,9,9); 
    ellipse(395,295,3,3); 
    ellipse(410,295,4,4);
    ellipse(425,295,3,3);
    ellipse(440,295,8,8); 
    ellipse(445,295,14,14); 
    ellipse(460,295,8,8); 
    ellipse(475,295,6,6); 
    ellipse(490,295,24,24);
    ellipse(505,295,19,19); 
    ellipse(520,295,18,18);
    ellipse(535,295,3,3); 
    ellipse(550,295,6,6); 
    ellipse(565,295,20,20); 
    ellipse(580,295,16,16); 
    ellipse(595,295,15,15); 
    ellipse(610,295,12,12); 
    ellipse(625,295,5,5); 
  }
  
  }


