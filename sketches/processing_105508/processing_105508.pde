
PFont font;
int start;
float welX, comeX, welcomeY, buttonWidth, buttonHeight, buttonBuffer;
color green, lightGreen;
boolean buttonOne, buttonTwo, buttonThree, buttonFour;
String entryText;
PImage zebra;
String activation;


//sin wave originally from processing.org
int xspacing = 10;   // How far apart should each horizontal location be spaced
int w;              // Width of entire wave
float theta = 0.0;  // Start angle at 0
float amplitude = 75.0;  // Height of wave
float period = 500.0;  // How many pixels before the wave repeats
float dx;  // Value for incrementing X, a function of period and xspacing
float[] yvalues;  // Using an array to store height values for the wave

//monitor text
float multiplier;
float monitorValues;
int monitorSpeed;
int startTime;

void setup() {
  size(720, 600);
  if (frame != null) {
    frame.setResizable(true);
  }
  font = loadFont("UbuntuMono-Regular-48.vlw");
  textFont(font);
  start = 1;
  welX = width*0.5-35;
  comeX = (width*0.5)+35;
  welcomeY = 0;
  buttonWidth = 70;
  buttonHeight = 20;
  buttonBuffer = 10;
  green = color(15, 255, 33);
  lightGreen = color(167, 255, 174);
  entryText = "user@workstation:";
  zebra = loadImage("zebra.jpg");
  activation = " Inactive";
  startTime = millis();


  //sin wave originally from processing.org
  w = 700;
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[w/xspacing];

  monitorSpeed = 1;
}

