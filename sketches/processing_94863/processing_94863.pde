
int y = 0;

void setup() {
  background(0);
  size(500, 500);
  noStroke();
}

void draw() {
  background(0);
  y = (y + 15) %245;
  Limbo(100, 50);
  eyes(250, 250);
  spaceInvader(250, 250-y);
  textSize(150);
  text("Limbo", 25, 440);
  fill(255);
}

void Limbo(int x, int y) {
  fill(126, 125, 125);
  rect(140, 125, 10, 50);//left part of head
  rect(150, 115, 20, 10);//left corner of head
  rect(170, 105, 60, 10);//top part of head
  rect(230, 95, 10, 10);//first hair
  rect(240, 105, 10, 10);//between hair
  rect(250, 95, 10, 10);//second hair
  rect(260, 105, 10, 20);//right corner of head
  rect(270, 125, 10, 10);//right hair
  rect(260, 135, 10, 10);//under right hair
  rect(250, 145, 10, 50);//right face
  rect(240, 195, 10, 10);//chin
  rect(230, 205, 10, 10);//chin
  rect(180, 215, 50, 10);//bottom head
  rect(170, 205, 10, 10);//back chin
  rect(160, 195, 10, 10);//back chin
  rect(150, 175, 10, 20);//back of chin
  rect(120, 145, 20, 10);//right shoulder
  rect(100, 155, 20, 10);//right arm
  rect(110, 155, 10, 20);//right arm
  rect(90, 165, 10, 10);//right arm 
  rect(80, 175, 10, 10);//right arm
  rect(70, 185, 10, 25);//back hand
  rect(80, 210, 30, 10);//right knuckles
  rect(110, 195, 10, 15);//right thumb
  rect(120, 175, 10, 20);//right arm finish
  rect(130, 195, 10, 45);//back
  rect(100, 220, 20, 10);//bottom of back foot
  rect(120, 230, 10, 10);//leg
  rect(90, 230, 10, 10);//bottom foot 1
  rect(80, 240, 10, 10);//bottom foot 2
  rect(70, 250, 10, 20);//front of back foot
  rect(80, 270, 40, 10);//top of back foot
  rect(100, 260, 10, 10);//bend
  rect(120, 280, 30, 10);//back knee
  rect(150, 270, 10, 10);//knee
  rect(130, 240, 20, 10);//split
  rect(140, 250, 20, 10);//split2
  rect(160, 260, 20, 10);//onto next leg
  rect(170, 260, 10, 30);//back of front leg
  rect(160, 290, 10, 10);//back of front foot
  rect(160, 300, 80, 10);//bottom of front foot
  rect(240, 290, 10, 20);//front of front foot
  rect(210, 280, 30, 10);//top of front foot
  rect(220, 260, 10, 30);//fornt of front leg
  rect(210, 250, 10, 10);//stomach
  rect(200, 240, 10, 10);//stomach 2
  rect(210, 230, 10, 10);//somtach 3
  rect(220, 220, 10, 10);//starting arm
  rect(230, 230, 10, 10);//back of front arm
  rect(240, 240, 30, 10);//front arm elbow
  rect(270, 230, 10, 10);//front of arm 1
  rect(280, 220, 10, 10);//front of arm 2
  rect(290, 210, 10, 10);//front of arm 3
  rect(300, 180, 10, 30);//front of hand
  rect(270, 170, 30, 10);//front knuckles
  rect(260, 180, 10, 30);//back of front hand
  rect(250, 200, 10, 10);//back of front hand
}

void eyes(int x, int y) {
  fill(255);
  rect(230, 165, 10, 20);//left eye
  rect(200, 165, 20, 20);//right eye
}

void spaceInvader(int x, int y) {
  fill(255);
  rect(360, 200+125-y, 10, 30);//right arm
  rect(370, 190+125-y, 10, 20);//right shoulder
  rect(380, 160+125-y, 10, 10);//right antennae
  rect(380, 180+125-y, 10, 50);//right
  rect(390, 170+125-y, 10, 20);//Antennae
  rect(390, 200+125-y, 10, 20);//right
  rect(390, 230+125-y, 20, 10);//Mouth
  rect(400, 180+125-y, 10, 40);//middle
  rect(410, 180+125-y, 10, 40);//middle
  rect(420, 180+125-y, 10, 40);// middle
  rect(420, 230+125-y, 20, 10);//left mouth\
  rect(430, 170+125-y, 10, 20);//left antennae
  rect(430, 200+125-y, 10, 20);//right
  rect(440, 180+125-y, 10, 50);//right
  rect(440, 160+125-y, 10, 10);//right antennae
  rect(450,190+125-y, 10, 20);//right shoulder
  rect(460, 200+125-y, 10, 30);//right arm
}


