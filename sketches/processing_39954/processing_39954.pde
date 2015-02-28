


void setup() {
  size(600, 600);
  background(255, 0); 
  PImage img;
  img = loadImage("pan.png");
  image(img, 0, 0);
  //restart button
  PFont font;
font = loadFont("Courier-24.vlw"); 
textFont(font, 24); 
fill(100);
text("sunny-side-up practice", 252,560);
 
 PFont font2;
font2 = loadFont("Courier-24.vlw"); 
textFont(font2, 24); 
fill(255);
text("sunny-side-up practice", 250,558);
  //fire control button
  stroke(227, 178, 16);
  strokeWeight(5);
  strokeJoin(ROUND);
  fill(255, 232, 21);
  rect(30, 559, 40, 20);

  stroke(227, 178, 16);
  strokeWeight(5);
  strokeJoin(ROUND);
  fill(242, 117, 0);
  rect(70, 559, 40, 20);

  stroke(227, 178, 16);
  strokeWeight(5);
  strokeJoin(ROUND);
  fill(255, 0, 0);
  rect(110, 559, 40, 20);
}

float tx1=21;
float tx2=31;
float tx3=42;


float tran=0;

float eggx=random(270,350);
float eggy=random(200,193);

PImage panimg;

  
void draw() {
  //fire
  fill(0);
  stroke(0);
  strokeJoin(MITER);
  triangle(tx1, 528, tx2, 549, tx3, 528);
  if (keyPressed) {
    panimg = loadImage("pan 2.png");
    image(panimg, 0, 468);
       noStroke();
  fill(255,255,237,20);
ellipse(304,217, 200,200 );
  fill(245,176,0);
ellipse(eggx,eggy,60,60);
  }
}

//egg
void keyPressed() {
  if (key=='e'){
  noStroke();
  fill(255,255,237,50);
ellipse(304,217, 200,200 );
  fill(245,176,0);
ellipse(eggx,eggy,60,60);


    }
}

void keyReleased(){
  if (key == CODED) {
    if (keyCode == UP) {
      tran=tran+35;
      tx1=tx1+20;
      tx2=tx2+20;
      tx3=tx3+20;
      
    }
  }
  {
    if (tx1>141) {
      tx1=21;
      if (tx2>151) {
        tx2=31;
        if (tx3>162) {
          tx3=42;
         
        }
      }
    }

  }
}

//tran=tran+35;

