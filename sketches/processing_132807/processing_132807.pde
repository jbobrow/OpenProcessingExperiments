
// global variables
int lineAlpha = 75;
int hlineAlpha = 75;
int lineWeight = 40;
int rectGreen = 0;
int rectBlue = 0;
int rBlue = 5;



void setup() {
size (600, 400);
background(0);
frameRate(15);

}

void draw() {

//series of vertical lines
strokeWeight(lineWeight);
stroke(135, 0, rBlue, lineAlpha);
line(20, 0, 20, 399);
stroke(114, 15, 17, lineAlpha);
line (40, 0, 40, 399);
stroke(93, 7, 12, lineAlpha);
line (60, 0, 60, 399);
stroke(69, 17, 19, lineAlpha);
line(80, 0, 80, 399);
stroke(49, 16, 18, lineAlpha);
line(100, 0, 100, 399);

//second series
stroke(135, 0, rBlue, lineAlpha);
line(120, 0, 120, 399);
stroke(114, 15, 17, lineAlpha);
line (140, 0, 140, 399);
stroke(93, 7, 12, lineAlpha);
line (160, 0, 160, 399);
stroke(69, 17, 19, lineAlpha);
line(180, 0, 180, 399);
stroke(49, 16, 18, lineAlpha);
line(200, 0, 200, 399);

//third series
stroke(135, 0, rBlue, lineAlpha);
line(220, 0, 220, 399);
stroke(114, 15, 17, lineAlpha);
line (240, 0, 240, 399);
stroke(93, 7, 12, lineAlpha);
line (260, 0, 260, 399);
stroke(69, 17, 19, lineAlpha);
line(280, 0, 280, 399);
stroke(49, 16, 18, lineAlpha);
line(300, 0, 300, 399);

//fourth series
stroke(135, 0, rBlue, lineAlpha);
line(320, 0, 320, 399);
stroke(114, 15, 17, lineAlpha);
line (340, 0, 340, 399);
stroke(93, 7, 12, lineAlpha);
line (360, 0, 360, 399);
stroke(69, 17, 19, lineAlpha);
line(380, 0, 380, 399);
stroke(49, 16, 18, lineAlpha);
line(400, 0, 400, 399);

//fifth series
stroke(135, 0, rBlue, lineAlpha);
line(420, 0, 420, 399);
stroke(114, 15, 17, lineAlpha);
line (440, 0, 440, 399);
stroke(93, 7, 12, lineAlpha);
line (460, 0, 460, 399);
stroke(69, 17, 19, lineAlpha);
line(480, 0, 480, 399);
stroke(49, 16, 18, lineAlpha);
line(500, 0, 500, 399);

//sixth series
stroke(135, 0, rBlue, lineAlpha);
line(520, 0, 520, 399);
stroke(114, 15, 17, lineAlpha);
line (540, 0, 540, 399);
stroke(93, 7, 12, lineAlpha);
line (560, 0, 560, 399);
stroke(69, 17, 19, lineAlpha);
line(580, 0, 580, 399);
stroke(49, 16, 18, lineAlpha);
line(600, 0, 600, 399);

//series of horizontal lines
//first series
strokeWeight(lineWeight);
stroke(135, 0, rBlue);
line (0, 10, 599, 10);
stroke(114, 15, 17, hlineAlpha);
line (0, 20, 599, 20);
stroke(93, 7, 12, hlineAlpha);
line (0, 30, 599, 30);
stroke(69, 17, 19, hlineAlpha);
line(0, 40, 599, 40);
stroke(49, 16, 18, hlineAlpha);
line(0, 50, 599, 50);

//second series
stroke(135, 0, rBlue);
line (0, 60, 599, 60);
stroke(114, 15, 17, hlineAlpha);
line (0, 70, 599, 70);
stroke(93, 7, 12, hlineAlpha);
line (0, 80, 599, 80);
stroke(69, 17, 19, hlineAlpha);
line(0, 90, 599, 90);
stroke(49, 16, 18, hlineAlpha);
line(0, 100, 599, 100);

//third series
stroke(135, 0, rBlue);
line (0, 110, 599, 110);
stroke(114, 15, 17, hlineAlpha);
line (0, 120, 599, 120);
stroke(93, 7, 12, hlineAlpha);
line (0, 130, 599, 130);
stroke(69, 17, 19, hlineAlpha);
line(0, 140, 599, 140);
stroke(49, 16, 18, hlineAlpha);
line(0, lineAlpha, 599, hlineAlpha);

//fourth series
stroke(135, 0, rBlue);
line (0, 160, 599, 160);
stroke(114, 15, 17, hlineAlpha);
line (0, 170, 599, 170);
stroke(93, 7, 12, hlineAlpha);
line (0, 180, 599, 180);
stroke(69, 17, 19, hlineAlpha);
line(0, 190, 599, 190);
stroke(49, 16, 18, hlineAlpha);
line(0, 200, 599, 200);

//
//fifth series
stroke(135, 0, rBlue);
line (0, 210, 599, 210);
stroke(114, 15, 17, hlineAlpha);
line (0, 220, 599, 220);
stroke(93, 7, 12, hlineAlpha);
line (0, 230, 599, 230);
stroke(69, 17, 19, hlineAlpha);
line(0, 240, 599, 240);
stroke(49, 16, 18, hlineAlpha);
line(0, 250, 599, 250);

//sixth series
stroke(135, 0, rBlue);
line (0, 260, 599, 260);
stroke(114, 15, 17, hlineAlpha);
line (0, 270, 599, 270);
stroke(93, 7, 12, hlineAlpha);
line (0, 280, 599, 280);
stroke(69, 17, 19, hlineAlpha);
line(0, 290, 599, 290);
stroke(49, 16, 18, hlineAlpha);
line(0, 300, 599, 300);

//seventh series
stroke(135, 0, rBlue);
line (0, 310, 599, 310);
stroke(114, 15, 17, hlineAlpha);
line (0, 320, 599, 320);
stroke(93, 7, 12, hlineAlpha);
line (0, 330, 599, 330);
stroke(69, 17, 19, hlineAlpha);
line(0, 340, 599, 340);
stroke(49, 16, 18, hlineAlpha);
line(0, 350, 599, 350);

//eighth series
stroke(135, 0, rBlue);
line (0, 360, 599, 360);
stroke(114, 15, 17, hlineAlpha);
line (0, 370, 599, 370);
stroke(93, 7, 12, hlineAlpha);
line (0, 380, 599, 380);
stroke(69, 17, 19, hlineAlpha);
line(0, 390, 599, 390);
stroke(49, 16, 18, hlineAlpha);
line(0, 400, 599, 400);


//triangles and quads
noStroke();
fill(93, 7, 12, 160);
triangle(0, 400, 600, 140, 600, 400);
fill(135, 0, 5, 125);
quad(0, 0, 600, 0, 600, 170, 0, 420);

//rectangles
strokeWeight(50);
stroke(85+mouseX, 0+mouseY, 0, 175);
fill(253, rectGreen, rectBlue, 100);
rect(0, 0, 600, 200);
fill(253, rectGreen, rectBlue, 50);
rect(0, 195, 600, 400);


//Changing alpha with mouse
lineAlpha = mouseX/2;
hlineAlpha = mouseY/2;

//reset
 if (keyPressed) {
    if (key == 'r' || key == 'R') {
      rectGreen = 0;
      rBlue = 5;
     // lineAlpha = 75;
     // hlineAlpha = 75;
    }
  } else {
    rectGreen = rectGreen;
    rBlue = rBlue;
   // lineAlpha =lineAlpha;
   // hlineAlpha = hlineAlpha;
  }

 if (keyPressed) {
    if (key == 'w' || key == 'W') {
      lineWeight = random(5,40);
      rBlue = 5;
     // lineAlpha = 75;
     // hlineAlpha = 75;
    }
  } else {
    rectGreen = rectGreen;
    rBlue = rBlue;
    lineWeight = lineWeight;
   // lineAlpha =lineAlpha;
   // hlineAlpha = hlineAlpha;
  }
}
//adds green to rectangles
void mouseClicked() {
rectGreen = rectGreen + 20;
rBlue = random(0,255);
//rectBlue = rectBlue + 5;
}





/*
Mark Rothko was born in Latvia in 1903. He emigrated with his parents to the U.S. at the age of 10.  He is most well known for the paintings he created late in his career during the 1940s and 50s. 
These paintings consisted of large, “luminous, color blocks.”  He also utilized large brush strokes and a variety of washes in his work.  His paintings were very large and he invited viewers to engulf 
themselves in his work by viewing it as closely as possible. I was inspired by Rothko’s use of rectangular shapes, rich colors and washes while creating this piece. I utilized large strokes, and 
layers of similar colors with varying alphas to digitally mimic his style. I also layered wide vertical lines over horizontal lines to digitally re-create his free use of large paintbrush strokes. 
While Rothko’s work often consisted of large rectangular shapes, I included a triangular shape of my own to make this piece more than simply a re-creation of one of his large fields of color. In 
this way, this piece is inspired by Rothko’s brilliant and contemplative use of color but still contains marks that are uniquely mine. 
*/











