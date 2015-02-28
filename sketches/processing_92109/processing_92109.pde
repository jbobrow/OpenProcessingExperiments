
//This version change ui of nims and component 26/02/2013
//02 - adding auto into the version 27,2,2012

int squareSize = 3;//setup square size 3,4,5,6 - default
int totalBox = squareSize*squareSize;
int smallestSquare = 3;
int rectSize = 30;
int rectGap = 2;
int merah = #FA1414;
int backgroundColor = 200;
int component = 4;// bilangan compenent 3,4,5,6
boolean [][] status = new boolean[squareSize][squareSize];
boolean [][] pangkah = new boolean[squareSize][squareSize];
int bilPangkah = 0;//bilangan kotak yg dah kene pangkah
boolean release = true;//release mouse to avoid to many increase
boolean giliran = true;
boolean win = true;


void setup() {
  size(160, 190);
  background(backgroundColor);
  noStroke();
}///setup


void draw() {

  background(backgroundColor);
  rectSize = (width-30)/squareSize;

  //prepare for renew status
  //status = new boolean[squareSize][squareSize];
  
 
  //System.out.println("start");
  banner();
  //System.out.println("banner");
  draw_big_rect();
  //System.out.println("drawbig");
  draw_rect();
  //System.out.println("drawrect");
  reset_btn();

  //System.out.println("resetbtn");
  winner();
  //System.out.println("winner");
}//draw

void draw_rect() {
  pushMatrix();
  fill(150);
  translate(width/2-((rectSize*squareSize)/2 + (rectGap*(squareSize-1)/2)), height/2-((rectSize*squareSize)/2 + (rectGap*(squareSize-1)/2)));
  for (int i = 0; i< squareSize; i++) {
    for (int j = 0; j < squareSize; j++) {
      stroke(0);
      fill(150);
      if (overRect(i*(rectSize + rectGap)+(width/2-((rectSize*squareSize)/2 + (rectGap*(squareSize-1)/2))), j*(rectSize + rectGap)+(height/2-((rectSize*squareSize)/2 + (rectGap*(squareSize-1)/2))), rectSize, rectSize)) {
        fill(120);
        if (mousePressed) {
          if (release && !status[i][j]) {
            if (pangkah[i][j]) {
              pangkah[i][j] = false;
              bilPangkah--;
            }
            else {
              if (bilPangkah < squareSize) {
                pangkah[i][j] = true;
                bilPangkah++;
              }//if
            }//else
          }//if release
          release = false;
        }//mousepressed change cross
      }//if overrect
      if (status[i][j]) {
        fill(backgroundColor);
        stroke(backgroundColor);
      }// if dont show
      rect(i*(rectSize + rectGap), j*(rectSize + rectGap), rectSize, rectSize);
      if (pangkah[i][j] && !status[i][j]) {
        if (!giliran) {
          stroke(255);
        }
        draw_x(i, j);
      }//if x
    }//inner for loop
  }//end for loop
  popMatrix();
}//draw_rect

void draw_big_rect() {
  noFill();
  stroke(255);
  if (!giliran) {
    stroke(0);
  }//if
  rect(width/2-((rectSize*squareSize)/2 + (rectGap*(squareSize+1)/2)), height/2-((rectSize*squareSize)/2 + (rectGap*(squareSize+1)/2)), ((rectSize*squareSize) + (rectGap*(squareSize+1))), ((rectSize*squareSize) + (rectGap*(squareSize+1))));
}//draw big rect

void take_btn() {
  int w = 55;
  int h = 18;

  textAlign(CENTER, CENTER);
  fill(80);
  if (overRect(width/2+((rectSize*squareSize)/2 + (rectGap*(squareSize+1)/2))-w, height/2+((rectSize*squareSize)/2 + (rectGap*(squareSize+1)/2))+rectGap*2, w, h)) {
    fill(0);
    if ((mousePressed || !giliran) && (bilPangkah > 0)) {
      if (release) {
        fill(80);
        totalBox -= bilPangkah;
        bilPangkah = 0;
        for (int i = 0; i < squareSize; i++) {
          for (int j = 0; j < squareSize; j++) {
            status[i][j] = pangkah[i][j];
          }//for
        }//for
        if (!giliran) {
          //delay(1000);
        }//if
        if (totalBox==0 && giliran) {
          win = true;
        }//if
        else {
          win = false;
        }

        if (totalBox > 0 && giliran) {
          autoAI();
          giliran = false;
          release = false;
        }//if
        else {
          giliran = true;
          release = true;
        }//else{
      }//release
    }//if
  }//if

  //stroke(0);
  noStroke();
  rect(width/2+((rectSize*squareSize)/2 + (rectGap*(squareSize+1)/2))-w, height/2+((rectSize*squareSize)/2 + (rectGap*(squareSize+1)/2))+rectGap*2, w, h);
  fill(255);
  text("Take", width/2+((rectSize*squareSize)/2 + (rectGap*(squareSize+1)/2))-w/2, height/2+((rectSize*squareSize)/2 + (rectGap*(squareSize+1)/2))+rectGap*2+h/2);//start
}//take button

