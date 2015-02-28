
void setup() {
  smooth();
  size(650, 500);
}


void draw() {
  //background
  background(0, 213, 255);
  fill(0,41,111,mouseX/2);
  rect(0,0,width, height);



  //body-paws
  //fill(244, 132, 0);
  fill(244, 132, 0);

  triangle(250, 347, 280, 347, 247, 450);
  triangle(300, 349, 330, 350, 350, 450);
  triangle(450, 357, 480, 358, 475,455);
  triangle(520, 361, 550, 362, 555, 455);

  quad(258, 251, 506, 290, 556, 363, 250, 346);

  fill(244, 102, 0, mouseX/3);


  triangle(250, 347, 280, 347, 247, 450);
  triangle(300, 349, 330, 350, 350, 450);
  triangle(450, 357, 480, 358, 475,455);
  triangle(520, 361, 550, 362, 555, 455);

  quad(258, 251, 506, 290, 556, 363, 250, 346);


  //head
  int x = 260;
  int y = 244;
  fill(244,132,0);
  ellipse(x, y-20, 109, 99);
  fill(244, 192, 100);
  ellipse(x, y, 45, 45);


  fill(244,102,0,mouseX/2);
  ellipse(x, y-20, 109, 99);
  fill(244, 192, 100);
  ellipse(x, y, 45, 45);


  //nose
  fill(120, 92, 0);
  triangle(260, 240, 250, 230, 270, 230);
  fill(244, 132, 0);


  //mouth
  line(260, 240, 260, 250);
  line(260, 250, 250, 260);
  line(260, 250, 270, 260);

  //eyes
  fill(244, 232, 118);
  triangle(225, 220, 225, 210, 245, 215);
  triangle(276, 215, 297, 220, 297, 210);
  fill(244, 132, 0);

  //eyebrows
  line(230, 190, 220, 200);
  line(290, 190, 300, 200);

  //cheeks
  line(245, 275, 215, 225);
  line(275, 275, 305, 230);

  //nose
  fill(244, 192, 100);
  triangle(243, 272, 277, 272, 259, 289);
  fill(244, 132, 0);

  //ears
  fill(244, 135, 0);
  int x1 = 206;
  int y1 = 225;
  int cx1 = 154;
  int cy1 = 200;
  int cx2 = 198;
  int cy2 = 145;
  int x2 = 229;
  int y2 = 185;


  bezier(x1, y1, cx1, cy1,  cx2, cy2,  x2, y2);
  bezier(x1+108, y1, cx1+210, cy1, cx2+140, cy2, x2+68, y2);

  bezier(x1+4, y1-10, cx1+40, cy1+5, cx2+35, cy2+40, x2-23, y2-14);
  bezier(x1+107, y1-10, cx1+180, cy1+6, cx2+98, cy2+40, x2+95, y2-14);

  fill(244, 92, 0, mouseX/2);


  bezier(x1, y1, cx1, cy1,  cx2, cy2,  x2, y2);
  bezier(x1+108, y1, cx1+210, cy1, cx2+140, cy2, x2+68, y2);

  bezier(x1+4, y1-10, cx1+40, cy1+5, cx2+35, cy2+40, x2-23, y2-14);
  bezier(x1+107, y1-10, cx1+180, cy1+6, cx2+98, cy2+40, x2+95, y2-14);

  //inner eyes
  fill(0);
  ellipse(284, 213, 4, 4);
  ellipse(228, 213, 4, 4);

  //sun


  if(mouseX>325) {
    //night
    fill(255);
    ellipse(70, 70, 70, 70);
    ellipse(300, 60, 4, 4);
    ellipse(400, 79, 4, 4);
    ellipse(500, 180, 4,4);
   
    }else {     
      fill(244, 240, 0);
 ellipse(70, 70, 90, 90);
 
    }
    
 }
  




















