
//declare variables
int eye1= 330;
int eye2= 370;
int mouth=70;
int mouth2=20;
int arc2=95;
int mouth3=20;
int line1=35;

int y = 80;       // Vertical location of each line
int x = 50;       // Initial horizontal location for first line
int spacing = 10; // How far apart is each line
int len = 20;     // Length of each line
int totalSquares = 256; // var for how many squares you want on the screen, !! must be a square itself
int rectAlphaArray[][]; // create nested array that holds the rects alpha value
int colorArray[][]; // create nested array that holds the red color value


float eyeR;
float eyeG;
float eyeB;
float ballX;
float ballY;


float alphaChangeRate = 5; // rate of change for the alpha of the rects: i.e. higher # is faster


void setup() {
  size(700,600);
  frameRate(30);
  ballX = 400;      // ball always starts in the middle
  ballY = height + 100; 
  smooth();
  // creates a two dimensional array and stores the alpha value for each square
  rectAlphaArray = new int[floor(sqrt(totalSquares))][floor(sqrt(totalSquares))];
  for(int i=0; i < sqrt(totalSquares); i++){
    for(int j=0; j < sqrt(totalSquares); j++){
      rectAlphaArray[i][j] = 0;
      //println("rectpoint 1 of x="+i+", y="+j+" = ("+(i * (width/(sqrt(totalSquares))))+", "+(j * (height/(sqrt(totalSquares))))+")");
    }
  }
  colorArray = new int[floor(sqrt(totalSquares))][floor(sqrt(totalSquares))];
  for(int i=0; i < sqrt(totalSquares); i++){
    for(int j=0; j < sqrt(totalSquares); j++){
      colorArray[i][j] = int(random(100)+155);
    }
  }
}
// ball starts below the screen


void draw(){
  if(mouseX<width/2){
    background(200,232,30);
  }
  else{
    background (0);
  }

  dianaDraw();

  if(ballY< -20){
    ballY= height+20;
  }

  makeCircles(ballY);
  // ball moves up
  ballY = ballY - 1;

  // 75% opacity.
  noStroke();
  fill(255,0,0,100);
  rect(0,450,700,40);

  // 55% opacity.
  noStroke();
  fill(255,0,0,50);
  rect(0,500,700,40);

  // 25% opacity.
  noStroke();
  fill(255,0,0,20);
  rect(0,550,700,40);

  stroke(250,250,50);
  fill(250,250,40);
  rect(420,401,10,80);

  stroke(0);
  fill(0);
  ellipse(mouseX,mouseY-30,20,20);

  mattDraw();

}

