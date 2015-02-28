
String tenuto = "Path to Tenuto: North Section \n" + 
"Keep on the path and fight onions as you see them. All you really need to do \n" + 
"here is press on, though if you stand by the cliff next to the red flag, \n" +
"you’ll see a question mark over Polka’s head. Press A and \n" + 
"she’ll talk about the ocean. Get used to these question marks.\n" +
"Keep going to trigger a flashback scene with Polka and some of the locals. Aww.\n \n" +

"After the scene, you’ll be at a fork in the path. There is nothing to \n" +
"your right, so take the left path to find another chest and a few more onions.\n" +
"By now you should be a pro at fighting, so just collect the experience and \n" +
"head up the path to Tenuto Village.";



int charValue = 0;

int x = 0;
int y = 0;

int offsetX = 0;
int offsetY = 0;
int centerX = width/2;
int centerY = height/2;

float zoom = 0.2;


void setup()
{
  int[ ] coords = {
    40, 40, 80, 60, 100, 100, 60, 120, 50, 150
  };
  int i;

  size(900,900);
  background(255);
  smooth();

  centerX = 500;
  centerY = 100; 

  cursor(HAND);
  /*
  noFill();
   stroke(0);
   beginShape();
   
   
   curveVertex(40, 40); // the first control point
   curveVertex(40, 40); // is also the start point of curve
   curveVertex(80, 60);
   curveVertex(100, 100);
   curveVertex(60, 120);
   curveVertex(50, 150); // the last point of curve
   curveVertex(50, 150); // is also the last control point
   endShape();
   
   // use the array to keep the code shorter;
   // you already know how to draw ellipses!
   fill(255, 0, 0);
   noStroke();
   for (i = 0; i < coords.length; i += 2)
   {
   ellipse(coords[i], coords[i + 1], 3, 3);
   }
   */
}

void draw() {

  background (255);
  
  //mouse steuerung

  if (mousePressed == true) {
    centerX = mouseX-offsetX;
    centerY = mouseY-offsetY;
  } 
  
  //vocale zählen
   String vocalA = "a";
  int aIndex = tenuto.indexOf(vocalA);
  int aCount = 0;
  while(aIndex > -1) {
    aCount = aCount + 1;
    aIndex = tenuto.indexOf("a", aIndex+1);
  }


  String vocalE = "e";
  int wordIndex = tenuto.indexOf(vocalE);
  int eCount = 0;
  while(wordIndex > -1) {
    eCount = eCount + 1;
    wordIndex = tenuto.indexOf("e", wordIndex+1);
  }


  String vocalI = "i";
  int iIndex = tenuto.indexOf(vocalI);
  int iCount = 0;
  while(iIndex > -1) {
    iCount = iCount + 1;
    iIndex = tenuto.indexOf("i", iIndex+1);
  }


  String vocalO = "o";
  int oIndex = tenuto.indexOf(vocalO);
  int oCount = 0;
  while(oIndex > -1) {
    oCount = oCount + 1;
    oIndex = tenuto.indexOf("o", oIndex+1);
  }


  String vocalU = "u";
  int uIndex = tenuto.indexOf(vocalU);
  int uCount = 0;
  while(uIndex > -1) {
    uCount = uCount + 1;
    uIndex = tenuto.indexOf("u", uIndex+1);
  }

  //path zeichnen

  translate(centerX,centerY);
  scale(zoom);
  pushMatrix();

  stroke(0,100);
  fill(0,100);
  strokeWeight(random(5, 8));
  int i;
  for (i = 0; i< tenuto.length(); i++) 
  {
    char letter = tenuto.charAt(i);

    switch (letter) {
    case ' ':
      int dir = floor(random(0,1));
      if (dir == 0) {
        line(0,-15, floor(charValue*0.2),25);
        translate(1.9,0);
        rotate(PI/4);
      } 
      else {
        line(0,-15, floor(charValue*0.2),25);
        translate(13,-5);
        rotate(-PI/4);
      }
      break;
      
    case 'a':
      ellipse(0,0,aCount,aCount);
      translate(charValue*0.5, 0);
      break;
      
    default:
      ellipse(0,0, 10, 10);
      translate(charValue*0.5, 0);
    }
     

    charValue = tenuto.charAt(i);
    if (charValue > 200) {
      charValue = 200;
    }
    println(charValue + " " + x);


    //if (tenuto.charAt(i) == ' ') { 
    // stroke(0,0,0,random(50,100));
    //}
  }
   popMatrix();  
   
  pushMatrix();
  translate(centerX, centerY); //paralax effect nachschauen
  fill(0);
  text(tenuto,-500,1500);
  popMatrix();
}



void mousePressed() {
  offsetX = mouseX-centerX;
  offsetY = mouseY-centerY;
}

void keyPressed() {
  if (keyCode == UP) zoom += 0.05;
  if (keyCode == DOWN) zoom -= 0.05;
}


