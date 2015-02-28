
int lastMouseX;
int lastMouseY;
color daColor = color(120, 133, 114);
color bgColor = color(200);
color black = color(0);
color white = color(255);

void setup() {
 size(640, 640);
 background(bgColor);
 smooth();
 
 //QUAD 1
 float total = 32*32;
 float counter1 = 0;
 float largestDist1 = dist(0, 0, 320, 320);
 int sizeVar1 = 10;
 for ( int xVar1 = 5; xVar1 < 320; xVar1+=sizeVar1 ) {
   for ( int yVar1 = 5; yVar1 < 320; yVar1+=sizeVar1 ) {
     noStroke();
     float distance1 = dist(xVar1, yVar1, 320, 320);
     color currentColor1 = lerpColor(daColor, white, distance1/largestDist1);
     fill(currentColor1);
     ellipse(xVar1, yVar1, sizeVar1, sizeVar1);
     counter1++;
     //println(counter);
   }
 }
 
 //QUAD 2
 int sizeVar2 = 10;
  for ( int xVar2 = 320; xVar2 < 640; xVar2+=sizeVar2 ) {
    for ( int yVar2 = 0; yVar2 < 320; yVar2+=sizeVar2 ) {
      fill(daColor, (((xVar2-320.0)/320)*255));
      stroke(200);
      rect(xVar2, yVar2, sizeVar2, sizeVar2);
    }
  }
  
  //QUAD 3
  int sizeVar3 = 10;
  int counter3 = 1;
  float largestDist3 = dist(0, 0, 0, 160);
  for ( int xVar3 = 0; xVar3 < 320; xVar3+=sizeVar3 ) {
     for ( int yVar3 = 320; yVar3 < 640; yVar3+=sizeVar3 ) {
       float distance3 = dist(xVar3, yVar3, 160, yVar3);
       color currentColor3 = lerpColor(daColor, bgColor, distance3/largestDist3);
       fill(currentColor3);
       if ( counter3 == 1 ) {
         rect(xVar3, yVar3+2, 6, 3);
       }
       else if ( counter3 == 2 ) {
         quad( xVar3, yVar3, xVar3+4, yVar3, xVar3+8, yVar3+7, xVar3+4, yVar3+7 );
       }
       else if ( counter3 == 3 ) {
         quad( xVar3+4, yVar3, xVar3+8, yVar3, xVar3+4, yVar3+7, xVar3, yVar3+7 );
       }
       counter3++;
       if ( counter3 > 3) counter3 = 1;
     }
      counter3 = 1;
  }

}

void draw() {
  
  //QUAD 4
  stroke(daColor);
  strokeWeight(0.25);
  if ( mouseX > 320 && mouseY > 320 ) {
    int numLines = round(random(1, 5));
    //println("Num lines = " + numLines);
    for ( int xVar4 = 0; xVar4 < numLines; xVar4++ ) {
      strokeWeight(random(.25, 3));
      float mDist = dist(mouseX, mouseY, lastMouseX, lastMouseY);
      line(mouseX + random(-mDist, mDist), mouseY + random(-mDist, mDist), mouseX + random(-mDist, mDist), mouseY + random(-mDist, mDist));
    }
  }
  lastMouseX = mouseX;
  lastMouseY = mouseY;
  
  //TEXT
  fill(black);
  noStroke();
  PFont font = loadFont("BraveNewEraG98-20.vlw"); 
  textFont(font, 30); 
  text("Pattern 1", 10, 310);
  text("Pattern 2", 330, 310);
  text("Pattern 3", 10, 630);
  text("Pattern 4", 330, 630);

}

