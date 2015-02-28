
float xPos = 0.0;
float yPos = 0.0;
float xNeg = 0.0;
float yNeg = 0.0;

int ValueTime = 0;
int minValueTime = 0;
int maxValueTime = 60;
//constrain(value, minValue, maxValue);値の圧縮
 
int ms2tmp = 0;

float X,Y;
float Cx=100, Cy=100;
float Angle = 0;
float R = 50;
int clr = 0;

void setup() {  // setup() runs once
  size(500, 500);
  frameRate(60);

  PFont myFont = loadFont("MekanikLetPlain-70.vlw");
  textFont(myFont);

}
 
void draw() {  // draw() loops forever, until stopped

  float clrdmR = random(0,255);
  float clrdmG = random(0,255);
  float clrdmB = random(0,255);
  float clrdmA = random(0,255);

  background(0,0,0);
  
  int ms1 = millis();
  int s1 = second();
  int m1 = minute();
  int h1 = hour();
  int ms2 = millis();
  int s2 = second();
  int m2 = minute();
  int h2 = hour();

  int min1 = 150;
  int max1 = 350;
  float x1 = random(min1,max1);
  float y1 = random(min1,max1);
  float x2 = random(min1,max1);
  float y2 = random(min1,max1);
  float x3 = random(min1,max1);
  float y3 = random(min1,max1);
  float x4 = random(min1,max1);
  float y4 = random(min1,max1);

  int min2 = 50;
  int max2 = 450;
  float bzx1 = random(min2,max2);
  float bzy1 = random(min2,max2);
  float bzx2 = random(min2,max2);
  float bzy2 = random(min2,max2);
  float bzx3 = random(min2,max2);
  float bzy3 = random(min2,max2);

  stroke(100,255,100,200);
  strokeWeight(random(0,5));
  quad(x1, y1, x2, y2, x3, y3, x4, y4);

  stroke(clrdmR,clrdmG,clrdmB,clrdmA);
  strokeWeight(random(0,10));
  bezier(width/2, height/2, bzx1, bzy1, bzx2, bzy2, mouseX, mouseY);

  strokeWeight(5);
  stroke(clrdmR,clrdmG,clrdmB,clrdmA);
  line(mouseX, mouseY, pmouseX, pmouseY);
  ellipse(mouseX, mouseY, 60, 60);

  int tmpA = millis();
  int tmpB = 1000;
  float tmpC = 0;
  float tmpD = s1;

  tmpA = tmpA % tmpB;
  tmpC = map(tmpA, 0, 1000, 0, 60);
  tmpD = map(tmpC, 0, 60, 0, 2);
  
   //角度を10度ずつ増加
   Angle = Angle + 1;

   //角度を度からラジアンに変換させる
   X = Cx + ( R * cos(radians(Angle)) );
   Y = Cy + ( R * -sin(radians(Angle)) );

   //cが255になるとリセットする
   if(clr >= 255){
      clr = 0;
   }
   clr = clr + 1;
 
if (mousePressed == true){
  stroke(0);
  stroke(255,0,0,200);
  fill(255,200,0,80);
  arc(250, 250, 200, 200, -1.5, PI*tmpD);
  noFill();
  strokeWeight(8);
  line(250, 250 , 60 * cos((h1 + m1/60.0) % 12 * TWO_PI / 12 - HALF_PI) + 250, 60 * sin((h1 + m1/60.0) % 12 * TWO_PI / 12 - HALF_PI) + 250); //時針の描画
  strokeWeight(6);
  line(250, 250 , 80 * cos((m1 + s1/60.0) * TWO_PI / 60 - HALF_PI) + 250, 80 * sin((m1 + s1/60.0) * TWO_PI / 60 - HALF_PI) + 250); //分針の描画
  strokeWeight(2);
  line(250, 250 , 90 * cos(s1 * TWO_PI / 60 - HALF_PI) + 250, 90 * sin(s1 * TWO_PI / 60 - HALF_PI) + 250); //秒針の描画
  
}

  strokeWeight(1);  
  stroke(100,100,255,180);
  fill(100,100,255,50);

  rect(0, 0, h2*20.833, height/4); 
  
  rect(0, height/4, m2*8.33, height/4);

  rect(0, height*2/4, s2*8.33, height/4);

  rect(0, height*3/4, tmpC*8.33, height/4);

  noFill();
  
  fill(255,255,255,220);  
  textSize(70);
  text("hr:"+h2, 50, height/4);
  text("min:"+m2, 50, height/4*2);
  text("sec:"+s2, 50, height/4*3);
  text("mlsc:"+ms2, 50, height/4*4);
  strokeWeight(1);
  noFill();
  
//時刻の円  
  stroke(255,255,255,200);
  
  ellipse(450,height/4-60,60,60);
  ellipse(450,height/4*2-60,60,60);
  ellipse(450,height/4*3-60,60,60);
  ellipse(450,height/4*4-60,60,60);

  fill(255,0,255,100);  
  ellipse(450,height/4-60,h2,h2);
  ellipse(450,height/4*2-60,m2,m2);
  ellipse(450,height/4*3-60,s2,s2);
    
  if (ms2tmp >= 60)
    {  ms2tmp = 0 ; }
  else
    {  ms2tmp = ms2tmp + 1 ; }

    ellipse(450,height/4*4-60,tmpC,tmpC);
//    ellipse(450,height/4*4-60,ms2tmp,ms2tmp);

  noFill();
  noStroke();

  xPos = xPos - 1.0;  
  stroke(255,255,255,190);
  if (xPos < 0) { xPos = width; }
  line(xPos, 0, xPos, height);

  yPos = yPos - 1.0;  
  stroke(255,255,255,190);
  if (yPos < 0) { yPos = height; }
  line(0, yPos, width, yPos);

  xNeg = xNeg + 1.0; 
  stroke(255,255,255,190);
  if (xNeg > width ) { xNeg = 0 ; }
  line(xNeg, 0, xNeg, height);

  yNeg = yNeg + 1.0;  
  stroke(255,255,255,190);
  if (yNeg > height ) { yNeg = 0 ; }
  line(0, yNeg, width, yNeg);

float line01 = random(400,500);
float line02 = random(400,500);
float line03 = random(400,500);
float line04 = random(400,500);
float line05 = random(400,500);
float line06 = random(400,500);
float line07 = random(400,500);

  stroke(255,255,50,250);

beginShape(POLYGON); 
  vertex(450, 65);
  vertex(line01,100);
  vertex(line02,150);
  vertex(line03,200);
  vertex(line04,250);
  vertex(line05,300);
  vertex(line06,350);
  vertex(line07,400);
  vertex(450, 440);
endShape();

  if (keyPressed)
  {
    PFont font = createFont("Meiryo", 32);
    textSize(200);
    fill(255,255,255,220); 
    if (key == '1')  text("1", x1, y1);
    if (key == '2')  text("2", x1, y1);
    if (key == '3')  text("3", x1, y1);
    if (key == '4')  text("4", x1, y1);
    if (key == '5')  text("5", x1, y1);
    if (key == '6')  text("6", x1, y1);
    if (key == '7')  text("7", x1, y1);
    if (key == '8')  text("8", x1, y1);
    if (key == '9')  text("9", x1, y1);
    if (key == '0')  text("0", x1, y1);
    
    if (key == 'a')  text("a", x1, y1);
    if (key == 'b')  text("b", x1, y1);
    if (key == 'c')  text("c", x1, y1);
    if (key == 'd')  text("d", x1, y1);
    if (key == 'e')  text("e", x1, y1);
    if (key == 'f')  text("f", x1, y1);
    if (key == 'g')  text("g", x1, y1);
    if (key == 'h')  text("h", x1, y1);
    if (key == 'i')  text("i", x1, y1);
    if (key == 'j')  text("j", x1, y1);
    if (key == 'k')  text("k", x1, y1);
    if (key == 'l')  text("l", x1, y1);
    if (key == 'm')  text("m", x1, y1);
    if (key == 'n')  text("n", x1, y1);
    if (key == 'o')  text("o", x1, y1);
    if (key == 'p')  text("p", x1, y1);
    if (key == 'q')  text("q", x1, y1);
    if (key == 'r')  text("r", x1, y1);
    if (key == 's')  text("s", x1, y1);
    if (key == 't')  text("t", x1, y1);
    if (key == 'u')  text("u", x1, y1);
    if (key == 'v')  text("v", x1, y1);
    if (key == 'w')  text("w", x1, y1);
    if (key == 'x')  text("x", x1, y1);
    if (key == 'y')  text("y", x1, y1);
    if (key == 'z')  text("z", x1, y1);
  }
  noFill();
}


void mouseDragged()
{
  // マウスをドラッグするたびに、ここの処理が実行される

  int min1 = 0;
  int max1 = 500;
  float x1 = random(min1,max1);
  float y1 = random(min1,max1);
  float x2 = random(min1,max1);
  float y2 = random(min1,max1);
  float x3 = random(min1,max1);
  float y3 = random(min1,max1);
  float x4 = random(min1,max1);
  float y4 = random(min1,max1);

    stroke(255,255,255,200);
beginShape(POLYGON); 
  vertex(pmouseX, pmouseY);
  vertex(x2, y2);
  vertex(x3, y3);
  vertex(x4, y4);
  vertex(mouseX, mouseY);
endShape();
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



