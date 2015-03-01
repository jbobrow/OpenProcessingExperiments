
ArrayList bubbles;
//ArrayList bubbles2a;
//Drag d;

PImage worryDoll;
PImage hands;
PFont f;
float ellipseY = 250;
Boolean screen1=false;
Boolean bubbles2 = false;

float ellipseY1 = 300;
float ellipseY2 = 350;
float e1Y = 400;
float e2Y = 600;
float e1W = 250;
float e1H = 250;
float e3Y = 500;

//bubbles on second page
PImage img;
int numObj=10;
//
//float[] bubbleH = new float[numObj];
//float[] bubbleW = new float[numObj];
//float[] posX = new float[numObj];
//float[] posY  = new float[numObj];
//float[] hue = new float[numObj];
//float[] speedX = new float[numObj];
//float[] speedY= new float[numObj];
//Boolean[] isMoving = new Boolean[numObj];
//float gravity;

// Variable to store text currently being typed
String typing = "";
int call = 0;
String[] numbers = new String[10];
//Boolean recall=false;
int q=20;

// Variable to store saved text when return is hit
String saved="";
int i=0;

void setup() {

  size (900, 900);
  worryDoll = loadImage("worrydoll3.png");
  hands = loadImage("hands.png");
  img = loadImage("pop.png");
  screen1 = false;
  bubbles2=false;

  //saved text array
  numbers[0]="";
  numbers[1]="";
  numbers[2]="";
  size(900, 900);
  f = createFont("HelveticaNeue-Light", 16, true);

  bubbles = new ArrayList();
  //  d = new Drag(worryDoll,280,360);

  //bubbles on second page
  //  for (int i=0; i<numObj; i++) {
  //    bubbleW[i] = bubbleH[i]=random(30, 120);
  //    posX[i] = random(width);
  //    posY[i] = random(height-100);
  //    hue[i]=random(120, 173);
  //    speedY[i]=0;
  //    speedX[i]=0;
  //    isMoving[i]= false;
  //  }
  //hasGravity = false;
  //  gravity = -0.02;
}


//DRAW//

void draw() {
  background(255);
  image(hands, 15, 450);
  image(worryDoll, 280, 350);

  // Set the font and fill for text
  textFont(f);
  fill(0);

  // Display everything  
  textAlign(LEFT);
  text("Type your worry on the screen.", 540, 600);
  text("Hit return to speak your worry to the doll.", 540, 620);

  text(typing, 500, 700, 300, 200);
  //  text(saved,indent,130);
  if (i>0) {
    text(numbers[i-1], 500, 900); //return the previous index
  } else {
    text(numbers[i], 500, 900);
  }

  //  if (recall==true) {
  //    //text display for bubbles
  //    text(numbers[i-1], 400,ellipseY);
  //    //this is working - need to figure out how to restart shape
  ////  text(numbers[1], 200, 150);
  //    stroke(255);
  //    strokeWeight(3);
  //    fill(255,20);
  //    ellipse(400,ellipseY,250,250);
  //    ellipseY=ellipseY-.9;
  //  }

  for (int i=bubbles.size ()-1; i>=0; i--) {
    Bubble b = (Bubble) bubbles.get(i);
    b.floatup();
    b.display();

    if (b.PosY>height) {
      bubbles.remove(i);
    }
  }

  //d.drag(mouseX, mouseY);
  //d.display();

  screen1True();
  bubbles2True();
  //  

  if (mouseX>280 && mouseX<496 && mouseY>350 && mouseY<710) {
    tint(255, 255, 225, 250);
    image(worryDoll, 280, 350);
    image(worryDoll, 280, 350);
  }


  if (mousePressed && mouseX>280 && mouseX<496 && mouseY>350 && mouseY<710)
    screen1 = true;
  //  }
}

//FUNCTIONS//

void textDisplay() {
  // Set the font and fill for text
  textFont(f);
  fill(0);

  // Display everything  
  text("Type your worry on the screen.", 540, 600);
  text("Hit return to speak your worry to the doll.", 540, 620);

  text(typing, 500, 700, 780, 790);
  //  text(saved,indent,130);
  if (i>0) {
    text(numbers[i-1], 500, 700); //return the previous index
  } else {
    text(numbers[i], 500, 700);
  }
}

void keyPressed() {
  if (key=='0') {
    //switch to true and then you can recall text by pressing keys 0-9
    //    recall=true;
  } else { 
    // If the return key is pressed, save the String and clear it
    if (key == '\n' ) {
      numbers[i] = typing;
      bubbles.add(new Bubble(numbers[i]));

      // A String can be cleared by setting it equal to ""
      typing = "";

      i++; //if hit enter moves to the next index
    } else {
      // Otherwise, concatenate the String
      // Each character typed by the user is added to the end of the String variable.
      typing = typing + key;
    }
  }
}

