
//strokeWeight(x); sets stroke thickness
//strokeCap(x) ROUND SQUARE PROJECT sets end style
//strokeJoin(x) BEVEL
//x++ means x= x+1
//x+=y means x= x+y

int x = 0;
int sx = 0;
int sy = 0;

void setup()
{
  x = 900/182;
  size(x*182,x*182);
  smooth();
  noStroke();
  rectMode(CORNER);
  strokeCap(ROUND);
}


void draw()
{ 
  background(221,218,190);
  //----- 3 curves
  noFill();
  stroke(0);
  strokeWeight(x*.5);
  beginShape();
  vertex(x*108,x*49);
  bezierVertex(x*20,x*121,x*50,x*180,x*50,x*180);
  endShape();
  beginShape();
  vertex(x*109,x*58);
  bezierVertex(x*26,x*119,x*50,x*180,x*50,x*180);
  endShape();
  beginShape();
  vertex(x*110,x*66);
  bezierVertex(x*33,x*124,x*50,x*180,x*50,x*180);
  endShape();
  noStroke();
  //-----grey lines orange arc spread
  noFill();
  stroke(0);
  strokeWeight(x*.5);
  sy = 74;
  for(sx = 91; sx > 0; sx = sx-3)
  {
    sy = sy-2;
    beginShape();
    vertex(x*sx,x*sy);
    bezierVertex(x*(sx-34),x*(sy+10), x*(sx-72),x*(sy+31),x*(sx-72),x*(sy+31));
    endShape();
  }
  sy = 97;
  for(sx = 72; sx < 106; sx = sx+3)
  {
    sy = sy+2;
    beginShape();
    vertex(x*sx,x*sy);
    bezierVertex(x*(sx+45),x*(sy-32), x*(sx+110),x*(sy-48),x*(sx+110),x*(sy-48));
    endShape();
  }
  sx = 0;
  sy = 0;
  noStroke();
  //green rectangle
  fill(64,95,67); rect(x*0,x*0, x*28,x*182);
  //=====ln mid_top-mid
  stroke(0);
  strokeWeight(x*1);
  line(x*77,x*0, x*84,x*74);
  noStroke();
  //large blue quad
  fill (0,113,139); quad(x*74,x*92, x*118,x*101, x*118,x*182, x*74,x*182);
  //----grey strokes blue quad
  noFill();
  stroke(0);
  strokeWeight(x*.5);
  sy = 131;
  for(sx = 99; sx < 118; sx = sx+3)
  {
    sy = sy+2;
    beginShape();
    vertex(x*sx,x*sy);
    bezierVertex(x*(sx+32),x*(sy-25), x*(sx+85),x*(sy-43),x*(sx+85),x*(sy-43));
    endShape();
  }
  sx = 0;
  sy = 0;
  noStroke();
  //large red quad
  fill(200,65,70);
  quad(x*166,x*109, x*182,x*111, x*182,x*182, x*166,x*182);
  //----- grey lines red quad
  noFill();
  stroke(0);
  strokeWeight(x*.5);
  sy = 152;
  for(sx = 138; sx < 184; sx = sx+6)
  {
    sy = sy+4;
    beginShape();
    vertex(x*sx,x*sy);
    bezierVertex(x*(sx+20),x*(sy-13), x*(sx+46),x*(sy-20),x*(sx+46),x*(sy-20));
    endShape();
  }
  sx = 0;
  sy = 0;
  noStroke();
  //=====ln or_chk-rd_qd
  stroke(0);
  strokeWeight(x*1);
  line(x*39,x*74, x*168,x*125);
  noStroke();
  //=====ln or_arc-or_cr
  stroke(0);
  strokeWeight(x*1);
  line(x*0,x*40, x*113,x*48);
  noStroke();
  //grey triangle
  fill(200); triangle(x*90,x*0, x*182,x*59, x*182,x*18);
  //=====ln or_arc-gry_tr
  stroke(0);
  strokeWeight(x*1);
  line(x*0,x*5, x*162,x*12);
  noStroke();
  //white triangle
  fill(255); triangle(x*84,x*0, x*182,x*18, x*182,x*0);
  //small red quad
  fill(200,65,70); quad(x*51,x*114, x*83,x*114, x*90,x*127, x*51,x*127);
  //light grey quad
  fill(200); quad(x*54,x*121, x*80,x*121, x*80,x*182, x*54,x*182);
  //orange half-circle
  fill(233,156,100); arc(x*27,x*30,x*80,x*68,-(PI/2),PI/2);
  //brown quad
  fill(192,153,95); quad(x*0,x*121, x*28,x*132, x*28,x*182, x*0,x*182);
  //=====LN br_qd-vbl_qd
  stroke(0);
  strokeWeight(x*1);
  line(x*0,x*156, x*90,x*183);
  noStroke();
  //med grey quad
  fill(150); quad(x*109,x*129, x*129,x*129, x*129,x*182, x*109,x*182);
  //dark blue quad
  fill(50,85,135); quad(x*149,x*19, x*182,x*20, x*182,x*89, x*161,x*88);
  //=====LN gr_qd-^rd_qd
  stroke(0);
  strokeWeight(x*1);
  line(x*0,x*97, x*182,x*102);
  noStroke();
  //=====LN gr_qd-rd_qd
  stroke(0);
  strokeWeight(x*1);
  line(x*0,x*110, x*182,x*114);
  noStroke();
  //=====LN br_qd-rd_qd
  stroke(0);
  strokeWeight(x*1);
  line(x*0,x*137, x*182,x*145);
  noStroke();
  //=====ln gr_qd-or_bar
  stroke(0);
  strokeWeight(x*1);
  line(x*0,x*117, x*104,x*154);
  noStroke();
  //orange circle
  fill(231,140,90); ellipse(x*144,x*47, x*67,x*67);
  //----- grey 2 curves and top
  noFill();
  stroke(0);
  strokeWeight(x*.5);
  beginShape();
  vertex(x*178,x*51);
  bezierVertex(x*83,x*76,x*29,x*105,x*29,x*105);
  endShape();
  beginShape();
  vertex(x*178,x*53);
  bezierVertex(x*82,x*80,x*31,x*119,x*31,x*119);
  endShape();
  beginShape();
  vertex(x*42,x*24);
  bezierVertex(x*157,x*27,x*177,x*36,x*177,x*36);
  endShape();
  beginShape();
  vertex(x*51,x*47);
  bezierVertex(x*68,x*50,x*50,x*35,x*50,x*35);
  endShape();
  beginShape();
  vertex(x*70,x*35);
  bezierVertex(x*65,x*26,x*56,x*26,x*56,x*26);
  endShape();
  beginShape();
  vertex(x*65,x*39);
  bezierVertex(x*70,x*47,x*75,x*43,x*75,x*43);
  bezierVertex(x*79,x*39,x*66,x*27,x*66,x*27);
  endShape();
  line(x*82,x*24, x*100,x*24);
  line(x*100,x*24, x*100,x*78);
  line(x*117,x*82, x*42,x*58);
  line(x*29,x*15, x*111,x*12);
  line(x*67,x*1, x*77,x*15);
  line(x*77,x*15, x*87,x*1);
  line(x*100,x*25,x*112,x*25);
  line(x*100,x*28,x*112,x*28);
  line(x*100,x*31,x*112,x*31);
  line(x*100,x*34,x*110,x*34);
  line(x*100,x*37,x*107,x*37);
  line(x*100,x*40,x*104,x*40);
  line(x*100,x*43,x*102,x*43);
  noStroke();
  //=====LN BLUE
  stroke(48,94,169);
  strokeWeight(x*1);
  line(x*166,x*184, x*174,x*151);
  line(x*89,x*42, x*127,x*180);
  line(x*0,x*67, x*130,x*65);
  line(x*43,x*-2, x*76,x*120);
  noStroke();
  //purple cross
  stroke(108,73,102);
  strokeCap(SQUARE);
  strokeWeight(x*5);
  line(x*129,x*65,x*182,x*65);
  line(x*150,x*43,x*150,x*86);
  strokeCap(ROUND);
  noStroke();
  //short orange bar
  fill(231,133,79); quad(x*97,x*182, x*108,x*182, x*124,x*128, x*113,x*124);
  //small blue quad
  fill(0,135,178); quad(x*1,x*9, x*40,x*9, x*40,x*23, x*1,x*23);
  //long orange bar
  fill(231,133,79); quad(x*0,x*41, x*0,x*83, x*28,x*182, x*38,x*182);
  //orange checkmark
  fill(231,133,79);
  beginShape();
  vertex(x*10,x*7); vertex(x*20,x*3); vertex(x*64,x*160);
  vertex(x*79,x*108); vertex(x*89,x*112); vertex(x*70,x*182); vertex(x*58,x*182);
  endShape();
  //light grey/blue quad
  fill(200,215,218); quad(x*2,x*54, x*41,x*54, x*41,x*67, x*2,x*67);
  //orange blob
  fill(231,133,79);
  beginShape();
  vertex(x*35,x*55); vertex(x*36,x*59); vertex(x*32,x*65);
  vertex(x*26,x*65); vertex(x*25,x*61); vertex(x*26,x*55);
  endShape();
  //===== Short Black Strokes
  stroke(0);
  strokeWeight(x*1);
  line(x*146,x*144, x*156,x*163);
  line(x*131,x*154, x*147,x*161);
  line(x*154,x*171, x*161,x*183);
  line(x*80,x*149, x*84,x*156);
  line(x*108,x*162, x*128,x*162);
  noStroke();
  //===== large black boxes
  stroke(0);
  noFill();
  strokeWeight(x*1);
  rectMode(CORNERS);
  rect(x*147,x*106, x*184,x*184);
  rectMode(CORNERS);
  rect(x*-2,x*144, x*131,x*184);
  noStroke();
  //red arc
  fill(200,65,70); arc(x*118,x*162, x*22,x*24, PI,2*PI);
  //redconstruct
  fill(200,65,70);
  beginShape();
  vertex(x*96,x*162);
  vertex(x*107,x*162);
  bezierVertex(x*107,x*174,x*118,x*174,x*118,x*174);
  bezierVertex(x*129,x*174,x*129,x*162,x*129,x*162);
  vertex(x*154,x*162);
  vertex(x*154,x*182);
  vertex(x*96,x*180);
  endShape();
  //=====LN mid_top-or_chk
  stroke(0);
  strokeWeight(x*1);
  line(x*92,x*3, x*83,x*137);
  noStroke();
  //=====LN br_qd-rd_arc
  stroke(0);
  strokeWeight(x*1);
  line(x*0,x*156, x*107,x*156);
  noStroke();
  //===== Small black boxes
  stroke(0);
  noFill();
  strokeWeight(x*1);
  rectMode(CORNERS);
  rect(x*2,x*160, x*42,x*184);
  rectMode(CORNERS);
  rect(x*50,x*162, x*89,x*184);
  noStroke();
  
  //blue diamonds
  sx = 18;
  sy = 27;
  fill(0,135,178); quad(x*sx,x*sy, x*(sx+7),x*(sy+4), x*sx,x*(sy+8), x*(sx-7),x*(sy+4));
  
  sx = 29;
  sy = 33;
  fill(0,135,178); quad(x*sx,x*sy, x*(sx+7),x*(sy+4), x*sx,x*(sy+8), x*(sx-7),x*(sy+4));
  
  sx = 18;
  sy = 40;
  fill(0,135,178); quad(x*sx,x*sy, x*(sx+7),x*(sy+4), x*sx,x*(sy+8), x*(sx-7),x*(sy+4));
  
  //green stars
  sx = 156;
  sy = 122;
  fill(0,158,153);
  beginShape();
  vertex(x*sx,x*(sy-1));
  vertex(x*(sx+1),x*(sy+1));
  vertex(x*(sx+3),x*(sy+1));
  vertex(x*(sx+1),x*(sy+2));
  vertex(x*(sx+2),x*(sy+4));
  vertex(x*sx,x*(sy+3));
  vertex(x*(sx-2),x*(sy+4));
  vertex(x*(sx-1),x*(sy+2));
  vertex(x*(sx-3),x*(sy+1));
  vertex(x*(sx-1),x*(sy+1));
  endShape();
  
  sx = 163;
  sy = 122;
  fill(0,158,153);
  beginShape();
  vertex(x*sx,x*(sy-1));
  vertex(x*(sx+1),x*(sy+1));
  vertex(x*(sx+3),x*(sy+1));
  vertex(x*(sx+1),x*(sy+2));
  vertex(x*(sx+2),x*(sy+4));
  vertex(x*sx,x*(sy+3));
  vertex(x*(sx-2),x*(sy+4));
  vertex(x*(sx-1),x*(sy+2));
  vertex(x*(sx-3),x*(sy+1));
  vertex(x*(sx-1),x*(sy+1));
  endShape();
  
  sx = 170;
  sy = 122;
  fill(0,158,153);
  beginShape();
  vertex(x*sx,x*(sy-1));
  vertex(x*(sx+1),x*(sy+1));
  vertex(x*(sx+3),x*(sy+1));
  vertex(x*(sx+1),x*(sy+2));
  vertex(x*(sx+2),x*(sy+4));
  vertex(x*sx,x*(sy+3));
  vertex(x*(sx-2),x*(sy+4));
  vertex(x*(sx-1),x*(sy+2));
  vertex(x*(sx-3),x*(sy+1));
  vertex(x*(sx-1),x*(sy+1));
  endShape();
  
  sx = 177;
  sy = 122;
  fill(0,158,153);
  beginShape();
  vertex(x*sx,x*(sy-1));
  vertex(x*(sx+1),x*(sy+1));
  vertex(x*(sx+3),x*(sy+1));
  vertex(x*(sx+1),x*(sy+2));
  vertex(x*(sx+2),x*(sy+4));
  vertex(x*sx,x*(sy+3));
  vertex(x*(sx-2),x*(sy+4));
  vertex(x*(sx-1),x*(sy+2));
  vertex(x*(sx-3),x*(sy+1));
  vertex(x*(sx-1),x*(sy+1));
  endShape();
  
  //large thick black line
  noFill();
  stroke(0);
  strokeWeight(x*3);
  beginShape();
  vertex(x*0,x*90);
  bezierVertex(x*29,x*38,x*82,x*0,x*82,x*0);
  endShape();
  noStroke();
}



