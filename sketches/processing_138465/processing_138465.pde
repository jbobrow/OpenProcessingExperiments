
//SOME MATH FUNCTIONS//
float checkDist(PVector a, PVector b) {
  float tempX, tempY, distOut;

  tempX = a.x - b.x;
  tempY = a.y - b.y;

  tempX = pow(tempX, 2);
  tempY = pow(tempY, 2);

  distOut = tempX + tempY;
  return sqrt(distOut);
}

//Get slope as normalized vector
PVector slope(PVector a, PVector b) {
  //a is CircCenter
  //b is MousePos

  PVector tempVec = PVector.sub(b, a);
  tempVec.normalize();

  return tempVec;
}


//TV SCREEN CODE//




public class Rect {
  float x, y, rWidth, rHeight, tWidth, tHeight;
  float r;
  boolean on, full = false;

  int count = 0;
  public Rect(float x_, float y_, float width_, float height_, float r_) {
    x = x_;
    y = y_;
    tWidth = width_;
    tHeight = height_;
    rWidth = width_;
    rHeight = height_;
    r = r_;
  }

  void drawR() {
    if (on) {
      if (!full) {
        if (rHeight < tHeight/4) {
          rWidth += 6;
          rHeight +=2;
        }
        else if (rWidth < tWidth/2) {
          rWidth += 6;
          rHeight += 6;
        }
        else {
          rWidth += 10;
          rHeight += 15;
        }
        rect(x, y, rWidth, rHeight, r);
        if (rWidth>tWidth) {
          rWidth = tWidth;
          rHeight = tHeight;
          full = true;
        }
      }
      else {
        fill(40, 155, 88);
        stroke(82, 187, 117);
        strokeWeight(2);

        rect(x+4.5, y+4.5, rWidth, rHeight+5, r);
        fill(255);
        noStroke();
        //stroke(200);
        strokeWeight(1);

        //EYES
        //rect(x-15,y-15,11,10);
        // rect(x+15,y-15,10,15);
        drawEyes(j, k);

        //MOUTH

        rect(x+35, y+180, 20, 20);

        rect(x+35, y+200, tWidth-63, 20);
        rect(444.5, y+180, 20, 20);
        //println(tWidth-63);
        //233.5

        //231 + 233.5 - 20
        count ++;

        /* if (count > 75) {
         
         on = false;
         full = false;
         rWidth = 1;
         rHeight = 1;
         count = 0;
         }*/
      }
    }
  }

  void drawEyes(float guyX, float guyY) {
    float circumfrence = 60;
    PVector mouseVec = new PVector(guyX, guyY);


    //Center point for eyes
    PVector lEye = new PVector(x + 65, y +70);
    PVector rEye = new PVector(x + 220, y +65);

    //PVector to draw actual eye pos
    PVector lPup, rPup;


    //Left eye follow
    if (checkDist(lEye, mouseVec) < circumfrence/2) {
      lPup = new PVector(mouseX, mouseY);
    }
    else {
      PVector tempVecL  = slope(lEye, mouseVec);
      tempVecL.mult(circumfrence/2);
      tempVecL = PVector.add(lEye, tempVecL);
      lPup = new PVector(tempVecL.x, tempVecL.y);
    }


    //Right eye follow
    if (checkDist(rEye, mouseVec) < circumfrence/2) {
      rPup = new PVector(mouseX, mouseY);
    }
    else {
      PVector tempVecR = slope(rEye, mouseVec);
      tempVecR.mult(circumfrence/2);
      tempVecR = PVector.add(rEye, tempVecR);
      rPup = new PVector(tempVecR.x, tempVecR.y);
    }



    rect(lPup.x, lPup.y, 25, 25);
    rect(rPup.x, rPup.y+5, 25, 35);
  }
}






//SKETCH//

PShape bg;
Rect tvFace;


void setup() {
  size(700, 700);
  noStroke();
  smooth();
  bg = loadShape("room.svg");
  tvFace  = new Rect(196, 100, 296.5, 245, 7);
  tvFace.on = true;
}

void draw() {
  background(200, 200, 200);
  shape(bg, 0, 0);

  noStroke();
  fill(50, 50, 100);

  //quad(20,395,680,395,710,700,-10,700);
  fill(100, 100, 150);
  //quad(176,0,512.5,0,513.5,512,181,512);

  fill(12, 11, 13);
  stroke(40, 47, 55);
  strokeWeight(8);
  //rect(40, 30, 620, 345);
  tvFace.drawR();
  SENSEI();
}

float l = .8;
public int j = 100;
public int k = 400;



void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      j = j-10;
    } else if (keyCode == RIGHT) {
      j = j+10;
  }
    if (keyCode == UP) {
      l = l-(.01);
    } else if (keyCode == DOWN) {
      l = l+(.01);
}
}
}
 

void SENSEI(){
 
scale(l);
 fill(0,200,150);
//rightfoot/
quad(j+70,k+250,j+95,k+250,j+60,k+270,j+35,k+270);
 
//leftfoot/
quad(j+105,k+250,j+130,k+250,j+155,k+270,j+130,k+270);
 
 fill(0,60,100);
//pants//
rect(j+70,k+150,25,100);
rect(j+105,k+150,25,100);
 
//neckline//
triangle(j+80,k+30,j+120,k+30,j+100,k+60);

fill(200,50,90);
//torso//
rect(j+70,k+30,60,140,15,15,0,0);
 
 fill(200,150,20);
//belt//
rect(j+70,k+130,60,10);
 
 
 fill(120,60,140);
// face //
ellipse(j+100,k,50,65);
 
 
 fill(255,0,0);
// left eke //
ellipse(j+90,k,10,3);
 
 fill(0,0,255);
// right eke //
ellipse(j+110,k,10,3);
 
 
 fill(200,50,90);
// hat //
ellipse(j+100,k-20,60,30);
rect(j+80,k-65,40,50,5,5,15,15);
 
 
  fill(170,110,190);
//nose//
arc(j+100,k+10, 10, 5, 0, PI, OPEN);
 
 fill(255);
//smile//
arc(j+100, k+20, 20, 10, 0, PI);
 fill(120,60,140);
//righthand//
ellipse(j+92,k+93,20,25);
 
line(j+94,k+92,j+101,k+92);
line(j+94,k+96,j+100,k+96);
line(j+94,k+88,j+100,k+88);
 
//lefthand//
rect(j+102,k+60,8,43,60,60,0,20);
 fill(200,50,90);
//rightarm//
quad(j+70,k+80,j+70,k+40,j+50,k+100,j+50,k+130);
 
quad(j+50,k+100,j+50,k+130,j+90,k+110,j+90,k+80);
 
//left arm//
quad(j+130,k+80,j+130,k+40,j+150,k+100,j+150,k+130);
  
quad(j+110,k+110,j+110,k+80,j+150,k+100,j+150,k+130);
 fill(255);
}



