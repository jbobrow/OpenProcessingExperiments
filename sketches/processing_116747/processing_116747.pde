
//CLOCK
//Test 009 [Date:20131021] Wayne Lin
//e-mail:ration.Lin@gmail.com
//N76014045 林瑞勛

//抽象時鐘
//內層可判斷秒數，分為12秒單位、30秒單位.
//中層跑一圈1分鐘，外層跑一圈60分鐘，1小時.


int s = second();
int m = minute();
int h = hour();


void setup() {

  size(600, 600);
  background(57, 57, 56);
  smooth();
  colorMode(RGB);
  frameRate(30);
  s = 0;
}

void draw() {


  s = second();
  m = minute();
  h = hour();
  println(s+" sec");//顯示資訊
  println(m+" min");
  println(h+" hr");

  drawRect();
  drawEllipse();
  //drawEllipseMinuteMine();
}


void drawRect() {

  rectMode(CENTER);
  noStroke();

  fill(109, 116, 142, 80);
  rect(300, 300, 550, 550, 30);//hour
  fill(64, 126, 93, 80);
  rect(300, 300, 400, 400, 60);//min
  fill(195, 198, 154, 80);
  rect(300, 300, 250, 250, 30);//sec
  //Line
  stroke(255);
  strokeWeight(1);
  line(200, 300, 400, 300);
  //Text
  fill(250, 250, 250, 70);
  textSize(26);
  text("12sec.", 320, 290); 
  text("30sec.", 320, 330);
  textSize(26);
  text("60sec.", 320, 490);
  text("15min.", 320, 570);
}

/*void drawEllipseMinuteMine() {//Unit 12min  
 
 }*/

void drawEllipse() {
  noStroke();
  //Second
  fill(66, 146, 155);//Unit 12s//TOP  
  ellipse(200, 200, 15, 15);//0sec
  ellipse(240, 200, 15, 15);//12sec
  ellipse(280, 200, 15, 15);//24sec
  ellipse(320, 200, 15, 15);//36sec
  ellipse(360, 200, 15, 15);//48sec
  ellipse(400, 200, 15, 15);//60sec

  fill(66, 146, 155);//Unit 30s//DOWN
  ellipse(400, 400, 15, 15);//0sec
  ellipse(300, 400, 15, 15);//30sec
  ellipse(200, 400, 15, 15);//60sec

  //Minute
  fill(55, 17, 82);//Unit 12min  
  ellipse(150, 150, 30, 30);
  ellipse(450, 150, 30, 30);
  ellipse(450, 450, 30, 30);
  ellipse(150, 450, 30, 30);

  //Hour
  fill(55, 17, 82, 70);//Unit 6hr  
  ellipse(50, 50, 50, 50);
  ellipse(550, 50, 50, 50);
  ellipse(550, 550, 50, 50);
  ellipse(50, 550, 50, 50);




  int PosX = 200;
  int PosY = 200;
  int PosXr = 400;
  int PosYr = PosY;

  pushMatrix();
  fill(225, 232, 140); 

  ellipse(PosX+PosX*(s*1.0000f/59), PosY, 15, 15);//sec

  translate((PosXr-PosX)*(s*1.0000f/59), (PosY));

  ellipse(PosX, PosY, 15, 15);//sec

  popMatrix();



  //Second
  for (int i = 0; i<15; i++) {
    noStroke();
    if (i < (s)) {
      fill(88, 153, 230, 80);
    }
    else {
      fill(55, 17, 82);
    }
    ellipse(PosX-50 + (i*20), (PosY-50), 15, 15);
  }

  for (int i = 15; i<30; i++) {

    if (i < (s)) {
      fill(88, 153, 230, 80);
    }
    else {
      fill(55, 17, 82);
    }
    ellipse(PosX+250, (PosY-50)-300+ (i*20), 15, 15);
  }

  for (int i = 30; i<45; i++) {

    if (i < (s)) {
      fill(88, 153, 230, 80);
    }
    else {
      fill(55, 17, 82);
    }
    ellipse(-150-(i*20)+1200, 450, 15, 15);
  }

  for (int i = 45; i<60; i++) {

    if (i < (s)) {
      fill(88, 153, 230, 80);
    }
    else {
      fill(55, 17, 82);
    }
    ellipse(150, -150-(i*20)+1500, 15, 15);
  }


  //noFill();
  //stroke(255);
  //strokeWeight(2);
  //rect(300, 300, 420, 420);

  //ellipse();

  //noStroke();
  
  //Minute
  for (int i = 0; i<15; i++) {
    if (i < m) {
      fill(247, 183, 85, 70);
    }
    else {
      fill(55, 17, 82, 70);
    }
    //ellipse(70, 70, 30, 30);
    ellipse(70+(i*30) , 70, 20, 20);
  }
  for (int i = 15; i<30; i++) {
    if (i < m) {
      fill(247, 183, 85, 70);
    }
    else {
      fill(55, 17, 82, 70);
    }
    ellipse(525, 70+(i*30)-450, 20, 20);
  }
  
  for (int i = 30; i<45; i++) {
    if (i < m) {
      fill(247, 183, 85, 70);
    }
    else {
      fill(55, 17, 82, 70);
    }
    ellipse(525-(i*30)+900, 525, 20, 20);
  }

  for (int i = 45; i<60; i++) {

    if (i < m) {
      fill(247, 183, 85, 70);
    }
    else {
      fill(55, 17, 82, 70);
    }
    ellipse(70, 525-(i*30)+1350, 20, 20);
  }
}

/*void drawEllipseMinuteMine() {//Unit 12min  
  fill(88, 153, 230, 80);
  ellipse(200, 150, 30, 30);//Top
  ellipse(250, 150, 30, 30);
  ellipse(300, 150, 30, 30);
  ellipse(350, 150, 30, 30);
  ellipse(400, 150, 30, 30);

  ellipse(450, 200, 30, 30);//Right
  ellipse(450, 250, 30, 30);
  ellipse(450, 300, 30, 30);
  ellipse(450, 350, 30, 30);
  ellipse(450, 400, 30, 30);

  ellipse(400, 450, 30, 30);//Down
  ellipse(350, 450, 30, 30);
  ellipse(300, 450, 30, 30);
  ellipse(250, 450, 30, 30);
  ellipse(200, 450, 30, 30);

  ellipse(150, 400, 30, 30);//Left
  ellipse(150, 350, 30, 30);
  ellipse(150, 300, 30, 30);
  ellipse(150, 250, 30, 30);
  ellipse(150, 200, 30, 30);
}*/


