
//The usual size of a face before I scale it. Useful for knowing the specific width height etc
final int face_usual_w = 650;
final int face_usual_h = 450;
final int mouth_move_dist = 25; //how far the mouth opens

//Stores index of middleface
int midx_face;
int midy_face;
//its position:
int midx_face_pos;
int midy_face_pos;

//Making an arraylist of longs didn't make it happy, this is my awkward workaround.
class LongObject {
  long l;
  LongObject(long i) {
    l = i;
  }
  long get() {
    return l;
  }
}

//List of times when there was a click, right.
ArrayList helloBursts;
//My button c:
Button TheButton;

//thisi s a button
class Button {
  int x;
  int y;
  int r;//adius
  int lastClickOk; //1 or 0. did the last mouseclick hit this button?
  void draw() {
    if(mousePressed && lastClickOk==1) //Then the mouse is held down, I think.
    {
      fill(128);
    }
    else {
      fill(255);
    }
    ellipse(x, y, r*2, r*2);
  }
  //Checks if you clicked on it, and if you did, adds a new time to the list of wavepulse thingies.
  void checkClickAndAct(int clickx, int clicky) {
    if (dist(x, y, clickx, clicky)<=r)
    {
      helloBursts.add(new LongObject(millis()));
      lastClickOk = 1;
    }
    else {
      lastClickOk = 0;
    }
  }
  Button(int x_, int y_, int twor)
  {
    r = twor/2;
    x = x_;
    y = y_;
    lastClickOk = 0;
  }
}

void setup() {
  size(900,450);
  smooth();
  noStroke();
  helloBursts = new ArrayList();  

  midx_face = 0;
  midy_face = 0;
  //get the center face
  for (int x = -face_usual_w/14; x < width; x+=face_usual_w/7) {
    midx_face++;
  }
  for (int y = -face_usual_h/10; y< height; y+=face_usual_h/5) {
    midy_face++;
  }
  midx_face /= 2;
  midy_face /= 2;
  midx_face_pos = -face_usual_w/14 + face_usual_w/7*midx_face;
  midy_face_pos = -face_usual_h/10 + face_usual_h/5*midy_face;
  
  //setup TheButton
  TheButton = new Button(midx_face_pos+face_usual_w/10+3,midy_face_pos+face_usual_h/10+3,face_usual_w/10+5); //Some Finetuning going
}

void draw() {
  background(115, 205, 232);
  for (int x = -face_usual_w/14; x < width; x+=face_usual_w/7) { // they are pretty widely <--> spaced, so manual adjust with the 15
    for (int y = -face_usual_h/10; y< height; y+=face_usual_h/5) {
      if (x == midx_face_pos && y == midy_face_pos ) {
        //this is where the button would be, but I think I am going to use a button class that gets straight drawn here instead. See it's down below.
      } 
      else {
        //aight let's check the distance from the button for ripple effect
        float distancey = dist(x,y,midx_face_pos,midy_face_pos);
        float mouth = 0;
        for(int i = 0; i < helloBursts.size(); ++i) {
          float inner_part = (millis()-(((LongObject)helloBursts.get(i)).get())-distancey)/100;
          mouth += 0.5-0.5*cos(constrain(inner_part,0,2*PI)); //this part makes it a pulse, not a continuous sine wave c:
        }
        drawFace(x, y, face_usual_w/5, face_usual_h/5,mouth);
      }
    }
  }
  TheButton.draw(); //Make the button in the middle space freed up, right c:
}

//Mouse clickery:
void mousePressed(){
  TheButton.checkClickAndAct(mouseX,mouseY);
}

//Make that face thing sir
void drawFace(int x, int y, int w, int h, float mouthOpenness)
{
  //Here is a bunch of scaling, because the rest is just lots of vertices.
  pushMatrix();
  translate(x, y); //movemove
  //Facetile dimensions = 650, 450. Let's scale that okay.
  scale((float)w/650, (float)h/450); 
  //fine tune the size a bit:
  scale(0.8, 0.8); //the canvas is too big for openprocessing by default.

  //Begin Old Face Code Repurposed. (Hence more scaling):


  //general headshape.
  fill(201, 168, 132); 
  beginShape();
  vertex(238, 395);
  vertex(193, 277);
  vertex(220, 223);
  vertex(240, 134);
  vertex(285, 81);
  vertex(373, 73);
  vertex(482, 71);
  vertex(585, 94);
  vertex(642, 215);
  vertex(672, 261);
  vertex(607, 403);
  vertex(583, 506);
  vertex(493, 553);
  vertex(356, 554);
  vertex(268, 516);
  endShape(CLOSE);

  //hairstyles
  fill(64, 40, 13);
  beginShape();
  vertex(213, 211);
  vertex(230, 128);
  vertex(288, 66);
  vertex(345, 34);
  vertex(568, 78);
  vertex(596, 99);
  vertex(645, 191);
  vertex(673, 244);
  vertex(675, 271);
  vertex(658, 308);
  vertex(588, 244);
  vertex(398, 248);
  vertex(343, 194);
  vertex(201, 343);
  vertex(185, 273);
  endShape(CLOSE);

  //shadey bits

  //eyebrows
  fill(180, 148, 112);
  beginShape();
  vertex(627, 311);
  vertex(545, 276);
  vertex(492, 285);
  vertex(480, 301);
  vertex(540, 293);
  vertex(605, 311);
  endShape(CLOSE);

  beginShape();
  vertex(267, 295);
  vertex(363, 265);
  vertex(407, 288);
  vertex(402, 301);
  vertex(358, 288);
  vertex(290, 298);
  endShape(CLOSE);

  //nose
  beginShape();
  vertex(450, 318);
  vertex(460, 373);
  vertex(453, 396);
  endShape(CLOSE);

  beginShape();
  vertex(425, 328);
  vertex(415, 388);
  vertex(400, 388);
  vertex(412, 370);
  endShape(CLOSE);

  beginShape();
  vertex(422, 406);
  vertex(405, 408);
  vertex(415, 403);
  endShape(CLOSE);

  beginShape();
  vertex(442, 403);
  vertex(443, 411);
  vertex(450, 403);
  endShape(CLOSE);

  //mouth
  mouthOpenness = constrain(mouthOpenness, 0, 1); //Don't be too open please. Or closed.

  beginShape();
  vertex(357, 463);
  vertex(408, 443-mouth_move_dist*mouthOpenness);
  vertex(432, 448-mouth_move_dist*mouthOpenness);
  vertex(438, 441-mouth_move_dist*mouthOpenness);
  vertex(502, 463);
  vertex(432, 463-mouth_move_dist*mouthOpenness);
  endShape(CLOSE);

  beginShape();
  vertex(357, 463);
  vertex(430, 463+mouth_move_dist*mouthOpenness);
  vertex(502, 463);
  vertex(443, 475+mouth_move_dist*mouthOpenness);
  vertex(420, 475+mouth_move_dist*mouthOpenness);
  endShape(CLOSE);

  fill(180, 98, 62);
  beginShape();
  vertex(357, 463);
  vertex(432, 463-mouth_move_dist*mouthOpenness);
  vertex(502, 463);
  vertex(430, 463+mouth_move_dist*mouthOpenness);
  endShape(CLOSE);

  //eyes
  fill(280, 248, 212);
  ellipse(357, 315, 50, 30);
  ellipse(540, 316, 50, 30);
  fill(80, 48, 12);
  ellipse(357, 315, 30, 30);
  ellipse(540, 316, 30, 30);
  popMatrix();
}
                                
