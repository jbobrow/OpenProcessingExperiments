
/*Press the b or B key on your keyboard to 
begin with a blue background.

Next, press the m or M key on your keyboard to 
make stars appear.
Each time you press m or M, more stars appear.
Hold down your m or M key to see more stars quickly accumulate.

Press b  or B any time to clear all the stars off your canvas.

Drag your mouse while you hold the button down to doodle.
See what happens when you move your mouse quickly.

Click your mouse button.
Each time you click, you add a star where you mouse clicked.

I have been enjoying meditating lately
by lying on my back, feeling like I'm floating on the ocean,
imagining I'm looking up at a clear night sky.
I hope you get the same kind of feeling
from your sketch...
...or go crazy doodling with stars!
*/

color[] palette = 
{#000040, #FFAA00, #FFFFFF, #FFFF00, #FFC400, #A1A2B7, #8B8A33, 
#B7B694, #FED284, #DEDCC8, #D3D3FE, #2B2B6C};

void setup() {
  size(1000,700);
  String s="Keys b, m. Click, drag mouse.";
  fill(255);
  textAlign(LEFT);
  textSize(20);
  text(s,20,30);
  noSmooth();
}

void draw() {
  //B is for "begin" "blue" "background"
  if (keyPressed) {
    if (key == 'b' || key == 'B') {
      background(palette[0]);
      String s="Keys b, m. Click, drag mouse.";
      fill(255);
      textAlign(LEFT);
      textSize(20);
      text(s,20,30);
    }

  //*****reveal stars*****
  //if (keyPressed) {
    if (key == 'm' || key == 'M') {
    //***small stars****
    for (int i=0; i <2; i++) {
      float star = random(1,11);
      stroke(palette[int(star)]);
      strokeWeight(int(random(1,3)));
      point(random(width),random(height));
      //*****tiny stars*****
      for (int tiny=0; tiny <10; tiny++) {
        strokeWeight(1);
        point(random(width),random(height));
      }
      }
    
    //*****3 pixel stars*****
    for (int i = 0; i <2; i++) {
      float star = random(1,12);
      float rx = random(width);
      float ry = random(height); 
      int x = int(rx);
      int y = int(ry);
      stroke(palette[int(star)]);
      line(x,y, x+2, y+2);
      line(x,y+1, x+2, y+1);
      line(x,y+2, x+2, y);
    }

    //*****7 pixel stars*****
    for (int i = 0; i <2; i++) {
      float star1 = random(1,12);
      float star2 = random(1,12);
      float rx = random(width);
      float ry = random(height); 
      int x = int(rx);
      int y = int(ry);
      stroke(palette[int(star1)]);
      line(x,y, x+6,y+6);
      line(x+6,y, x,y+6);
      //test for random colors
      //println(star1);
      stroke(palette[int(star2)]);
      line(x+3,y, x+3,y+6);
      line(x,y+3, x+6,y+3);
      //test colors
      //println(star2);
    }

    //*****7 pixel polygons*****
    for (int i = 0; i <2; i++) {
      float star1 = random(1,12);
      float star2 = random(1,12);
      float rx = random(width);
      float ry = random(height); 
      int x = int(rx);
      int y = int(ry);
      stroke(palette[int(star1)]);
      fill(palette[int(star2)]);
      beginShape();
      vertex(x+3,y);
      vertex(x+4,y+2);
      vertex(x+6,y+2);
      vertex(x+5,y+3);
      vertex(x+6,y+6);
      vertex(x+3,y+4);
      vertex(x,y+6);
      vertex(x+1,y+3);
      vertex(x,y+2);
      vertex(x+2,y+2);
      endShape(CLOSE);
    }

    //*****13 pixel stars shrink*****
    scale(0.5);
    float star1 = random(1,12);
    //must declare 2 star variables to get 2 different colors
    float star2 = random(1,12);
    //the upper right corner gets congested because of the scaling
    float rx = random(width*2);
    float ry = random(height*2); 
    int x = int(rx);
    int y = int(ry);
    stroke(palette[int(star1)]);
    fill(palette[int(star2)]);
    beginShape();
    vertex(x+6,y);
    vertex(x+8,y+4);
    vertex(x+12,y+4);
    vertex(x+10,y+6);
    vertex(x+12,y+12);
    vertex(x+6,y+8);
    vertex(x,y+12);
    vertex(x+2,y+6);
    vertex(x,y+4);
    vertex(x+4,y+4);
    endShape(CLOSE);
    }
  }
}

//*****doodle with stars*****
//place stars according to mouse location
void mouseDragged() {
  //build star  
  float star1 = random(1,12);
  //must declare 2 star variables to get 2 different colors
  float star2 = random(1,12);
  float rx = random(width);
  float ry = random(height); 
  int x = mouseX;
  int y = mouseY;
  stroke(palette[int(star1)]);
  fill(palette[int(star2)]);  
  beginShape();
  vertex(x+6,y);
  vertex(x+8,y+4);
  vertex(x+12,y+4);
  vertex(x+10,y+6);
  vertex(x+12,y+12);
  vertex(x+6,y+8);
  vertex(x,y+12);
  vertex(x+2,y+6);
  vertex(x,y+4);
  vertex(x+4,y+4);
  endShape(CLOSE);
}

//*****add larger stars to create your own consellations*****
void mouseClicked() {
  //build star  
  float star1 = random(1,12);
  //must declare 2 star variables to get 2 different colors
  float star2 = random(1,12);
  float rx = random(width);
  float ry = random(height); 
  int x = mouseX;
  int y = mouseY;
  stroke(palette[int(star1)]);
  fill(palette[int(star2)]);  
  beginShape();
  vertex(x+6,y);
  vertex(x+8,y+4);
  vertex(x+12,y+4);
  vertex(x+10,y+6);
  vertex(x+12,y+12);
  vertex(x+6,y+8);
  vertex(x,y+12);
  vertex(x+2,y+6);
  vertex(x,y+4);
  vertex(x+4,y+4);
  endShape(CLOSE);
}


