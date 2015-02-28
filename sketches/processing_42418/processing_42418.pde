
//Author:yi-ting sie
//Purpose:a window with a view.消失的米奇。
//Explain how it works:滑鼠移置畫面時，可產生三個圓圈，並隨著滑鼠移動變更圓圈與背景顏色。
//References:1.P&A Lab(2010),space_eyes(Processing_Titorial_mouseX & mouseY) 滑鼠操作畫圖, http://pandalabccc.blogspot.com/2010/04/spaceeyesprocessingtitorialmousex.html.
//           2.Sheng-Fen Nik Chien(2010),circles,http://www.openprocessing.org/visuals/?visualID=8012.
//           3.Sheng-Fen Nik Chien(2011),成功大學數位學習平台數位資訊創作DESIGN PROGRAMMING DESIGN,http://moodle.ncku.edu.tw/course/view.php?id=43022


float aaa=second();
float bbb=second();

void setup() {
  size(500, 300);
  frameRate(5);
  background(255);
  smooth();
}


void draw() {
  background(mouseX, mouseY, (mouseX+mouseY)/4);

  aaa=aaa+1;
  strokeWeight(2);
  fill(mouseX, mouseY, (mouseX+mouseY));
  ellipse(mouseX, mouseY, aaa*4, aaa*4);

  if (aaa>25) {
    aaa=0;
  }

  bbb=bbb+0.5;
  strokeWeight(2);
  fill(mouseX, mouseY, (mouseX+mouseY));
  ellipse(mouseX-50, mouseY-70, bbb*2, bbb*2);
  ellipse(mouseX+50, mouseY-70, bbb*2, bbb*2);
  if (bbb>25) {
    bbb=0;
  }
}

void keyPressed() {
  saveFrame("mickey.jpg");
}