void draw() {

  background(0);
  fill(green);

  if (start == 1) {
    text("WEL", welX, welcomeY+100);
    text("COME", comeX, welcomeY+100);

    if (welcomeY < (height*0.5)) {
      welcomeY+= 2;
    } 
    else {
      welX -= 5;
      comeX += 5;
    }
    if (welX <= 0 || comeX >= width) { // put actions following welcome within this if statement


      background(0);
      fill(green);


      rect(10, buttonBuffer, buttonWidth, buttonHeight, 5); //top button
      rect(10, ((buttonBuffer*2)+(buttonHeight)), buttonWidth, buttonHeight, 5); //second button
      rect(10, ((buttonBuffer*3)+(buttonHeight*2)), buttonWidth, buttonHeight, 5); //third button
      rect(10, ((buttonBuffer*4)+(buttonHeight*3)), buttonWidth, buttonHeight, 5); //fourth button


      textSize(12);


      systemMonitor(); //live value updates



      fill(0);
      text("Terminal", 15, buttonBuffer + buttonHeight); //button one text
      text("Pattern", 15, 2*(buttonBuffer + buttonHeight)); //button two text
      text("Zebra", 15, 3*(buttonBuffer + buttonHeight)); //button three text
      text("Monitor", 15, 4*(buttonBuffer + buttonHeight)); //button four text
      fill(green);


      fill(0);
      stroke(green);
      rect(10+buttonWidth+20, 10, 600, 300); //main display box
      rect(300, 345, 400, 135);
      
      line(0, 599, 719, 599); //basic single line bottom border
      line(719, 599, 719, 0); //basic single line right border

//      for (int linez = 0; linez <= 500; linez +=10) { //bottom lines
//        line(10, 500, 10+linez, 700-linez/3);
//      }
//      for (int linezB = 0; linezB <=500; linezB +=10) {
//        line(700, 500, 10, 700-linezB) ;
//      }

      for (int abc = 0; abc <= 2000; abc +=10) { //border lines
        line(720, 600, 720+abc, 0+abc);
        line(720, 600, 0+abc, 600+abc);
        line(720+abc, 0, 720+abc, 0+abc);
        line(0, 600+abc, 0+abc, 600+abc);
      }
      
      for (int def = 20; def <= 700; def+=20) { //vertical lines at the bottom
        strokeWeight (5);
        strokeCap(SQUARE);
        line (def, 345+135+20, def, 345+135+20+80); 
        line(20, 345+135+20, 700, 345+135+20);
        strokeWeight(1);
      }
      
      if (mouseX > 300 && mouseX <700 && mouseY > 345 && mouseY <345+135) {
         line(mouseX, 345, mouseX, 345+135);
         line(300, mouseY, 700, mouseY); 
         activation = " Active";
          ellipse(mouseX, mouseY, 15, 15); 
         
         if (mousePressed) {
           noFill();
          rect(mouseX-10, mouseY-10, 20, 20); 
          line(mouseX-10,mouseY-10,mouseX+10, mouseY+10);
          line(mouseX+10,mouseY-10,mouseX-10,mouseY+10);
         }
      } else {
       activation = " Inactive"; 
      }


      //buttons change colors while mouse hovers over them
      if (mouseX >= 10 && mouseX <= (10+buttonWidth) && mouseY >= 10 && (mouseY <= 10 + buttonHeight)) {
        //button 1 activate
        fill(lightGreen);
        rect(10, buttonBuffer, buttonWidth, buttonHeight, 5);

        if (mousePressed) { //action for clicking 

          fill(lightGreen);
          buttonOne = true;
          buttonTwo = false;
          buttonThree = false;
          buttonFour = false;
        }
      }
      if (mouseX >= 10 && mouseX <= (10+buttonWidth) && mouseY >= (10+buttonHeight)  && (mouseY <= (2*(10 + buttonHeight)))) {
        //button 2 activate          
        fill(lightGreen);
        rect(10, ((buttonBuffer*2)+(buttonHeight)), buttonWidth, buttonHeight, 5);

        if (mousePressed) { //action for clicking 

          fill(lightGreen);
          buttonTwo = true;
          buttonOne = false;
          buttonThree = false;
          buttonFour = false;
        }
      }    
      if (mouseX >= 10 && mouseX <= (10+buttonWidth) && mouseY >= (2*(10+buttonHeight)) && (mouseY <= (3*(10 + buttonHeight)))) {
        //button 3 activate          
        fill(lightGreen);
        rect(10, ((buttonBuffer*3)+(buttonHeight*2)), buttonWidth, buttonHeight, 5);

        if (mousePressed) { //action for clicking 

          fill(lightGreen);
          buttonThree = true;
          buttonTwo = false;
          buttonOne = false;
          buttonFour = false;
        }
      }    
      if (mouseX >= 10 && mouseX <= (10+buttonWidth) && mouseY >= (3*(10+buttonHeight)) && (mouseY <= (4*(10 + buttonHeight)))) {
        //button 4 activate          
        fill(lightGreen);
        rect(10, ((buttonBuffer*4)+(buttonHeight*3)), buttonWidth, buttonHeight, 5);


        if (mousePressed) { //action for clicking 

          fill(lightGreen);
          buttonFour = true;
          buttonTwo = false;
          buttonThree = false;
          buttonOne = false;
        }
      }
    }

    if (buttonOne == true) { //button one action
      //fill(100,100,100);
      fill(green);
      paraBody();
    }

    if (buttonTwo == true) { //button two action
      //fill(150, 150, 150);

      for (int y = 20; y <= 300; y += 8) {  //repeating circles (modified code from Getting Started with Processing)
        for (float x = 70 + 45; x <= 694; x += 15) {
          ellipse(x, y, 16 - y/9.8, 16 - y/9.8);
        }
      }
    }

    if (buttonThree == true) { //button three action
      fill(200, 200, 200);
      image(zebra, buttonWidth+32, 12); //draw zebra image
    }

    if (buttonFour == true) { //button four action
      fill(green);
      calcWave();
      renderWave();

      fill(250, 250, 250);
    }
  }
}

void systemMonitor() {


  //monitor text
  text("System Temperature:  ", 20, 360); 
  text("Fan Speed:  ", 20, 380);
  text("Target X:  ", 20, 400);
  text("Target Y:  ", 20, 420);
  text("Targeting System:  ", 20, 440);
  text("X Coordinate:  ", 20, 460);
  text("Y Coordinate:  ", 20, 480);


  if (millis() >= startTime + 400) {
    startTime = millis();  
    //monitor variables
    monitorValues = random(-50, 1000);
  }

  text(monitorValues*5, 200, 360);
  text(monitorValues/5, 200, 380);
  text(monitorValues*4, 200, 400);
  text(monitorValues/100, 200, 420);
  text(activation, 200, 440);
  text(mouseX*1.001, 200, 460);
  text(mouseY*1.001, 200, 480);
}



void paraBody() {


  //entryText = entryText + key;
  text(entryText, buttonWidth+30, 20);    
  if (keyPressed) {
    entryText = entryText + key;
  }
}

void calcWave() {
  // Increment theta (try different values for 'angular velocity' here
  theta += 0.02;

  // For every x value, calculate a y value with sine function
  float x = theta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x)*amplitude;
    x+=dx;
  }
}

void renderWave() {
  noStroke();
  fill(green);
  // A simple way to draw the wave with an ellipse at each location
  for (int x = 11; x < yvalues.length; x++) {
    ellipse(x*xspacing, height/3.8+yvalues[x], 16, 16);
  }
}

