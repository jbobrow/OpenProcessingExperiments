
int x=0;



void setup() {
  size(600,600);
  smooth();
  background(230);
  noStroke();
  int w=200;
  int ww=400;

  frameRate(300);
  int R = 40;
}
void draw() {


  if(mouseX < 200) {
    background(142,14,76);
  } 
  else if ((mouseX>=200) && (mouseX <=400)) {
    background(0,87,92);
  } 
  else {
    background(184,201,107);
  }
  if ((keyPressed == true)&& (key=='L')) {

    fill(255,243,195);
    quad(400,0,600,200,100,700,-100,500);
  }
  else {
    fill(255);
    quad(400,0,600,200,100,700,-100,500); //big rectangle
  }
  if ((keyPressed == true)&& (key=='A')) {
    fill(191,227,211);
    quad(460,380,540,340,640,520,460,600);//right quad second
    fill(117,194,199);
    quad(480,420,580,480,540,540,460,520); //right quad first
  } 
  else {
    fill(135);
    quad(460,380,540,340,640,520,460,600);//right quad second
    fill(85);
    quad(480,420,580,480,540,540,460,520); //right quad first
  }
  fill(0);
  ellipse(440,360,40,40);


  if (mousePressed == true) {

    fill(255,0,0);
    ellipse(440,360,40,40);
  }
  else {
    fill(0);
  }
  //background(255);

  x=x+1;
  if (x>400) {
    x=0;
  }
  noFill();
  stroke(75);
  strokeWeight(20);
  ellipse(440,340,140+x,140+x);

  noStroke();
  if ((keyPressed == true)&& (key=='A')) {
    fill(253,214,190);
    quad(0,0,320,0,380,300,0,400); // last quad
    fill(246,145,131);
    quad(60,120,240,40,400,340,60,500); //third quad
  } 
  else {
    fill(150);
    quad(0,0,320,0,380,300,0,400); // last quad
    fill(100);
    quad(60,120,240,40,400,340,60,500); //third quad
  }

  if ((keyPressed == true)&& (key=='L')) {
    fill(93,58,20);
    quad(600,0,600,20,20,600,0,600);
  } 
  else {
    fill(0);
    quad(600,0,600,20,20,600,0,600);
  }

  if ((keyPressed == true)&& (key=='A')) {
    fill(240,81,95);
    quad(140,200,360,100,320,400,240,420); //second quad
    fill(221,31,38);
    quad(260,200,340,220,360,300,240,320); //hero quad
  } 
  else {
    fill(50);
    quad(140,200,360,100,320,400,240,420); //second quad
    fill(0);
    quad(260,200,340,220,360,300,240,320); //hero quad
  }

  if ((keyPressed == true)&& (key=='L')) {
    fill(167,156,52);
    quad(460,220,600,80,600,240,540,300);
    fill(218,204,36);
    quad(540,100,580,140,500,220,460,180);
  } 
  else {
    fill(190);
    quad(460,220,600,80,600,240,540,300); //rectangle medium
    fill(218);
    quad(540,100,580,140,500,220,460,180);//rectangle small
  }
}


