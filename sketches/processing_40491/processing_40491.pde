

//animation variables
int liftHeight = 520;
int speed = 5;
int slowersSpeed = 1;

//tree variables
int sizeFactor = 1;
int triangleOrginX = 200;
int triangleOrginY= 25;
int eyeSize = 15;

//snowfall variables
int snowY=0;
float snowSize = random(1, 50);


void setup() {
  size(1000, 1100);  
  smooth();
}


void draw () {
    background(220);
  noStroke();
  liftHeight = ((mouseY/3)+300);

  if (liftHeight > 380) {
    eyeSize = 5;
  }  
  else {
    eyeSize = 20;
  }

  //ground
  fill(190);
  rect(0, 800, 1000, 400);

  //draw trees
  xmasTree(500, -50, .6, .4);
  xmasTree(400, -25, .7, .6);
  xmasTree(300, 0, .8, .8);
  xmasTree(200, 25, 1, 1);
  
 



snowman();

  //front snow
  noStroke();
  snow(5, 50);
  
  

}



  ////snow
  //    snow(5,25);

void snowman(){

fill(255);
  ellipse(500, 800, 350, 350);
  ellipse(500, 575, 310, 310);
  ellipse(500, 350, 250, 250);
  //face//
  fill(10);
  ellipse(470, 330, 15, eyeSize);
  ellipse(530, 330, 15, eyeSize);
  fill(255, 166, 0);
  triangle(500, 360, 510, 375, 500, 400);
  //button coat//
  fill(40);
  ellipse(500, 650, 20, 20);
  ellipse(500, 575, 20, 20);
  ellipse(500, 500, 20, 20);
  //barbells//
  stroke(100);
  strokeWeight(5);
  line(200, (liftHeight-3), 795, (liftHeight-10));
  stroke(0);
  strokeWeight(0);
  fill(200);
  ellipse(775, liftHeight, 25, 150);
  ellipse(785, liftHeight, 25, 150);
  ellipse(210, liftHeight, 25, 150);
  ellipse(200, liftHeight, 25, 150);
  //right arm/.
  stroke(3);
  strokeWeight(5);
  line(375, 525, 300, (liftHeight+60));
  line(300, (liftHeight+60), 250, liftHeight);
  line(250, liftHeight, 240, (510+(liftHeight-520)));
  line(250, liftHeight, 235, (525+(liftHeight-520)));
  line(250, liftHeight, 245, (530+(liftHeight-520)));
  //left arm//
  line(625, 525, 675, (liftHeight+60));
  line(675, (liftHeight+60), 735, liftHeight);
  line(735, (liftHeight), 745, (500+(liftHeight-520)));
  line(735, liftHeight, 750, (505+(liftHeight-520)));
  line(735, liftHeight, 740, (495+(liftHeight-520)));
}



void snow(int snowSize, int snowSpace) {
  int temp;//variable for alternating rows
  for (int snowX=0;snowX<=1000;snowX+=snowSpace)//row of snow
  { 
    for (int i=0;i<=9000;i+=(snowSpace/2))//column of snow
    {
      if (i%2==0)
        temp=(snowSpace/2);//odd rows have extra 25px spacing
      else
        temp=0;//even rows start from edge
      fill(255, random(0, 255));//Snow Fill
      ellipse(snowX+temp, snowY-i+1100, snowSize, snowSize);//drawing of each snowflake
    }
  }
  snowY++;//animation
}

//xmas tree function

void xmasTree(int triangleOrginX, int triangleOrginY, float sizeFactor, float colorFactor) {
  float tex = triangleOrginX*sizeFactor;
  float tey = triangleOrginY*sizeFactor;
  float rex = tex + (175*sizeFactor);
  float rey = tey + (275*sizeFactor);
  float lex = tex - (175*sizeFactor);
  float ley = tey + (275*sizeFactor);
  fill(210*colorFactor, 210*colorFactor, 150*colorFactor);
  rect((triangleOrginX-15)*sizeFactor, (triangleOrginY+200)*sizeFactor, 30*sizeFactor, 700);
  fill(75*colorFactor, 185*colorFactor, 130*colorFactor);
  triangle(tex, tey, rex, rey, lex, ley);
  triangle(tex, (tey+200), (rex+50), (rey+225), (lex-50), (ley+225));
  triangle(tex, (tey+400), (rex+100), (rey+400), (lex-100), (ley+400));
}








