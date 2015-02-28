
void setup()  {
  size(500,500); //set the size of the window
  smooth();
}

void draw ()  {
  //draw a grey background
  background (224);
  
  //draw triangles onto background
  stroke(0);
  noFill();
  triangle(0,50,25,0,50,50);
  triangle(50,50,75,0,100,50);
  triangle(100,50,125,0,150,50);
  triangle(150,50,175,0,200,50);
  triangle(200,50,225,0,250,50);
  triangle(250,50,275,0,300,50);
  triangle(300,50,325,0,350,50);
  triangle(350,50,375,0,400,50);
  triangle(400,50,425,0,450,50);
  triangle(450,50,475,0,499,50);//end row 1
  line(0,50,25,100);
  line(0,100,50,100);
  triangle(25,100,50,50,75,100);
  triangle(75,100,100,50,125,100);
  triangle(125,100,150,50,175,100);
  triangle(175,100,200,50,225,100);
  triangle(225,100,250,50,275,100);
  triangle(275,100,300,50,325,100);
  triangle(325,100,350,50,375,100);
  triangle(375,100,400,50,425,100);
  triangle(425,100,450,50,475,100);
  line(499,50,475,100);
  line(475,100,499,100);//end row 2
  triangle(0,150,25,100,50,150);
  triangle(50,150,75,100,100,150);
  triangle(100,150,125,100,150,150);
  triangle(150,150,175,100,200,150);
  triangle(200,150,225,100,250,150);
  triangle(250,150,275,100,300,150);
  triangle(300,150,325,100,350,150);
  triangle(350,150,375,100,400,150);
  triangle(400,150,425,100,450,150);
  triangle(450,150,475,100,499,150);//end row 3
  line(0,150,25,200);
  line(0,200,25,200);
  triangle(25,200,50,150,75,200);
  triangle(75,200,100,150,125,200);
  triangle(125,200,150,150,175,200);
  triangle(175,200,200,150,225,200);
  triangle(225,200,250,150,275,200);
  triangle(275,200,300,150,325,200);
  triangle(325,200,350,150,375,200);
  triangle(375,200,400,150,425,200);
  triangle(425,200,450,150,475,200);
  line(499,150,475,200);
  line(475,200,499,200); //end row 4
  triangle(0,250,25,200,50,250);
  triangle(50,250,75,200,100,250);
  triangle(100,250,125,200,150,250);
  triangle(150,250,175,200,200,250);
  triangle(200,250,225,200,250,250);
  triangle(250,250,275,200,300,250);
  triangle(300,250,325,200,350,250);
  triangle(350,250,375,200,400,250);
  triangle(400,250,425,200,450,250);
  triangle(450,250,475,200,499,250); //end row 5
  line(0,250,25,300);
  line(0,300,25,300);
  triangle(25,300,50,250,75,300);
  triangle(75,300,100,250,125,300);
  triangle(125,300,150,250,175,300);
  triangle(175,300,200,250,225,300);
  triangle(225,300,250,250,275,300);
  triangle(275,300,300,250,325,300);
  triangle(325,300,350,250,375,300);
  triangle(375,300,400,250,425,300);
  triangle(425,300,450,250,475,300);
  line(499,250,475,300);
  line(475,300,499,300); //end row 6
  triangle(0,350,25,300,50,350);
  triangle(50,350,75,300,100,350);
  triangle(100,350,125,300,150,350);
  triangle(150,350,175,300,200,350);
  triangle(200,350,225,300,250,350);
  triangle(250,350,275,300,300,350);
  triangle(300,350,325,300,350,350);
  triangle(350,350,375,300,400,350);
  triangle(400,350,425,300,450,350);
  triangle(450,350,475,300,499,350); //end row 7
  line(0,350,25,400);
  line(0,400,25,400);
  triangle(25,400,50,350,75,400);
  triangle(75,400,100,350,125,400);
  triangle(125,400,150,350,175,400);
  triangle(175,400,200,350,225,400);
  triangle(225,400,250,350,275,400);
  triangle(275,400,300,350,325,400);
  triangle(325,400,350,350,375,400);
  triangle(375,400,400,350,425,400);
  triangle(425,400,450,350,475,400);
  line(499,350,475,400);
  line(475,400,499,400); //end row 8
  triangle(0,450,25,400,50,450);
  triangle(50,450,75,400,100,450);
  triangle(100,450,125,400,150,450);
  triangle(150,450,175,400,200,450);
  triangle(200,450,225,400,250,450);
  triangle(250,450,275,400,300,450);
  triangle(300,450,325,400,350,450);
  triangle(350,450,375,400,400,450);
  triangle(400,450,425,400,450,450);
  triangle(450,450,475,400,499,450); //end row 9
    line(0,450,25,500);
  line(0,500,25,500);
  triangle(25,500,50,450,75,500);
  triangle(75,500,100,450,125,500);
  triangle(125,500,150,450,175,500);
  triangle(175,500,200,450,225,500);
  triangle(225,500,250,450,275,500);
  triangle(275,500,300,450,325,500);
  triangle(325,500,350,450,375,500);
  triangle(375,500,400,450,425,500);
  triangle(425,500,450,450,475,500);
  line(499,450,475,500);
  line(475,500,499,500); //end row 10
  
  //begin white stripe
  fill(255,255,255,200);
  noStroke();
  beginShape();
  vertex(250,0);
  vertex(mouseX,mouseY);
  vertex(0,250);
  vertex(0,0);
  endShape(CLOSE);
  //end white stripe
  noStroke();
  fill(255,0,0,200); //begin red stripe
  beginShape();
  vertex(499,250);
  vertex(mouseX,mouseY);
  vertex(499,333);
  vertex(499,499);
  endShape(CLOSE); //end red stripe
  fill(255,93,0,200); //begin orange stripe
  beginShape();
  vertex(499,333);
  vertex(mouseX,mouseY);
  vertex(499,417);
  vertex(499,499);
  endShape(CLOSE); //end orange stripe
  fill(255,255,0,200); //begin yellow stripe
  beginShape();
  vertex(499,417);
  vertex(mouseX,mouseY);
  vertex(499,499);
  endShape(CLOSE); //end yellow stripe
  fill(0,255,0,200); //begin green stripe
  beginShape();
  vertex(499,499);
  vertex(mouseX,mouseY);
  vertex(417,499);
  endShape(CLOSE); //end green stripe
  fill(0,0,255,200); //begin blue stripe
  beginShape(); 
  vertex(499,499);
  vertex(417,499);
  vertex(mouseX,mouseY);
  vertex(333,499);
  endShape(CLOSE); //end blue stripe
  fill(150,4,209,200); // begin purple stripe
  beginShape();
  vertex(333,499);
  vertex(mouseX,mouseY);
  vertex(250,499);
  vertex(499,499);
  endShape(CLOSE); //end purple stripe
  
}

