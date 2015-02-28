
final int face_usual_w = 650;
final int face_usual_h = 450;
final int mouth_move_dist = 25;

final int SPEAKING_BOOL_NOT_TALKING = 0;
final int SPEAKING_BOOL_TALKING = 1;
final int SPEAKING_BOOL_ABOUT_TO_NOT = 2;

int num_x;
int num_y;
int midx_face;
int midy_face;
int midface_id;
int midx_face_pos;
int midy_face_pos;

Button TheButton;
ArrayList Faces;

class Face
{
  int x;
  int y;
  int id;
  long lastSpeakStart;
  int speaking;
  void startSpeaking(long t)
  {
    lastSpeakStart = t;
    speaking = 1;
  }
  float getMouthOpenness()
  {
    float inner_part = (millis() - lastSpeakStart)/100;
    if (inner_part>2*PI)
    {
      speaking = 0;
    }
    else if (inner_part>PI)
    {
      //spread conversation then shut up
      if (speaking == 1)
      {
        spreadConversation(id, millis());
      }      
      speaking = 2;
    }
    if (speaking!=0)
    {
      return 0.5-0.5*cos(inner_part);
    }
    else
    {
      return 0;
    }
  }
  Face(int x_, int y_, int id_)
  {
    x = x_;
    y = y_;
    id = id_;
    lastSpeakStart=0;
    speaking = 0;
  }
}  

int get_x_id(int id)
{
  return int(id/(num_y+1));
}

int get_y_id(int id)
{
  return id%(num_y+1);
}
void spreadConversation(int from_id, long time)
{
  //count thus:
  //0 3 6 9
  //1 4 7 10
  //2 5 8 11 only starting with 0
  //this'd be numx = 3, numy = 2;

  int xpos = get_x_id(from_id);
  int ypos = get_y_id(from_id);

  //pick who it is! and do it
  boolean good = false; //keep trying until things work out, man.
  while (!good)
  {
    int who = int(random(0, 4)); //okay, R D L U
    switch(who)
    {
    case 0:
      if (xpos != num_x && xpos != midx_face-(num_y+1))
      {
        ((Face)Faces.get(from_id+num_y+1)).startSpeaking(time);
        good = true;
      }
      break;
    case 1:
      if (ypos!=num_y&&ypos != midy_face-1)
      {
        ((Face)Faces.get(from_id+1)).startSpeaking(time);
        good = true;
      }
      break;
    case 2:
      if (xpos != 0 && xpos != midx_face+(num_y+1))
      {
        ((Face)Faces.get(from_id-num_y-1)).startSpeaking(time);
        good = true;
      }
      break;
    case 3:
      if (ypos!=0 && xpos != midy_face+1)
      {
        ((Face)Faces.get(from_id-1)).startSpeaking(time);
        good = true;
      }
      break;
    }
  }
}


class Button
{
  int x;
  int y;
  int r;
  int lastClickOk; //1 or 0. did the last mouseclick hit this button?
  void draw() {
    if (mousePressed && lastClickOk==1)
    {
      fill(128);
    }
    else {
      fill(255);
    }
    ellipse(x, y, r*2, r*2);
  }
  void checkClickAndAct(int clickx, int clicky) {
    if (dist(x, y, clickx, clicky)<=r)
    {
      lastClickOk = 1;
      //do the thing
      long time = millis();
      spreadConversation(midface_id, time);
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

void setup()
{
  size(900,450);
  smooth();
  noStroke();
  Faces = new ArrayList();  

  num_x = width/(face_usual_w/7);
  num_y = height/(face_usual_h/5);
  midx_face = num_x/2;
  midy_face = num_y/2;

  //fill the faces array
  for (int x = 0; x <= num_x; ++x)
  {
    for (int y = 0; y <= num_y; ++y)
    {
      if (x != midx_face || y != midy_face)
      {
        Faces.add(new Face(-face_usual_w/14+face_usual_w/7*x, 
        -face_usual_h/10+face_usual_h/5*y, 
        Faces.size()));
      }
      else
      {
        midface_id = Faces.size();
        Faces.add(new Face(width+500, height+500, Faces.size()));
        //keeps the grid x y counting good but isn't shown except in weird cases.
      }
    }
  }
  midx_face_pos = -face_usual_w/14 + face_usual_w/7*midx_face;
  midy_face_pos = -face_usual_h/10 + face_usual_h/5*midy_face;

  //setup TheButton
  TheButton = new Button(midx_face_pos+face_usual_w/10+3, midy_face_pos+face_usual_h/10+3, face_usual_w/10+5); //Some Finetuning going
}

void draw() {
  background(115, 205, 232);
  for (int i = 0; i < Faces.size(); ++i)
  {
    Face getFace = (Face) Faces.get(i);
    drawFace(getFace.x, getFace.y, face_usual_w/5, face_usual_h/5, getFace.getMouthOpenness());
  }
  TheButton.draw();
}

void mousePressed() {
  TheButton.checkClickAndAct(mouseX, mouseY);
}

void drawFace(int x, int y, int w, int h, float mouthOpenness)
{
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
  mouthOpenness = constrain(mouthOpenness, 0, 1);

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

