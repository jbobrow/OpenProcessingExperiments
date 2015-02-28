
int lineY = -1;
int lineSmile = -2;
int lineSmileColor = 100;
int lineTwoY = -2;
float lineX = (width/2)-2;
float lineWidth = (width/2)+2;
int firstLinesColor = 100;
int redLineStart = 375;
//======================
//Setup
//======================
void setup() {
  size(720, 480);
  background(255);
}
//======================
//Draw
//======================
void draw() {
  //Lines
  lineY = lineY + 2;
  stroke(firstLinesColor);
  line(0, lineY, 720, lineY);

  //Second lines. If lines  are > 480, then new lines apear
  if (lineY > 480) {
    lineSmile = lineSmile + 2;
    stroke(lineSmileColor);
    line(lineX, lineSmile, lineWidth, lineSmile);
  }
  //Figure. If lines are < 100, then lines go white
  if (lineSmile < 100) {
    lineSmileColor = 255;
    lineX = (width/2)-1;
    lineWidth = (width/2)+1;
  }
  //Figure. If line are > 100, then lines go gray
  if (lineSmile > 101) {
    lineSmileColor = #E50000;
    lineX = lineX - 1;
    lineWidth = lineWidth + 1;
  }
  //Figure. If line are > 280, then lines go gray
  if (lineSmile > 280) {
    lineSmileColor = #E50000;
    lineX = lineX + 0.6;
    lineWidth = lineWidth - 0.6;
  }
  //Figure. If line are > 310, then lines go gray
  if (lineSmile > 300) {
    lineSmileColor = #E50000;
    lineX = lineX + 1;
    lineWidth = lineWidth - 1;
  }
  //Figure. If line are > 320, then lines go gray
  if (lineSmile > 320) {
    lineSmileColor = #E50000;
    lineX = lineX + 1.4;
    lineWidth = lineWidth - 1.4;
  }
  //Figure. If line are > 330, then lines go gray
  if (lineSmile > 340) {
    lineSmileColor = #E50000;
    lineX = lineX + 1.6;
    lineWidth = lineWidth - 1.6;
  }
  //Figure. If line are > 350, then lines go gray
  if (lineSmile > 370) {
    lineSmileColor = #E50000;
    lineX = lineX + 2.8;
    lineWidth = lineWidth - 2.8;
  }
  if (lineSmile > 375) {
    lineSmileColor = 255;
    redLineStart = redLineStart + 2;
    stroke(#E50000);
    line(0, redLineStart, 720, redLineStart);
  }
}

