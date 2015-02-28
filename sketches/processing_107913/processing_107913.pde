
int count = 510;
int level = 0;
int[] x = new int[count];
int[] y = new int[count];
PImage moocWorld;
PImage astro;
PImage moocStart;
PImage meteor;
PImage astro2Fire;
PImage astro2Dead;
PFont calibri;
String[]displayString = new String [8];

//meteorite variables
int meteorX= 980;
int meteorY=10;
int xSpeed=-15;
int ySpeed=15;

//supernova variables
boolean start= false;
float goTime;
float superX= 600;
float superY= 500;
float superSpeedX=-2.25;
float superSpeedY=-1.25;
float superX2= 600;
float superY2= 500;
float superSpeedX2=1.5;
float superSpeedY2=0.25;

void setup () {
  size(1000, 800);
  colorMode(HSB, 360, 100, 100);
  //  background(300, 100, 100);
  for (int i=0; i<count; i++) {
    x[i]= int(random(0, width));
    y[i]= int(random(0, height));
  }
   
  moocWorld = loadImage("moocWorldBig.jpg");
  moocStart = loadImage("moocWorldBigStart.jpg");
  astro = loadImage("astro2.png");
  meteor = loadImage("meteor.png");
  astro2Fire = loadImage("astro2Fire.png");
  astro2Dead = loadImage("astro2Dead.png");
  calibri = loadFont("Calibri-20.vlw");
  displayString[0] = "Case Study: A free online 'Bioelectricity' class was offered by\nDuke University in Fall 2012. Click the World to get started";
  displayString[1] = "This is the Mooc Galaxy.\nClick the Mooc World to Open Enrollment";
  displayString[2] = "12,725 Mooconauts from all over the world have enrolled in 'Bioelectricity'. \nEach Mooconaut represents 25 students. \nClick the Mooc World again to begin the class";
  displayString[3] = "4,964 Mooconauts drift off into outer space without ever watching a lecture.\nClick the Mooc World to take the First Quiz.";
  displayString[4] = "4,013 Mooconauts are struck by Meteorites and never make it to the quiz.\n3,658 Mooconauts remain. Click the Mooc World to attempt the Final Exam";
  displayString[5] = "Another 3,313 Mooconauts are sucked into blackholes. Only 345 Mooconauts \nattempt the final. Click the Mooc World to see if they passed";
  displayString[6] = "Aside from a couple of supernovas, the Mooconauts are successful. \n313 Mooconauts pass! Click the Mooc World again";
  displayString[7] = "Out of the 12,725 Mooconauts enrolled in 'Bioelectricity', \n313 successfully completed the course.";
}