void reset_btn() {
  int w = 55;
  int h = 18;

  textAlign(CENTER, CENTER);
  fill(80);
  if (overRect(width/2-((rectSize*squareSize)/2 + (rectGap*(squareSize+1)/2)), height/2+((rectSize*squareSize)/2 + (rectGap*(squareSize+1)/2))+rectGap*2, w, h)) {
    fill(0);
    if (mousePressed) {
      fill(80);
      bilPangkah = 0;
      status = new boolean[squareSize][squareSize];
      pangkah = new boolean[squareSize][squareSize];
      totalBox = squareSize*squareSize;
      giliran = true;
      //int l = int(random(5)); converting example
    }//if
  }//if

  //stroke(0);
  noStroke();
  rect(width/2-((rectSize*squareSize)/2 + (rectGap*(squareSize+1)/2)), height/2+((rectSize*squareSize)/2 + (rectGap*(squareSize+1)/2))+rectGap*2, w, h);
  fill(255);
  text("Reset", width/2-((rectSize*squareSize)/2 + (rectGap*(squareSize+1)/2))+w/2, height/2+((rectSize*squareSize)/2 + (rectGap*(squareSize+1)/2))+rectGap*2+h/2);//start
}//take button

void draw_nim() {
  pushMatrix();
  strokeWeight(1.6);
  int nimSize = 12;
  int nimGap = 3;
  int nimX = width/2;
  //int nimY = height/2-((rectSize*squareSize)/2 + (rectGap*(squareSize+1)/2))-rectGap*4-nimSize;
  int nimY = 3;// fix
  stroke(255-mouseX*1.6);
  line(nimX, nimY+nimSize, nimX+nimSize, nimY);
  line(nimX+nimSize, nimY, nimX+nimSize, nimY+nimSize);
  line(nimX+nimSize, nimY+nimSize, nimX+nimSize*2, nimY);
  stroke(255);
  line(nimX+nimSize*2+nimGap, nimY, nimX+nimSize*2+nimGap, nimY+nimSize);
  stroke(255-mouseY*1.6);
  line(nimX+nimSize*2+nimGap*2, nimY+nimSize, nimX+nimSize*3+nimGap*2, nimY);
  line(nimX+nimSize*3+nimGap*2, nimY, nimX+nimSize*3+nimGap*2, nimY+nimSize);
  line(nimX+nimSize*3+nimGap*2, nimY+nimSize, nimX+nimSize*4+nimGap*2, nimY);
  line(nimX+nimSize*4+nimGap*2, nimY, nimX+nimSize*4+nimGap*2, nimY+nimSize);
  stroke(255);
  line(nimX, nimY+nimSize+nimGap, nimX+nimSize*4.5+nimGap*3, nimY+nimSize+nimGap);
  noFill();
  rect(nimX+nimSize*4+nimGap*3, nimY, nimSize/2, nimSize/2);
  strokeWeight(1);
  popMatrix();
}//draw_nim

boolean overRect(int x, int y, int width, int height) {
  if (mouseX >= x && mouseX <= x+width && 
    mouseY >= y && mouseY <= y+height) {
    return true;
  } 
  else {
    return false;
  }
}//overrect

void draw_x(int i, int j) {
  line(i*(rectSize + rectGap)+2, j*(rectSize + rectGap)+2, i*(rectSize + rectGap)+rectSize-2, j*(rectSize + rectGap)+rectSize-2);
  line(i*(rectSize + rectGap)+rectSize-2, j*(rectSize + rectGap)+2, i*(rectSize + rectGap)+2, j*(rectSize + rectGap)+rectSize-2);
}//draw_x

void draw_component() {
  int w = 13;
  int h = 13;
  int x = 0;
  int y = 0;

  //stroke(0);
  noStroke();
  fill(80);
  triangle(x+w*component, y, x+w*(component+1), y, x+w*component, y+h);
  for (int i =0; i < component; i ++) {
    fill(80);
    if (overRect(x+w*i, y, w, h)) {
      fill(0);
      if (mousePressed) {
        fill(80);
        squareSize = i+smallestSquare;
        status = new boolean[squareSize][squareSize];
        pangkah = new boolean[squareSize][squareSize];
        bilPangkah = 0;
        totalBox = squareSize*squareSize;
        giliran = true;
        //int l = int(random(5)); converting example
      }//if
    }//if
    if ((i+smallestSquare == squareSize)) {
      fill(0);
    }//if
    rect(x+w*i, y, w, h);
    //ellipse(x+w*i+w/2,y+w/2,w,w);
    fill(255);
    text(i+smallestSquare, x+w*i+w/2, y+h/2);//start
  }//for loop
}//draw component

void banner() {
  fill(50);
  //rect(0,0,width,height/2-((rectSize*squareSize)/2 + (rectGap*(squareSize+1)/2))-rectGap*2);
  rect(0, 0, width, 20);//statik
  draw_nim();
  draw_component();
}//banner

void mouseReleased() {
  release = true;
}//mouseReleased

void autoAI() {
  int ambik = abs(totalBox%(squareSize+1));
  if (ambik == 0) {
    ambik = abs(int(random(1, squareSize)));
  }//if

  for (int i = 0; i < ambik; i++) {
    while (true) {
      int x = int(random(0, squareSize));
      int y = int(random(0, squareSize));
      if (!pangkah[x][y]) {
        pangkah[x][y] = true;
        break;
      }//if
    }//while 1
  }//for loop

  bilPangkah = ambik;
  //System.out.println("ambik " + ambik);
  //totalBox = totalBox - ambik;
  //System.out.println(totalBox);
}//autoAI

void winner() {
  if (totalBox == 0) {
    if (win) {
      fill(0);
      text("Congratulation, You Win.", (width/2)+5, height/2);
      //System.out.println("you win");
    }//inner if
    else {
      fill(merah);
      text("You Lose!", width/2, height/2);
      //System.out.println("you lose");
    }//inner else
  }//if totalbox
  else {
    take_btn();
  }//else
}
