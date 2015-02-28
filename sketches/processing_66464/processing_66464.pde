
boolean pressed = true;

//red circle initial position
int redx = 60;
int redy = 260;
int widthredcircle = 60;
int heightredcircle = 60;

//blue circle initial position
int bluex = 170;
int bluey = 250;
int widthbluecircle = 60;
int heightbluecircle = 60;

//red line connector line
float blueLineX = 60;
float blueLineStartY = 180;
float blueLineEndY = 230;

//red line 
float redLineX = 170;
float redLineStartY = 180;
float redLineEndY = 220;

//connector
float startLineX = 60; 
float endLineX = 170;

void setup() {
  size(600, 600);
  line(60, 180, 170, 180);
  fill(255);
  smooth();
 } 

void draw() {
  background(200);
  if(keyPressed){
    background(255);
    strokeWeight(2);
  }
  
  //Top Of Mobile
  noFill();
  arc(260, 155, 280, 40, PI, TWO_PI);

  //first circle (red circle)
  fill(255, 0, 0);
  if(keyPressed){
    fill(0);}
  ellipse(redx, redy, widthredcircle, heightredcircle);
  
  //second circle (blue circle)
  fill(0, 0, 255);
  if(keyPressed){
    fill(0);}
  ellipse(bluex, bluey, widthbluecircle, heightbluecircle);
 
  //line connecting blue circle to mobile
  line(blueLineX, blueLineStartY, blueLineX, blueLineEndY);
  
  //line connecting red and blue circles
  line(startLineX, 180, endLineX, 180);

  //line connecting red circle to mobile
  line(redLineX, 232, redLineX, 180);

  //line connecting circles to top of mobile
  line(120, 180, 120, 155);

  //circle connector left
  noFill();
  ellipse(394, 150, 12, 12);

  //circle connector right
  ellipse(480, 200, 12, 12);

  //line from circle connector right to top red triangle
  line(480, 200, 480, 220);

  //line connecting circle connectors
  line(394, 150, 480, 200);

  //top triangle (shape 1)
  fill(255, 0, 0);
  if(keyPressed){
    fill(0);}
  triangle(440, 220, 480, 260, 600, 220);

  //verticle line below triangle
  line(480, 260, 480, 300);

  //shape 2-quad
  fill(0);
  quad(480, 300, 520, 300, 540, 340, 430, 360);

  //verticle line connecting shape 2 to shape 3
  line(480, 350, 480, 380);

  //shape 3-quadrangle
  fill(250, 255, 2);
  if(keyPressed){
    fill(0);}
  quad(480, 380, 520, 400, 520, 460, 420, 420);

  //shape 4 -small square
  fill(255);
  if(keyPressed){
    fill(0);}
  rect(520, 480, 20, 20);

  //verticle line connecting shape4 (small square) to shape 3 (quad)
  line(520, 460, 520, 480);

  //verticle line connecting shape3 to to bottom triangle
  line(480, 444, 480, 480);

  //shape 5-bottom triangle
  fill(255, 0, 0);
  if(keyPressed){
    fill(0);}
  triangle(480, 480, 420, 480, 520, 540); 

if(mousePressed){
  background(200);
  fill(255,0,0);
  ellipse(redx, redy, widthredcircle, heightredcircle);
  
  fill(0,0,255);
  ellipse(bluex, bluey, widthbluecircle, heightbluecircle);
  
  line(redLineX, redLineStartY, redLineX, redLineEndY);
  line(blueLineX, blueLineStartY, blueLineX, blueLineEndY);
  line(startLineX, 180, endLineX, 180);
 
  if(pressed){ 
    redx++;
    redLineX--;
    startLineX++;
   
    bluex--;
    blueLineX++;
    endLineX--;
   
  if(redx==170){ 
  pressed = false;
  } 
 }
  
 if(pressed==false){ 
    redx--;
    redLineX++;
    startLineX--;
   
   bluex++;
   blueLineX--;
   endLineX++;
   
  if(bluex==170){
  pressed = true;
  } 
 }

  //top arc of mobile
  noFill();
  arc(260, 155, 280, 40, PI, TWO_PI);

  //line connecting circles to top of mobile
  line(120, 180, 120, 155);

  //circle connector left
  noFill();
  ellipse(394, 150, 12, 12);

  //circle connector right
  ellipse(480, 200, 12, 12);

  //line from circle connector right to top red triangle
  line(480, 200, 480, 220);

  //line connecting circle connectors
  line(394, 150, 480, 200);

  //top triangle (shape 1)
  fill(255, 0, 0);
  triangle(440, 220, 480, 260, 600, 220);

  //verticle line below triangle
  line(480, 260, 480, 300);

  //shape 2-quad
  fill(0);
  quad(480, 300, 520, 300, 540, 340, 430, 360);

  //verticle line connecting shape 2 to shape 3
  line(480, 350, 480, 380);

  //shape 3-quadrangle
  fill(250, 255, 2);
  quad(480, 380, 520, 400, 520, 460, 420, 420);

  //shape 4 -small square
  fill(255);
  rect(520, 480, 20, 20);

  //verticle line connecting shape4 (small square) to shape 3 (quad)
  line(520, 460, 520, 480);


  //verticle line connecting shape3 to to bottom triangle
  line(480, 444, 480, 480);

  //shape 5-bottom triangle
  fill(255, 0, 0);
  triangle(480, 480, 420, 480, 520, 540); 

}

}




