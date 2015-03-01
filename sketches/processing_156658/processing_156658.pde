
float diX;
float diY;
float rectX;
float rectY;
float step;
float colorM;
float colorY;
float colorZ;
float motion;
float easing = 0.001;
float realX;
float realY;
float round;

void setup() {

  size(500, 500); // canvas size
  frameRate(60);
}


void draw() {



  background(255);

  colorM = map(mouseX, 0, width, 0.6, 0.7); //map mouse xy to color range
  colorY = map(mouseX, 0, height, 0.6, 0.7);
  colorZ = colorM + colorY;

  float targetX = mouseX;
  float targetY = mouseY;

  diX = width/2 - mouseX;//distance from mouse to center
  diY = height/2 - mouseY;


  rectMode(CENTER);

  for (float i = 2000; i > 0; i = i - 50) {//draw 40 squares

    step = i/200;//set how much more every square below moves

    if (mousePressed == true) { 
      i = i - 100;
     
    }

    noStroke();

    fill(mouseX/2 + step*30, mouseY/2 + step*30, mouseX - mouseY/3 - step*30);

    rectX += ((targetX - rectX)*easing);
    rectY += ((targetY - rectY)*easing);
    println(rectX , diX, diX*step);
    realX = rectX -diX*step;
    realY = rectY -diY*step;
    round = map(diX,-250,250,0,i/4);
    rect(realX, realY, i, i , round);
  }
}



