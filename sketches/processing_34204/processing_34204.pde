
int numbbub = 25;
float circleWidth = 70;


float centerX []= new float[numbbub];
float centerY []= new float[numbbub];
float speedX  []= new float[numbbub];
float speedY  []= new float[numbbub];
float imageX [] = new float[numbbub];
float imageY [] = new float[numbbub];

PImage chicks [] = new PImage[numbbub];
PImage hookah;
PImage wall;
PImage splash;

//boolean[]exists = new boolean[25]:  
boolean AddCircle  = true;

int num_of_circles = 0;

void setup() {
  size(500, 500); 

  hookah = loadImage( "hookah.png" );
  wall   = loadImage( "wall.jpg");
  wall.resize(width, height); 
  splash = loadImage("splatter2.png");
  noCursor();

  for (int i=0; i < numbbub;i++) {//int i = first space
    centerX [i]=(-200);
    centerY [i]=(-200);

    speedX  [i]=random(2);
    speedY  [i]=random(2);

    if (i%5 ==0) {
      chicks  [i]=loadImage("bigred1.png");
    } 
    else if (i%5 == 1) {
      chicks  [i]=loadImage("bigblue1.png");
    } 
    else if (i%5 == 2) {
      chicks  [i]=loadImage("biggreen1.png");
    } 
    else if (i%5 == 3) {
      chicks  [i]=loadImage("bigred1.png");
    } 
    else if (i%5 == 4) {
      chicks  [i]=loadImage("littleblue1.png");
    }
  }

  //  println(c);
}

void draw() {
  background(wall);


  for (int i=0; i < numbbub; i++) {

    // entire block inside if exists == true

    if ((imageX[i] != 0) && (imageY[i]!=0)) {
      //if imagex and y are set
      //draw the image
      image(splash, imageX[i]-40, imageY[i]-30);
    }
  }

  for (int i=0; i < numbbub; i++) {

    centerX[i]=centerX[i] + speedX[i];//speed x = how much it moves on the x axis
    centerY[i]=centerY[i] + speedY [i];
    /*
    ifthe ball is less than 50 then bounce left if the ball is greater than 550 bounce right
     if ball is 
     */
    if (centerX[i] < 0) { 
      speedX[i]= speedX[i]*-1;  //move left
    }
    else if (centerX[i] > width-50) {
      speedX[i] *= -1;//move right
    }
    if (centerY[i] < 0) {
      speedY[i]=speedY[i]*-1; //move down
    }
    else if (centerY[i] > height-50) {
      speedY[i]*= -1;
    } // move up 

    fill(255);
    //    ellipse(centerX[i], centerY[i], circleWidth, circleWidth);
    //    image(c, imageX[i], imageY[i]);
    image(chicks[i], centerX[i], centerY[i], circleWidth, circleWidth);
  }

  image(hookah, mouseX, mouseY);
}


void mousePressed() 
{
  // for i 
  // if check position of center against mouse position
  // change exists (booleans defined on top) to false

  if (AddCircle == true) {
    //bring cicle into screen
    centerX[num_of_circles] = mouseX;
    centerY[num_of_circles] = mouseY;
    num_of_circles += 1;
    if (num_of_circles > 24) num_of_circles = 0;
  }  
  else {
    //send circle off screen
    for (int i=0; i < numbbub; i++) {
      if ( dist(mouseX, mouseY, centerX[i], centerY[i]) < circleWidth*.5 ) {
        println(centerX[i]);
        imageX [i]=centerX[i];
        imageY [i]=centerY[i]; 
        centerX[i] = -200;
        centerY[i] = -200;
      }
    }

    //draw pmage splatter
  }
}

void keyPressed() {   
  if ( key == 'a') {
    AddCircle = false;
    hookah =loadImage("needle1.png");
  }
  if (key == 'k') {
    AddCircle = true;
    hookah = loadImage("hookah.png");
  }
}


