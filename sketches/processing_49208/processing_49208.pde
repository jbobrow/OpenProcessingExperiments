
float bodyX;
float bodyY;
float eyeColorX;
float eyeColorY;
float eyeShiftX;
float eyeShiftY;
float mouthTalkX;
float mouthTalkY;
int a;
int x;
int y;
float c;
color fillValue;

float hr, vr;  // horizontal and vertical radius of the tickling



void setup() {
  size(640,480);
  colorMode(RGB, 100);
  noStroke();
  smooth();
  frameRate(30);
  
 x = width/2;
 y = height/2;

hr = width;
  vr = height;
}



void draw() {
  //modes
  ellipseMode(CENTER);
  rectMode(CENTER);
   background (0);
  // fillValue=(255);
  //pieces
  x=pmouseX-15;
  y=pmouseY-15;
  a=pmouseX-15;
 
  //scab's pieces
  body(x,y);
  eyeColor(x,y);
  eyeShift(x,y,a);
  mouthTalk(x,y);
}

//Scab's body  
void body(int x,int y) {
  //ears
  fill(29,82,69);
  triangle(x-10, y-20, x+30, y, x+30, y-25);
  triangle(x-10, y-20, x-30, y, x-30, y-25);
  //inside ear pinks
  fill(80,16,48);
  triangle(x+10, y-20, x+27, y-5, x+27, y-20);
  triangle(x+10, y-20, x-27, y-5, x-27, y-20);
  //arms
  fill(29,82,69);
  rect(x-15, y+30, 7,5);
  rect(x+15, y+30, 7,5);
  //body
  arc(x,y+28,30,30,PI/2,PI);
  arc(x,y+28,30,30,0,PI/2);
  //feet
  ellipse(x-10,y+42,10,8);
  ellipse(x+10,y+42,10,8);
  //head
  fill(29,82,69);
  ellipse(x,y,60,60); 
  //nose
  fill(80,16,48);
  triangle(x-5,y+7,x+5,y+7,x,y+10);
  //CLAWSSS
  fill(100);
  //left hand
  ellipse(x-18,y+28,3,3);
  ellipse(x-18,y+32,3,3);
  //right hand
  ellipse(x+18,y+28,3,3);
  ellipse(x+18,y+32,3,3);
  //left foot
  ellipse(x-15,y+45,3,3);
  ellipse(x-12,y+47,3,3);
  ellipse(x-11,y+47,3,3);
  //right foot
  ellipse(x+9,y+47,3,3);
  ellipse(x+12,y+47,3,3);
  ellipse(x+15,y+45,3,3);
}

//eyes
void eyeColor(int x,int y) {
  //eyes whites
  fill(100);
  ellipse(x-20,y,25,25); 
  ellipse(x+20,y,25,25);
  //eye blue rings
  //float c=map(mouseX,0,.5*width,0,255);
  //fill(c,0,c);
  fill(mouseX/3, 200-mouseX/2, mouseY/3);
  ellipse(x-20,y,20,20);
  ellipse(x+20,y,20,20);
  //eye black
  fill(0);
  ellipse(x-20,y,13,13);
  ellipse(x+20,y,13,13);
} 


//white glimmer in eyes
void eyeShift(int x, int y,int a) {
    //eye shift
    a=(mouseX);
    fill(100);
    if ((width/2)<a) {
     ellipse(x-25,y-2,7,5);
     ellipse(x+15,y-2,7,5);
    }
    else {
      ellipse(x-15,y-2,7,5);
      ellipse(x+25,y-2,7,5);
  }
}



//mouth
void mouthTalk(int x, int y) { 
    //mouth open
    //fillValue=0;
  fill(fillValue);
  ellipse(x,y+15,10,7);
    //talking
  keyPressed() ;
  if (key==CODED) {
    if (keyCode==UP) 
      fillValue = 255;
      stroke(0);
      strokeWeight(3);
      noFill();
      arc(x,y+15,10,5,0,PI);
      noStroke();
    } else if (keyCode==DOWN); 
      //fillValue = 255;
      ellipse(x,y+15,10,7);
    /*} else{
    fillValue = 100;
    }*/
}



//Spazing out Scabs
void mousePressed(){
  fill(0);
  rect(0, 0, width, height);
  fill(0);
  println("hehe that tickles");
  // If the cursor is over the text, change the position
  if (abs(mouseX - x) < hr &&
      abs(mouseY - y) < vr) {
    x += random(-10, 10);
    y += random(-10, 10);
  }
  //what moves around
  body(x,y);
  eyeColor(x,y);
  eyeShift(x,y,a);
  mouthTalk(x,y);
}


