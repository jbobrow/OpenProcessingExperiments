

int a = 500;
int b = 400;

void setup() {

  size(600,600);
  smooth();
  background(50);
}



void draw() {


  noStroke();
  fill(220);



  //up round line
  noFill();
  stroke(100);
  strokeWeight(40);
  strokeCap(SQUARE);

  bezier(300,40,270,30,215,70,220,100);


  //second

  noFill();
  stroke(150);
  strokeWeight(40);
  strokeCap(SQUARE);

  bezier(300,100,340,80,460,100,500,160);    


  //third

  noFill();
  stroke(220);
  strokeWeight(40);
  strokeCap(SQUARE);

  bezier(350,160,540,160,540,440,350,440);     

  for(int i = 0; i<=height; i+=60) {
    for (int o = 0; o<= width; o +=60) {
      fill(55);
      noStroke();
      ellipse(i,o,15,15);
    }
  }


  float d = dist(30,30,mouseX,mouseY);

  fill(220);

  //삼각텓둘릴

  if (d < a) {
    fill(255,0,0);
    a  ++;
  }

  else if (mousePressed && (d > a) && (a>a)) {
    fill(0);
    a--;
    println(a);
  }




  if(keyCode == RIGHT) {
    b++;
  }
  else if (keyCode == LEFT) {
    b--;
  }
  else {
    noFill();
    rect(20,20,20,20);
  }


  noStroke();   

  //e돌릭기ㅣ
  noCursor();
  noStroke();
  fill(247,62,45);
  triangle(mouseX+14,mouseY-16,200,160,mouseX,mouseY);

  //윙엦작은삼
  beginShape();  



  noStroke();  



  fill(219);  



  vertex(100,120);  

  vertex(140,60);  

  vertex(200,160);  

  vertex(100,120);  



  endShape();  

  //맨윋덮는삼
  beginShape();  



  fill(153);  



  vertex(0,0);  

  vertex(0,40);  

  vertex(140,100);  

  vertex(100,0);  

  vertex(0,0);  

  endShape();  


  //십작
  beginShape();  



  fill(124,37,29);  

  vertex(60,140);  

  vertex(160,200);  

  vertex(200,280);  

  vertex(270,300);  

  vertex(280,320);  

  vertex(240,360);  

  vertex(280,440);  

  vertex(240,520);  

  vertex(180,420);  

  vertex(100,500);  

  vertex(0,280);  

  vertex(0,230);  

  vertex(120,260);  

  vertex(60,140);  



  endShape();  


  //십작강윙엔넴
  beginShape();  



  fill(70,44,42);  



  vertex(0,260);  

  vertex(80,280);  

  vertex(140,400);  

  vertex(60,500);  

  vertex(0,360);  

  vertex(0,260);  



  endShape();  

  //십작강윙엥윙엔넴몸
  beginShape();  



  fill(40);  



  vertex(0,260);  

  vertex(80,420);  

  vertex(0,500);  

  vertex(0,260);  



  endShape();  

  //받닥넴몸
  beginShape();  



  fill(39,18,16);  

  vertex(180,600);  

  vertex(240,480);  

  vertex(380,460);  

  vertex(420,600);  

  vertex(180,600);  



  endShape();  


  //뿆걸친는삼각
  beginShape();  



  fill(255,163,155);  

  vertex(320,320);  

  vertex(420,440);  

  vertex(400,480);  

  vertex(320,320);  



  endShape();  

  //긍옆삼ㅅ맛각
  beginShape();  



  fill (35);  

  vertex(380,360);  

  vertex(440,400);  

  vertex(480,440);  

  vertex(500,445);  

  vertex(580,500);  

  vertex(580,460);  

  vertex(380,360);  



  endShape();  

  //윙엑걸친는삼각
  beginShape();  



  vertex(420,140);  

  vertex(440,60);  

  vertex(480,80);  

  vertex(430,140);  

  vertex(420,140);  



  endShape();  



  //날칼롱운삭각각
  beginShape();  



  vertex(470,100);  

  vertex(520,40);  

  vertex(560,20);  

  vertex(470,100);  



  endShape();  

  //뾰뾰뿆족
  beginShape();  



  vertex(320,280);  

  vertex(540,200);  

  vertex(580,200);  

  vertex(320,280);  



  endShape();  



  //뿁뵤쪽곡곡

  beginShape();  



  fill(255,208,203);  



  vertex(300,300);  

  vertex(280,280);  

  vertex(220,260);  

  vertex(260,320);  

  vertex(300,300);  



  endShape();  











  strokeWeight(0);
  stroke(26,8,36);
}
void mousePressed() {
  a = 50;


  if (keyPressed== true) {
    fill(92,1,142);
  } 
  else {
    fill(92,1,142);
  }
  beginShape();  



  fill(238,217,250);  

  vertex(320,320);  

  vertex(420,440);  

  vertex(400,480);  

  vertex(320,320);  



  endShape();  


  //클릭

  int col;



  //black middle one
  if (mousePressed && insideTriangle(60,300,300,60,440,200)) {
    col = 100;
  }
  else {
    col= 50;
  }
  fill(col);
  triangle(60,300,300,60,440,200);
}

boolean insideTriangle(float x0, float y0, float x1, float y1, float x2, float y2) {

  // Compute vectors        
  float dx0 = x1 - x0;
  float dy0 = y1 - y0;

  float dx1 = x2 - x0;
  float dy1 = y2 - y0;

  float dx2 = mouseX - x0;
  float dy2 = mouseY - y0;

  // Compute dot products
  float dot00 = dx0 * dx0 + dy0 * dy0;
  float dot01 = dx0 * dx1 + dy0 * dy1;
  float dot02 = dx0 * dx2 + dy0 * dy2;
  float dot11 = dx1 * dx1 + dy1 * dy1;
  float dot12 = dx1 * dx2 + dy1 * dy2;

  // Compute barycentric coordinates
  float invDenom = 1.0f / (dot00 * dot11 - dot01 * dot01);
  float u = (dot11 * dot02 - dot01 * dot12) * invDenom;
  float v = (dot00 * dot12 - dot01 * dot02) * invDenom;

  // Check if point is in triangle
  return (u > 0) && (v > 0) && (u + v < 1);
}


