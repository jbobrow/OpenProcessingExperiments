
// 마우스로 자유롭게 그립니다. 좌,우클릭에 따라 색이 바뀜니다.
//키보드 상하 버튼으로 붓 사이즈 조절이 됨니다.
//원점으로 돌리시려면 키보드 "s"를 누르세요.


int value = 50;
int value2 = 255;
int value3 = 100;
int x = 10;


void setup() {
  size(600,600);
  background(value2);
  strokeWeight(3);
  smooth();
  stroke(value);
  line(400,0,600,300);
  noStroke();
  fill(value);
  //black
  //triangle
  triangle(600,180,550,225,600,300);
  //ellipse
  ellipse(380,280,40,40);
  //rect
  rect(480,180,20,20);
  rect(0,400,600,20);
  //quad
  quad(420,580,600,500,600,600,420,600);
  quad(440,480,480,500,460,540,420,520);
  quad(400,520,440,540,440,550,400,530);
  quad(260,546,420,546,420,560,220,560);
  quad(0,0,400,0,220,360,0,246);
  quad(0,0,600,300,600,315,0,15);
  quad(600,180,460,320,440,300,600,140);
  //vertex
  beginShape();
  vertex(0,0);
  vertex(200,0);
  vertex(345,520);
  vertex(140,600);
  vertex(0,600);
  vertex(0,0);
  endShape();


  //white
  fill(value2);
  //triangle
  triangle(0,0,200,0,235,120);

  //quad
  quad(180,400,310,400,315,420,180,420);
  quad(494,247,520,260,510,270,484,257);
  quad(160,546,275,546,239,558,160,558);
  quad(235,120,319,160,314,170,239,134);
  quad(0,280,180,460,140,500,0,360);

  //vertex
  beginShape();
  vertex(0,15);
  vertex(239,134);
  vertex(270,257);
  vertex(220,360);
  vertex(0,246);
  vertex(0,15);
  endShape();


  //end
  fill(value);
  quad(215,235,235,253,0,510,0,475);
  fill(value);
  quad(140,320,162,331,110,389,94,373);
  quad(0,473,55,415,71,431,0,509);

  stroke(value);
  strokeWeight(0.1);
  for (int x = 10; x < 600; x += 10) {
    line(x, 0, x, 600);
  }
  for (int x = 10; x < 600; x += 10) {
    line(0, x, 600, x);
  }
}

void draw() {
  if (mousePressed && (mouseButton == LEFT)) {
    line(mouseX,mouseY,pmouseX, pmouseY);
    stroke(value);
    strokeWeight(x);
  } 
  else if (mousePressed && (mouseButton == RIGHT)) {
    line(mouseX,mouseY,pmouseX, pmouseY);
    stroke(value2);
    strokeWeight(x);
  }
  if (keyPressed && (key == CODED)) { 
    if (keyCode == UP) {
      strokeWeight(x++);
    } 
    else if (keyCode == DOWN) {
      strokeWeight(x--);
    }
  }
  if(x <= 1) {
    x=1;
  }
  else if(x >=20) {
    x=20;
  }


  if((keyPressed == true) && (key == 's')) {  //clean up
    size(600,600);
    background(value2);
    stroke(value);
    strokeWeight(3);
    line(400,0,600,300);
    noStroke();
    fill(value);
    //black
    //triangle
    triangle(600,180,550,225,600,300);
    //ellipse
    ellipse(380,280,40,40);
    //rect
    rect(480,180,20,20);
    rect(0,400,600,20);
    //quad
    quad(420,580,600,500,600,600,420,600);
    quad(440,480,480,500,460,540,420,520);
    quad(400,520,440,540,440,550,400,530);
    quad(260,546,420,546,420,560,220,560);
    quad(0,0,400,0,220,360,0,246);
    quad(0,0,600,300,600,315,0,15);
    quad(600,180,460,320,440,300,600,140);
    //vertex
    beginShape();
    vertex(0,0);
    vertex(200,0);
    vertex(345,520);
    vertex(140,600);
    vertex(0,600);
    vertex(0,0);
    endShape();


    //white
    fill(value2);
    //triangle
    triangle(0,0,200,0,235,120);

    //quad
    quad(180,400,310,400,315,420,180,420);
    quad(494,247,520,260,510,270,484,257);
    quad(160,546,275,546,239,558,160,558);
    quad(235,120,319,160,314,170,239,134);
    quad(0,280,180,460,140,500,0,360);

    //vertex
    beginShape();
    vertex(0,15);
    vertex(239,134);
    vertex(270,257);
    vertex(220,360);
    vertex(0,246);
    vertex(0,15);
    endShape();


    //end
    fill(value);
    quad(215,235,235,253,0,510,0,475);
    fill(value);
    quad(140,320,162,331,110,389,94,373);
    quad(0,473,55,415,71,431,0,509);

    stroke(value);
    strokeWeight(0.1);
    for (int x = 10; x < 600; x += 10) {
      line(x, 0, x, 600);
    }
    for (int x = 10; x < 600; x += 10) {
      line(0, x, 600, x);
    }
  }
}













