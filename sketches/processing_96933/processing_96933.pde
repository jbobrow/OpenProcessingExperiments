

BufferedReader reader;
String lines;
float tmpline;

float[] x;
float[] y;
boolean[] b;

float[] tmpX = new float[10];
float[] tmpY = new float[10];

void setup() {  // setup() runs once
  size(500, 500);
  frameRate(10);

  // text.textの中身を読み込む
  reader = createReader("text.txt");
}

void draw() {  // draw() loops forever, until stopped

  background(0, 0, 0);
    
  fill(255, 255, 255, 220);  
  textSize(50);
  text("2013 Q1 graph", 50, height/8);

  noFill();
  noStroke();

  tmpX[0] = 30;
  tmpX[1] = 10;
  tmpX[2] = 60;
  tmpX[3] = 70;
  tmpX[4] = 20;
  tmpX[5] = 40;
  tmpX[6] = 80;
  tmpX[7] = 90;
  tmpX[8] = 50;
  tmpX[9] = 100;

  int posX = 30;
  int posY = 250;

  stroke(255, 255, 255, 255);
  strokeWeight(1);
  fill(100, 255, 255, 200);
  tmpX[0] = tmpX[0];

  rect(posX, posY, posX, tmpX[0] );
  rect(posX+30, posY, posX, tmpX[1] );
  rect(posX+60, posY, posX, tmpX[2] );
  rect(posX+90, posY, posX, tmpX[3] );
  rect(posX+120, posY, posX, tmpX[4] );
  rect(posX+150, posY, posX, tmpX[5] );
  rect(posX+180, posY, posX, tmpX[6] );
  rect(posX+210, posY, posX, tmpX[7] );
  rect(posX+240, posY, posX, tmpX[8] );
  rect(posX+270, posY, posX, tmpX[9] );
  
  noFill();
  noStroke();


  if (mousePressed == true) {

    stroke(255, 100, 100, 100);
    int posXv = 50; 
    strokeWeight(4);
    beginShape(POLYGON); 
    vertex(posXv, tmpX[0]+100);
    vertex(posXv+30, tmpX[1]+100);
    vertex(posXv+60, tmpX[2]+100);
    vertex(posXv+90, tmpX[3]+100);
    vertex(posXv+120, tmpX[4]+100);
    vertex(posXv+150, tmpX[5]+100);
    vertex(posXv+180, tmpX[6]+100);
    vertex(posXv+210, tmpX[7]+100);
    vertex(posXv+240, tmpX[8]+100);
    vertex(posXv+270, tmpX[9]+100);
    endShape();  

  noFill();
  noStroke();
  
  fill(255, 255, 255, 220);  
  textSize(10);
  rotate(0);
  text("data1", 30,240);
  text("data2", 60,240);
  text("data3", 90,240);
  text("data4", 120,240);
  text("data5", 150,240);
  text("data6", 180,240);
  text("data7", 210,240);
  text("data8", 240,240);
  text("data9", 270,240);
  text("data10", 300,240);
  }

  if (keyPressed)
  {

    if (key == '1')  text("1", 50, 50);
  }
  noFill();
}


void keyPressed() {

    stroke(50, 255, 255, 100);
    int posZ = 400;
    int posW = 150;
    strokeWeight(2);
    beginShape(POLYGON); 
    vertex(tmpX[0]+350,posW);
    vertex(tmpX[1]+350,posW+30);
    vertex(tmpX[2]+350,posW+60);
    vertex(tmpX[3]+350,posW+90);
    vertex(tmpX[4]+350,posW+120);    
    vertex(tmpX[5]+350,posW+150);
    vertex(tmpX[6]+350,posW+180);    
    vertex(tmpX[7]+350,posW+210);
    vertex(tmpX[8]+350,posW+240);
    vertex(tmpX[9]+350,posW+270);
    
    ellipse(tmpX[0]+350,posW, tmpX[0], tmpX[0]);
    ellipse(tmpX[1]+350,posW+30, tmpX[1], tmpX[1]);
    ellipse(tmpX[2]+350,posW+60, tmpX[2], tmpX[2]);
    ellipse(tmpX[3]+350,posW+90, tmpX[3], tmpX[3]);
    ellipse(tmpX[4]+350,posW+120, tmpX[4], tmpX[4]);
    ellipse(tmpX[5]+350,posW+150, tmpX[5], tmpX[5]);
    ellipse(tmpX[6]+350,posW+180, tmpX[6], tmpX[6]);
    ellipse(tmpX[7]+350,posW+210, tmpX[7], tmpX[7]);
    ellipse(tmpX[8]+350,posW+240, tmpX[8], tmpX[8]);
    ellipse(tmpX[9]+350,posW+270, tmpX[9], tmpX[9]);
    
    endShape();  
  
}


void mouseDragged()
{
  // マウスをドラッグするたびに、ここの処理が実行される

  fill(255, 255, 0, 220);
  stroke(255, 255, 0, 220);  

  float posX = 30;
  float posY = 250;

  line(posX, height,posX, tmpX[0]+350 );
  line(60, height,posX+30, tmpX[1]+350 );
  line(90, height,posX+60, tmpX[2]+350 );
  line(120, height,posX+90, tmpX[3]+350 );
  line(150, height,posX+120, tmpX[4]+350 );
  line(180, height,posX+150, tmpX[5]+350 );
  line(210, height,posX+180, tmpX[6]+350 );
  line(240, height,posX+210, tmpX[7]+350 );
  line(270, height,posX+240, tmpX[8]+350 );
  line(300, height,posX+270, tmpX[9]+350 );

}


void mousePressed()
{
  redraw();    //更新
  //  noLoop();  // マウスボタンを押している間、draw()を呼び出さないようにする
}

// マウスボタンを離すと、draw()の定期呼び出しを再開する
void mouseReleased()
{
  loop();
}



