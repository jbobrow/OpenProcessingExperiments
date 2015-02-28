
float x;
float easing=0.04;


void setup() {
  size(600, 400);
  smooth();
  fill(180);
}

void draw() {
  //x=x+100;
  float x=mouseX;
  background(180);


  float hx=map(mouseX, 0, width, 50, 150);
  float fx =map(mouseX, 0, width, 80, 120);
  float gx=map(mouseX, 0, width, 65, 135);
  
  float targetHx=hx;
  hx+=(targetHx-hx)*easing; 
  
  noStroke();

  fill(0);
  beginShape();
  vertex(hx, 25);
  vertex(hx-70, 25);
  vertex(hx-70, 125);
  vertex(hx-40, 125);
  vertex(hx-40, 90);
  vertex(hx, 90);
  vertex(hx, 60);
  vertex(hx-40, 60);
  vertex(hx-40, 55);
  vertex(hx, 55);
  endShape();

  beginShape();
  vertex(hx+120, 25);
  vertex(hx+50, 25);
  vertex(hx+50, 125);
  vertex(hx+120, 125);
  vertex(hx+120, 95);
  vertex(hx+80, 95);
  vertex(hx+80, 90);
  vertex(hx+120, 90);
  vertex(hx+120, 60);
  vertex(hx+80, 60);
  vertex(hx+80, 55);
  vertex(hx+120, 55);
  endShape();

  beginShape();
  vertex(hx+240, 25);
  vertex(hx+170, 25);
  vertex(hx+170, 125);
  vertex(hx+240, 125);
  vertex(hx+240, 95);
  vertex(hx+200, 95);
  vertex(hx+200, 90);
  vertex(hx+240, 90);
  vertex(hx+240, 60);
  vertex(hx+200, 60);
  vertex(hx+200, 55);
  vertex(hx+240, 55);
  endShape();

  beginShape();
  vertex(hx+360, 95);
  vertex(hx+320, 95);
  vertex(hx+320, 25);
  vertex(hx+290, 25);
  vertex(hx+290, 125);
  vertex(hx+360, 125);
  endShape();

  beginShape();
  vertex(hx, 205);
  vertex(hx-70, 205);
  vertex(hx-70, 305);
  vertex(hx, 305);
  vertex(hx, 275);
  vertex(hx-40, 275);
  vertex(hx-40, 235);
  vertex(hx, 235);
  endShape();

  beginShape();
  vertex(hx+120, 205);
  vertex(hx+50, 205);
  vertex(hx+50, 305);
  vertex(hx+120, 305);
  endShape();

  fill(180);
  beginShape();
  vertex(hx+90, 235);
  vertex(hx+80, 235);
  vertex(hx+80, 275);
  vertex(hx+90, 275);
  endShape();

  fill(0);
  beginShape();
  vertex(hx+240, 205);
  vertex(hx+170, 205);
  vertex(hx+170, 305);
  vertex(hx+240, 305);
  endShape();

  fill(180);
  beginShape();
  vertex(hx+210, 235);
  vertex(hx+200, 235);
  vertex(hx+200, 275);
  vertex(hx+210, 275);
  endShape();

  fill(0);
  beginShape();
  vertex(hx+360, 275);
  vertex(hx+320, 275);
  vertex(hx+320, 205);
  vertex(hx+290, 205);
  vertex(hx+290, 305);
  vertex(hx+360, 305);
  endShape();
 
 
    stroke(2);
    fill(180);
    //heng
    quad(fx+30, 70, hx+30, 60, hx+30, 90, fx+30, 100);
    quad(hx, 90, fx, 100, fx, 70, hx, 60);
    quad(fx, 70, hx, 60, hx+30, 60, fx+30, 70);


    quad(fx+30, 35, hx+30, 25, hx+30, 55, fx+30, 65);
    quad(hx, 25, fx, 35, fx, 65, hx, 55);
    quad(fx, 35, hx, 25, hx+30, 25, fx+30, 35);

    //shu
    quad(130, 40, fx+30, 35, fx+30, 135, 130, 140);
    quad(100, 40, fx, 35, fx, 135, 100, 140);
    rect(100, 40, 30, 100);
    quad(fx, 35, 100, 40, 130, 40, fx+30, 35);

    //e
    quad(fx+150, 105, hx+150, 95, hx+150, 125, fx+150, 135);
    quad(hx+120, 125, fx+120, 135, fx+120, 105, hx+120, 95);
    quad(fx+120, 105, hx+120, 95, hx+150, 95, fx+150, 105);

    quad(fx+150, 70, hx+150, 60, hx+150, 90, fx+150, 100);
    quad(hx+120, 90, fx+120, 100, fx+120, 70, hx+120, 60);
    quad(fx+120, 70, hx+120, 60, hx+150, 60, fx+150, 70);


    quad(fx+150, 35, hx+150, 25, hx+150, 55, fx+150, 65);
    quad(hx+120, 25, fx+120, 35, fx+120, 65, hx+120, 55);
    quad(fx+120, 35, hx+120, 25, hx+150, 25, fx+150, 35);


    quad(250, 40, fx+150, 35, fx+150, 135, 250, 140);
    quad(220, 40, fx+120, 35, fx+120, 135, 220, 140);
    rect(220, 40, 30, 100);
    quad(fx+120, 35, 220, 40, 250, 40, fx+150, 35);

    //e
    quad(fx+270, 105, hx+270, 95, hx+270, 125, fx+270, 135);
    quad(hx+240, 125, fx+240, 135, fx+240, 105, hx+240, 95);
    quad(fx+240, 105, hx+240, 95, hx+270, 95, fx+270, 105);

    quad(fx+270, 70, hx+270, 60, hx+270, 90, fx+270, 100);
    quad(hx+240, 90, fx+240, 100, fx+240, 70, hx+240, 60);
    quad(fx+240, 70, hx+240, 60, hx+270, 60, fx+270, 70);


    quad(fx+270, 35, hx+270, 25, hx+270, 55, fx+270, 65);
    quad(hx+240, 25, fx+240, 35, fx+240, 65, hx+240, 55);
    quad(fx+240, 35, hx+240, 25, hx+270, 25, fx+270, 35);


    quad(370, 40, fx+270, 35, fx+270, 135, 370, 140);
    quad(340, 40, fx+240, 35, fx+240, 135, 340, 140);
    rect(340, 40, 30, 100);
    quad(fx+240, 35, 340, 40, 370, 40, fx+270, 35);

    //l

    quad(fx+390, 105, hx+390, 95, hx+390, 125, fx+390, 135);
    quad(hx+360, 125, fx+360, 135, fx+360, 105, hx+360, 95);
    quad(fx+360, 105, hx+360, 95, hx+390, 95, fx+390, 105);


    quad(490, 40, fx+390, 35, fx+390, 135, 490, 140);
    quad(460, 40, fx+360, 35, fx+360, 135, 460, 140);
    rect(460, 40, 30, 100);
    quad(fx+360, 35, 460, 40, 490, 40, fx+390, 35);


    //g
    quad(fx+30, 285, hx+30, 275, hx+30, 305, fx+30, 315);
    quad(hx, 305, fx, 315, fx, 285, hx, 275);
    quad(fx, 285, hx, 275, hx+30, 275, fx+30, 285);

    //quad(gx, 280, gx+30, 280, gx+30, 260, gx, 260);
    //quad(gx, 260, gx+30, 260, hx+30, 255, hx, 255);
    //quad(gx, 280, gx, 260, hx, 255, hx, 275);
    //quad(gx+30, 280, gx+30, 260, hx+30, 255, hx+30, 275);

    quad(fx+30, 215, hx+30, 205, hx+30, 235, fx+30, 245);
    quad(hx, 205, fx, 215, fx, 245, hx, 235);
    quad(fx, 215, hx, 205, hx+30, 205, fx+30, 215);


    quad(130, 220, fx+30, 215, fx+30, 315, 130, 320);
    quad(100, 220, fx, 215, fx, 315, 100, 320);
    rect(100, 220, 30, 100);
    quad(fx, 215, 100, 220, 130, 220, fx+30, 215);

    //o
    quad(gx+120, 310, gx+150, 310, gx+150, 210, gx+120, 210);
    quad(gx+120, 310, hx+120, 305, hx+120, 205, gx+120, 210);
    quad(gx+150, 310, hx+150, 305, hx+150, 205, gx+150, 210);
    quad(gx+120, 210, gx+150, 210, hx+150, 205, hx+120, 205);

    quad(fx+150, 315, gx+150, 310, gx+150, 280, fx+150, 285);
    quad(gx+120, 310, fx+120, 315, fx+120, 285, gx+120, 280);
    quad(fx+120, 285, gx+120, 280, gx+150, 280, fx+150, 285);


    quad(fx+150, 215, gx+150, 210, gx+150, 240, fx+150, 245);
    quad(gx+120, 210, fx+120, 215, fx+120, 245, gx+120, 240);
    quad(fx+120, 215, gx+120, 210, gx+150, 210, fx+150, 215);


    quad(250, 220, fx+150, 215, fx+150, 315, 250, 320);
    quad(220, 220, fx+120, 215, fx+120, 315, 220, 320);
    rect(220, 220, 30, 100);
    quad(fx+120, 215, 220, 220, 250, 220, fx+150, 215);

    //o
    quad(gx+240, 310, gx+270, 310, gx+270, 210, gx+240, 210);
    quad(gx+240, 310, hx+240, 305, hx+240, 205, gx+240, 210);
    quad(gx+270, 310, hx+270, 305, hx+270, 205, gx+270, 210);
    quad(gx+240, 210, gx+270, 210, hx+270, 205, hx+240, 205);

    quad(fx+270, 315, gx+270, 310, gx+270, 280, fx+270, 285);
    quad(gx+240, 310, fx+240, 315, fx+240, 285, gx+240, 280);
    quad(fx+240, 285, gx+240, 280, gx+270, 280, fx+270, 285);


    quad(fx+270, 215, gx+270, 210, gx+270, 240, fx+270, 245);
    quad(gx+240, 210, fx+240, 215, fx+240, 245, gx+240, 240);
    quad(fx+240, 215, gx+240, 210, gx+270, 210, fx+270, 215);


    quad(370, 220, fx+270, 215, fx+270, 315, 370, 320);
    quad(340, 220, fx+240, 215, fx+240, 315, 340, 320);
    rect(340, 220, 30, 100);
    quad(fx+240, 215, 340, 220, 370, 220, fx+270, 215);

    //d
    quad(fx+390, 285, hx+390, 275, hx+390, 305, fx+390, 315);
    quad(hx+360, 305, fx+360, 315, fx+360, 285, hx+360, 275);
    quad(fx+360, 285, hx+360, 275, hx+390, 275, fx+390, 285);

    quad(490, 220, fx+390, 215, fx+390, 315, 490, 320);
    quad(460, 220, fx+360, 215, fx+360, 315, 460, 320);
    rect(460, 220, 30, 100);
    quad(fx+360, 215, 460, 220, 490, 220, fx+390, 215);
  }