void draw() {

  image (moocWorld, 0, 0, width, height);

  if (level==0) {
    image (moocStart, 0, 0, width, height);
    int textW = int(textWidth(displayString[level]));
    fill(0);
    rect(40, 705, textW+20, 35);
  }

  if (level==1) {
    int textW = int(textWidth(displayString[level]));
    fill(0);
    rect(40, 705, textW+20, 35);
  }

  //this is the start of level 2
  if (level==2) {

    for (int i=0; i<count; i++) {
      x[i] += int(random(-2, 2));
      y[i] += int(random(-2, 2));

      image (astro, x[i], y[i], 35, 35);

      //    drawSmiley (x[i], y[i]);
      //      smooth();
      //      fill(51, 100, 100);
      //      ellipse(x[i], y[i], 30, 30);
      //      fill(0);
      //      ellipse(x[i]-5, y[i]-4, 2, 2);
      //      ellipse(x[i]+5, y[i]-4, 2, 2);
      //      stroke(0);
      //      strokeWeight(1);
      //      noFill();
      ////      line(x[i]-7, y[i]+4, x[i]+7, y[i] +4);
      //      bezier(x[i]-7, y[i]+4, x[i]-3, y[i]+6, x[i]+3, y[i]+6, x[i]+7, y[i]+4);

      //    containment
      if (y[i] <= 0) {
        y[i]= 10;
      }
      if (y[i] >= height) {
        y[i]= height-10;
      }
      if (x[i] <= 0) {
        x[i]= 10;
      }
      if (x[i] >= width) {
        x[i]= width-10;
      }
    }
    int textW = int(textWidth(displayString[level]));
    fill(0);
    rect(40, 705, textW+20, 35);
    rect(40, 735, textW+20, 35);
  }

  //  This is the start of level 3 ...drift away
  if (level==3) {
    for (int i=0; i<312; i++) {
      x[i] += int(random(-2, 2));
      y[i] += int(random(-2, 2));

      image (astro, x[i], y[i], 35, 35);

      //    containment
      if (y[i] <= 0) {
        y[i]= 10;
      }
      if (y[i] >= height) {
        y[i]= height-10;
      }
      if (x[i] <= 0) {
        x[i]= 10;
      }
      if (x[i] >= width) {
        x[i]= width-10;
      }
    }
    for (int i=313; i<count; i++) {
      if (x[i]>= width/2 && y[i] >= height/2) { 
        x[i] += int(random(0, 4));
        y[i] += int(random(0, 4));
      }
      if (x[i]>= width/2 && y[i] <= height/2) { 
        x[i] += int(random(0, 4));
        y[i] += int(random(-4, 0));
      }
      if (x[i]< width/2 && y[i] <= height/2) { 
        x[i] += int(random(-4, 0));
        y[i] += int(random(-4, 0));
      }
      if (x[i]< width/2 && y[i] >= height/2) { 
        x[i] += int(random(-4, 0));
        y[i] += int(random(0, 4));
      }
      image (astro, x[i], y[i], 35, 35);
      //       fill(320,100,100);
      //      ellipse(x[i], y[i], 30, 30);
    }
    int textW = int(textWidth(displayString[level]));
    fill(0);
    rect(40, 705, textW+20, 35);
  }

  //    This is the start of level 4 ....meteroites
  if (level==4) {
    for (int i=0; i<146; i++) {
      x[i] += int(random(-2, 2));
      y[i] += int(random(-2, 2));

      image (astro, x[i], y[i], 35, 35);

      //    containment
      if (y[i] <= 0) {
        y[i]= 10;
      }
      if (y[i] >= height) {
        y[i]= height-10;
      }
      if (x[i] <= 0) {
        x[i]= 10;
      }
      if (x[i] >= width) {
        x[i]= width-10;
      }
    }

    //    burning astronauts
    for (int i=147; i<312; i++) {

      x[i]+=xSpeed+10;
      y[i]+=ySpeed-10;    
      //      fill(320,100,100);
      image(astro2Fire, x[i], y[i], 78, 117);
    }

    meteorX+=xSpeed;
    meteorY+=ySpeed;

    image(meteor, meteorX, meteorY, 350, 350);
    image(meteor, meteorX, meteorY-400, 550, 550);
    image(meteor, meteorX+300, meteorY+100, 300, 300);
    image(meteor, meteorX-400, meteorY-300, 200, 200);
    image(meteor, meteorX-200, meteorY-500, 400, 400);
    image(meteor, meteorX+600, meteorY-600, 500, 500);
    image(meteor, meteorX+500, meteorY-800, 300, 300);
    image(meteor, meteorX+600, meteorY-1100, 250, 250);



    int textW = int(textWidth(displayString[level]));
    fill(0);
    rect(40, 705, textW+20, 35);
  }


  //    This is the start of level 5 .... black holes
  if (level==5) {
    for (int i=0; i<14; i++) {
      x[i] += int(random(-2, 2));
      y[i] += int(random(-2, 2));

      image (astro, x[i], y[i], 35, 35);

      //    containment
      if (y[i] <= 0) {
        y[i]= 10;
      }
      if (y[i] >= height) {
        y[i]= height-10;
      }
      if (x[i] <= 0) {
        x[i]= 10;
      }
      if (x[i] >= width) {
        x[i]= width-10;
      }
    }
    for (int i=16; i<145; i++) {
      if (x[i]>= width/2 && y[i] >= height/2) { 
        x[i] += int(random(3, 5));
        y[i] += int(random(3, 5));
      }
      if (x[i]>= width/2 && y[i] <= height/2) { 
        x[i] += int(random(3, 5));
        y[i] += int(random(-5, -3));
      }
      if (x[i]< width/2 && y[i] <= height/2) { 
        x[i] += int(random(-5, -3));
        y[i] += int(random(-5, -3));
      }
      if (x[i]< width/2 && y[i] >= height/2) { 
        x[i] += int(random(-5, -3));
        y[i] += int(random(3, 5));
      }

      image (astro, x[i], y[i], 35, 35);
      fill(0, 200);
      ellipseMode(CORNER);
      ellipse(x[i]-15, y[i]-15, int(random(60, 100)), int(random(60, 100)));
      //            fill(0,150);
      //            ellipseMode(CORNER);
      //            ellipse(x[i]-25, y[i]-25, int(random(50,100)), int(random(50,100)));
    }
    int textW = int(textWidth(displayString[level]));
    fill(0);
    rect(40, 705, textW+20, 35);
  }

  //    this is the start of level 6  .... supernovas
  if (level==6) {

    for (int i=0; i<15; i++) {
      x[i] += int(random(-2, 2));
      y[i] += int(random(-2, 2));

      if (i==3 || i==5) {
        //supernovas are created   
        if (start ==true) {
          float time = (millis()-goTime)/2000.0;
          //    sine is my master time variable
          float sine = cos(time);
          println (time);

          float radius = map(sine, -1, 1, 800, 1);
          float hue =map( sine, -1, 1, 360, 185);
          noStroke();
          colorMode(HSB, 360, 100, 100);
          fill(hue, 100, 100);
          ellipse(x[i], y[i], radius, radius);
          ellipse(x[i], y[i], radius, radius);

          x[i]+=superSpeedX;
          y[i]+=superSpeedY;
        }
      }
      else {
        image (astro, x[i], y[i], 35, 35);

        //    containment
        if (y[i] <= 0) {
          y[i]= 10;
        }
        if (y[i] >= height) {
          y[i]= height-10;
        }
        if (x[i] <= 0) {
          x[i]= 10;
        }
        if (x[i] >= width) {
          x[i]= width-10;
        }
      }
    }
    
    //    pink balls
    //            colorMode(HSB, 360,100,100);
    //            fill(359,100,100);
    //            ellipse(x[i], y[i], 400, 400);
    //    }
    
    int textW = int(textWidth(displayString[level]));
    fill(0);
    rect(40, 705, textW+20, 35);
  }       

  //  This is the start of level 7 ... display final results
  
  if (level==7) {
    
    for (int i=0; i<13; i++) {
      x[i] += int(random(-2, 2));
      y[i] += int(random(-2, 2));

      image (astro, x[i], y[i], 35, 35);  
    }
  
    float centerX = width/2+20;
    float centerY = height/2;

  for (int i = 0; i < 500; i++) {
//the 200 number is distacne from center of the world
    float radius = 200 + i * 6;
//    10 is the multiplier that determine space between dudes
//to slow it down increase the 1500 after millis
    float angle = millis() / 3000.0 * (1 + i / 12.0);
    //float angle = millis() / 1000.0;
    float x = centerX + radius * cos(angle);
    float y = centerY + radius * -sin(angle);

//    rect(x, y, 10, 10);
    image (astro2Dead, x, y, 35, 35);  
    }
    int textW = int(textWidth(displayString[level]));
    fill(0);
    rect(40, 705, textW+20, 35);
  }


  int textW = int(textWidth(displayString[level]));
  fill(0);
  rect(40, 674, textW+20, 32);
  textFont(calibri, 24);
  fill(60, 100, 100);
  text(displayString[level], 50, 700);
} 

void mouseClicked() {
  float distance;
  distance = dist(mouseX, mouseY, 545, 440);
  if (distance < 175) {
    level++;
    if(level>7){
      level=0;
    }
    println(level);

    if (level==6) {
      start = true;
      goTime = millis();
    }
    
    if (level==7){
    for (int i=0; i<13; i++) {
    x[i]= int(random(440, 620));
    y[i]= int(random(310, 500));
  }
    
    }
    //    circle to determine distance 
    //  ellipseMode(CENTER);
    //  ellipse(550, 440, 300,300);
  }
}