//function to go to screen 2: boolean screen1
void screen1True() {
  if (screen1==true) {
    background(255);
    image(hands, 15, 450);
    image(worryDoll, 280, 350);
    bubbles2=true;
  }
}

void bubbles2True() {
  if (bubbles2==true) {
    //        for (int i = ; i < numbers.length; i++){
    stroke(255);
    fill(random(100, 160), 255, 255, 50); 
    ellipse(250, e1Y, e1W, e1H);
    fill(0);
    textAlign(CENTER);
    text(numbers[0], 125, e1Y-10, e1W-10, e1H-10);
    e1Y=e1Y-.8;

    if (mousePressed && mouseX>250 && mouseX<500 && mouseY>e1Y && mouseY<e1Y+125) {
      e1W = e1W-100;
      e1H = e1H-100;
    }

    stroke(255);
    fill(random(100, 160), random(100, 160), 255, 50); 
    ellipse(600, e2Y, 250, 250);
    fill(0);
    textAlign(CENTER);
    text(numbers[1], 475, e2Y-10, 240, 240);
    e2Y=e2Y-.6;

    stroke(255);
    fill(random(100, 160), random(100, 160), 255, 50); 
    ellipse(200, e3Y, 250, 250);
    fill(0);
    textAlign(CENTER);
    text(numbers[2], 75, e3Y-10, 240, 240);
    e3Y=e3Y-.6;
  }
}


/////////////////////////CRAP////////////////////////////
//        for (int i=0; i<numObj; i++) {
//          float distance = dist(mouseX, mouseY, posX[i], posY[i]);
//          //println(distance);
//
//          noStroke();
//          if (distance<bubbleH[i]/2 && !isMoving[i]) {
//            fill(hue[i], 150, 255, 40);
//            isMoving[i]=true;
//            speedX[i]=(mouseX-pmouseX)/100;
//            // hasGravity=true;
//          } else {
//            fill(hue[i], 255, 255, 40);
//            //    hasGravity=false;
//          }
//
//          strokeWeight(2);
//          stroke(255);
//          ellipse(posX[i], posY[i], bubbleW[i], bubbleH[i]);
//          //println(bubbleW[i]);
//
//
//          if (isMoving[i]) {
//            posX[i]=posX[i]+speedX[i];
//            posY[i]=posY[i]+speedY[i];
//            speedY[i]=speedY[i]+gravity;
//          }
//
//          if (posX[i]>width) {
//            posX[i]=width;
//            speedX[i]=speedX[i]*-0.8;
//          }
//
//          if (posX[i]<0) {
//            posX[i]=0;
//            speedX[i]=speedX[i]*-0.8;
//          }
//
//          if (posY[i]>height-bubbleH[i]/2) {
//            posY[i]=height-bubbleH[i]/2;
//            speedY[i]=speedY[i]*-0.8;
//            if (abs(speedY[i])<3) {
//              speedY[i]=0;
//            }
//          }
//
//          float myDist = dist(posX[i], posY[i], mouseX, mouseY);
//          float bubW = bubbleW[i];
//          //println(bubbleW[i]);
//          if (mousePressed) { 
//            if (myDist < bubW) {
//              bubbleW[i]=bubbleW[i]-bubbleW[i];
//              bubbleH[i]=bubbleH[i]-bubbleH[i];
//
//              image(img, posX[i], posY[i]);

//   for(i = 0; i<10; i++);
//    ellipse(300,ellipseY1,200,200);
//    ellipseY1--;
//    
//    ellipse(500, ellipseY2,220,220);
//    ellipseY2=ellipseY2-.8;
//            }
//          }

//void mousePressed(){
//d.clicked(mouseX,mouseY);
//}
//void mouseReleased(){
//d.stopDragging();
//}
//        }
//      }
//      void delay(int delay)
//      {
//        int time = millis();
//        while (millis () - time <= delay);
//      }
//////////END CRAP CODE///////////////////

class Bubble {
  float PosX;
  float PosY;
  String worryText;
  
Bubble(String iworryText){
  worryText=iworryText;
  PosX = 400;
  PosY = ellipseY;
  println(worryText);
}

void floatup(){
  PosY=PosY-.4;
}

void display(){
        textAlign(CENTER);
        text(worryText, 280, PosY-25,250,250);
        
        //  text(numbers[1], 200, 150);
        stroke(0, 0, 255, 50);
        strokeWeight(3);
        fill(random(100,110), random(100,153), 255, 50);
        ellipse(PosX, PosY, 300, 300);
}
}