// this creates the people and their reactions
void dianaDraw(){
  ellipseMode(CENTER);
  // shape 1
  stroke(255,100,0);
  line(300,10,400,10);
  line(300,10,300,300);
  line(300,300,400,300);
  // eyes

  if (mousePressed == true) {
    fill(60,130,0);
    ellipse(eye1+7,50,20,50);
    ellipse(eye2+9,50,10,50);
  } 
  else {
    fill(255,0,0);
    ellipse(eye1,50,20,50);
    ellipse(eye2,50,10,50);
  }

  stroke(255,0,0);
  fill(255,0,0);
  // shaope 2
  stroke(100,200,0);
  line(400,400,400,50);
  line(400,50,500,50);
  line(400,400,500,400);
  // eyes
  if (mousePressed == true) {
    fill(30,50,80);
    ellipse(250,320,50,mouth2+15);
  } 
  else {
    fill(250,150,40);
    ellipse(250,320,50,mouth2);
  }


  // third mouth
  if (mousePressed== true){
    fill(250,30,20);
    ellipse(450,330,mouth3+10,100);
    stroke(250,200,50);
  } 
  else {
    fill(150,180,20);
    ellipse(450,330,mouth3,100);
    stroke(150,200,50);
  }
  // shape 3
  stroke(200,50,250);
  line(300,80,200,80);
  line(200,80,200,350);
  line(200,350,300,350);
  // third eyes

  if (mousePressed == true) {
    fill(130,30,40);
    ellipse(440,mouth+4,10,50);
    ellipse(460,mouth+4,10,50);
  } 
  else {
    fill(10,200,0);
    ellipse(440,mouth,10,50);
    ellipse(460,mouth,10,50);
  }
  stroke(100,200,0);
  if (mousePressed == true){
    line(420,line1+9,430,25);
    line(480,line1+9,470,25);
  }
  else{
    line(420,line1,430,25);
    line(480,line1,470,25);
  }
  point(300, 200);
  stroke(255,100,0);
  fill(255,100,0);
  triangle(330, 280, 350, 260, 370, 280);

  eyeR = random(255);
  eyeG = random(255);
  eyeB = random(255);
  fill(eyeR,eyeG,eyeB);
  rect(220, 100, 10, 10);
  rect(270,100,10,15);
  stroke(250,100,100);

  point(30, 20);
  point(85, 20);
  point(85, 75);
  point(30, 75);
  stroke(250,250,50);
  fill(250,250,40);
  rect(99,200,100,10);
  stroke(250,250,50);
  fill(250,250,40);
  rect(220,351,10,100);
  rect(280,351,10,100);
  stroke(250,250,50);
  fill(250,250,40);
  rect(501,230,100,10);
  stroke(250,250,50);
  fill(250,250,40);
  rect(420,401,10,80);
  rect(480,401,10,80);
  noFill();
  stroke(250,100,50);
  if (mousePressed == true) {
    arc(230, arc2-15, 50, 40, PI, TWO_PI-PI/2);
    arc(270, arc2-15, 50, 40, TWO_PI-PI/2, TWO_PI);
  } 
  else {
    arc(230, arc2, 50, 40, PI, TWO_PI-PI/2);
    arc(270, arc2, 50, 40, TWO_PI-PI/2, TWO_PI);
  }
}


// this makes the "bubbles" that rise to the top of the screen
void makeCircles(float ballY){
  stroke(255);
  fill(55,60,100,50);
  ellipse(ballX-100,ballY-30,30,20); 
  // ball moves up

  stroke(255);
  fill(55,0,0,100);
  ellipse(ballX,ballY-20,20,20); 
  // ball moves up

  stroke(255);
  fill(100,160,10,100);
  ellipse(ballX-200,ballY-50,30,20); 
  // ball moves up

  stroke(255);
  fill(55,0,0,100);
  ellipse(ballX+200,ballY-60,20,20); 
  // ball moves up

  stroke(255);
  fill(55,60,100,50);
  ellipse(ballX-300,ballY-70,30,20); 
  // ball moves up

  stroke(255);
  fill(55,0,0,100);
  ellipse(ballX+300,ballY-20,20,20); 
  // ball moves up

  stroke(255);
  fill(100,160,10,100);
  ellipse(ballX-400,ballY-50,30,20); 
  // ball moves up

  stroke(255);
  fill(55,0,0,100);
  ellipse(ballX+400,ballY-40,20,20);

  stroke(255);
  fill(55,0,0,100);
  ellipse(ballX+100,ballY-40,20,20); 
}

void mattDraw(){
  noStroke();

  for(int x = 0; x < sqrt(totalSquares); x++){
    for(int y = 0; y < sqrt(totalSquares); y++){

      if((mouseX > (x * (width/(sqrt(totalSquares))))) && (mouseX < ((x * (width/(sqrt(totalSquares)))) + (width/(sqrt(totalSquares))))) && (mouseY > (y * (height/(sqrt(totalSquares))))) && (mouseY < ((y * (height/(sqrt(totalSquares)))) + (height/(sqrt(totalSquares)))))){
        rectAlphaArray[x][y] = 255;

      }
      else{
        if (rectAlphaArray[x][y] > 0) {
          rectAlphaArray[x][y] -= alphaChangeRate; 
        }
        fill(colorArray[x][y],91,131, rectAlphaArray[x][y]);
        ellipseMode(CORNER);
        ellipse(floor((x * (width/(sqrt(totalSquares))))), floor((y * (height/(sqrt(totalSquares))))), floor((width/(sqrt(totalSquares)))), floor((height/(sqrt(totalSquares)))));
      } 
    }
  }
}


