
void setup () {
   size(900, 900);
   smooth();
   background(255);
   frameRate(60);
}
 
/////////////////////////////////////
 
void draw () {
  fill(255);
  rect(0,0,width,height);
  if(mousePressed){
    // Links
    line(0,0,mouseX,mouseY);
    line(0,10,mouseX,mouseY);
    line(0,20,mouseX,mouseY);
    line(0,30,mouseX,mouseY);
    line(0,40,mouseX,mouseY);
    line(0,50,mouseX,mouseY);
    line(0,60,mouseX,mouseY);
    line(0,70,mouseX,mouseY);
    line(0,80,mouseX,mouseY);
    line(0,90,mouseX,mouseY);
    line(0,100,mouseX,mouseY);
    line(0,110,mouseX,mouseY);
    line(0,120,mouseX,mouseY);
    line(0,130,mouseX,mouseY);
    line(0,140,mouseX,mouseY);
    line(0,150,mouseX,mouseY);
    line(0,160,mouseX,mouseY);
    line(0,170,mouseX,mouseY);
    line(0,180,mouseX,mouseY);
    line(0,190,mouseX,mouseY);
    line(0,200,mouseX,mouseY);
    line(0,210,mouseX,mouseY);
    line(0,220,mouseX,mouseY);
    line(0,230,mouseX,mouseY);
    line(0,240,mouseX,mouseY);
    line(0,250,mouseX,mouseY);
    line(0,260,mouseX,mouseY);
    line(0,270,mouseX,mouseY);
    line(0,280,mouseX,mouseY);
    line(0,290,mouseX,mouseY);
    line(0,300,mouseX,mouseY); 
    // oben
    line(10,0,mouseX,mouseY);
    line(20,0,mouseX,mouseY);
    line(30,0,mouseX,mouseY);
    line(40,0,mouseX,mouseY);
    line(50,0,mouseX,mouseY);
    line(60,0,mouseX,mouseY);
    line(70,0,mouseX,mouseY);
    line(80,0,mouseX,mouseY);
    line(90,0,mouseX,mouseY);
    line(100,0,mouseX,mouseY);
    line(110,0,mouseX,mouseY);
    line(120,0,mouseX,mouseY);
    line(130,0,mouseX,mouseY);
    line(140,0,mouseX,mouseY);
    line(150,0,mouseX,mouseY);
    line(160,0,mouseX,mouseY);
    line(170,0,mouseX,mouseY);
    line(180,0,mouseX,mouseY);
    line(190,0,mouseX,mouseY);
    line(200,0,mouseX,mouseY);
    line(210,0,mouseX,mouseY);
    line(220,0,mouseX,mouseY);
    line(230,0,mouseX,mouseY);
    line(240,0,mouseX,mouseY);
    line(250,0,mouseX,mouseY);
    line(260,0,mouseX,mouseY);
    line(270,0,mouseX,mouseY);
    line(280,0,mouseX,mouseY);
    line(290,0,mouseX,mouseY);
    line(300,0,mouseX,mouseY);
    //rechts   
    line(300,10,mouseX,mouseY);
    line(300,20,mouseX,mouseY);
    line(300,30,mouseX,mouseY);
    line(300,40,mouseX,mouseY);
    line(300,50,mouseX,mouseY);
    line(300,60,mouseX,mouseY);
    line(300,70,mouseX,mouseY);
    line(300,80,mouseX,mouseY);
    line(300,90,mouseX,mouseY);
    line(300,100,mouseX,mouseY);
    line(300,110,mouseX,mouseY);
    line(300,120,mouseX,mouseY);
    line(300,130,mouseX,mouseY);
    line(300,140,mouseX,mouseY);
    line(300,150,mouseX,mouseY);
    line(300,160,mouseX,mouseY);
    line(300,170,mouseX,mouseY);
    line(300,180,mouseX,mouseY);
    line(300,190,mouseX,mouseY);
    line(300,200,mouseX,mouseY);
    line(300,210,mouseX,mouseY);
    line(300,220,mouseX,mouseY);
    line(300,230,mouseX,mouseY);
    line(300,240,mouseX,mouseY);
    line(300,250,mouseX,mouseY);
    line(300,260,mouseX,mouseY);
    line(300,270,mouseX,mouseY);
    line(300,280,mouseX,mouseY);
    line(300,290,mouseX,mouseY);
    line(300,300,mouseX,mouseY);
    // unten
    line(10,300,mouseX,mouseY);
    line(20,300,mouseX,mouseY);
    line(30,300,mouseX,mouseY);
    line(40,300,mouseX,mouseY);
    line(50,300,mouseX,mouseY);
    line(60,300,mouseX,mouseY);
    line(70,300,mouseX,mouseY);
    line(80,300,mouseX,mouseY);
    line(90,300,mouseX,mouseY);
    line(100,300,mouseX,mouseY);
    line(110,300,mouseX,mouseY);
    line(120,300,mouseX,mouseY);
    line(130,300,mouseX,mouseY);
    line(140,300,mouseX,mouseY);
    line(150,300,mouseX,mouseY);
    line(160,300,mouseX,mouseY);
    line(170,300,mouseX,mouseY);
    line(180,300,mouseX,mouseY);
    line(190,300,mouseX,mouseY);
    line(200,300,mouseX,mouseY);
    line(210,300,mouseX,mouseY);
    line(220,300,mouseX,mouseY);
    line(230,300,mouseX,mouseY);
    line(240,300,mouseX,mouseY);
    line(250,300,mouseX,mouseY);
    line(260,300,mouseX,mouseY);
    line(270,300,mouseX,mouseY);
    line(280,300,mouseX,mouseY);
    line(290,300,mouseX,mouseY);
    line(300,300,mouseX,mouseY);
////////////////////////////////////////////
  }else{
    fill(255);
    rect(0,0,width,height);
    noFill();
////////////////////////////////////////////
// Links
  beginShape ();
  curveVertex (0, 0);
  curveVertex (0, 0);
  curveVertex (mouseX+mouseY/2-300, mouseY-mouseX/2);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
beginShape ();
  curveVertex (0, 10);
  curveVertex (0, 10);
  curveVertex (mouseX+mouseY/2-290, mouseY-mouseX/2+10);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
beginShape ();
  curveVertex (0, 20);
  curveVertex (0, 20);
  curveVertex (mouseX+mouseY/2-280, mouseY-mouseX/2+20);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
beginShape ();
  curveVertex (0, 30);
  curveVertex (0, 30);
  curveVertex (mouseX+mouseY/2-270, mouseY-mouseX/2+30);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
beginShape ();
  curveVertex (0, 40);
  curveVertex (0, 40);
  curveVertex (mouseX+mouseY/2-260, mouseY-mouseX/2+40);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
beginShape ();
  curveVertex (0, 50);
  curveVertex (0, 50);
  curveVertex (mouseX+mouseY/2-250, mouseY-mouseX/2+50);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
beginShape ();
  curveVertex (0, 60);
  curveVertex (0, 60);
  curveVertex (mouseX+mouseY/2-240, mouseY-mouseX/2+60);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
beginShape ();
  curveVertex (0, 70);
  curveVertex (0, 70);
  curveVertex (mouseX+mouseY/2-230, mouseY-mouseX/2+70);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
beginShape ();
  curveVertex (0, 80);
  curveVertex (0, 80);
  curveVertex (mouseX+mouseY/2-220, mouseY-mouseX/2+80);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
beginShape ();
  curveVertex (0, 90);
  curveVertex (0, 90);
  curveVertex (mouseX+mouseY/2-210, mouseY-mouseX/2+90);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
beginShape ();
  curveVertex (0, 100);
  curveVertex (0, 100);
  curveVertex (mouseX+mouseY/2-200, mouseY-mouseX/2+100);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
beginShape ();
  curveVertex (0, 110);
  curveVertex (0, 110);
  curveVertex (mouseX+mouseY/2-190, mouseY-mouseX/2+110);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
beginShape ();
  curveVertex (0, 120);
  curveVertex (0, 120);
  curveVertex (mouseX+mouseY/2-180, mouseY-mouseX/2+120);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
beginShape ();
  curveVertex (0, 130);
  curveVertex (0, 130);
  curveVertex (mouseX+mouseY/2-170, mouseY-mouseX/2+130);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
beginShape ();
  curveVertex (0, 140);
  curveVertex (0, 140);
  curveVertex (mouseX+mouseY/2-160, mouseY-mouseX/2+140);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
beginShape ();
  curveVertex (0, 150);
  curveVertex (0, 150);
  curveVertex (mouseX+mouseY/2-150, mouseY-mouseX/2+150);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
beginShape ();
  curveVertex (0, 160);
  curveVertex (0, 160);
  curveVertex (mouseX+mouseY/2-140, mouseY-mouseX/2+160);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
beginShape ();
  curveVertex (0, 170);
  curveVertex (0, 170);
  curveVertex (mouseX+mouseY/2-130, mouseY-mouseX/2+170);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
beginShape ();
  curveVertex (0, 180);
  curveVertex (0, 180);
  curveVertex (mouseX+mouseY/2-120, mouseY-mouseX/2+180);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
beginShape ();
  curveVertex (0, 190);
  curveVertex (0, 190);
  curveVertex (mouseX+mouseY/2-110, mouseY-mouseX/2+190);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
beginShape ();
  curveVertex (0, 200);
  curveVertex (0, 200);
  curveVertex (mouseX+mouseY/2-100, mouseY-mouseX/2+200);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
beginShape ();
  curveVertex (0, 210);
  curveVertex (0, 210);
  curveVertex (mouseX+mouseY/2-90, mouseY-mouseX/2+210);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
beginShape ();
  curveVertex (0, 220);
  curveVertex (0, 220);
  curveVertex (mouseX+mouseY/2-80, mouseY-mouseX/2+220);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
beginShape ();
  curveVertex (0, 230);
  curveVertex (0, 230);
  curveVertex (mouseX+mouseY/2-70, mouseY-mouseX/2+230);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
beginShape ();
  curveVertex (0, 240);
  curveVertex (0, 240);
  curveVertex (mouseX+mouseY/2-60, mouseY-mouseX/2+240);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
beginShape ();
  curveVertex (0, 250);
  curveVertex (0, 250);
  curveVertex (mouseX+mouseY/2-50, mouseY-mouseX/2+250);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
beginShape ();
  curveVertex (0, 260);
  curveVertex (0, 260);
  curveVertex (mouseX+mouseY/2-40, mouseY-mouseX/2+260);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
beginShape ();
  curveVertex (0, 270);
  curveVertex (0, 270);
  curveVertex (mouseX+mouseY/2-30, mouseY-mouseX/2+270);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
beginShape ();
  curveVertex (0, 280);
  curveVertex (0, 280);
  curveVertex (mouseX+mouseY/2-20, mouseY-mouseX/2+280);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
beginShape ();
  curveVertex (0, 290);
  curveVertex (0, 290);
  curveVertex (mouseX+mouseY/2-10, mouseY-mouseX/2+290);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
beginShape ();
  curveVertex (0, 300);
  curveVertex (0, 300);
  curveVertex (mouseX+mouseY/2-0, mouseY-mouseX/2+300);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
   
// oben
  beginShape ();
  curveVertex (10, 0);
  curveVertex (10, 0);
  curveVertex (mouseX-mouseY/2-140, mouseY-mouseX/2);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (20, 0);
  curveVertex (20, 0);
  curveVertex (mouseX-mouseY/2-130, mouseY-mouseX/2);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (30, 0);
  curveVertex (30, 0);
  curveVertex (mouseX-mouseY/2-120, mouseY-mouseX/2);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (40, 0);
  curveVertex (40, 0);
  curveVertex (mouseX-mouseY/2-110, mouseY-mouseX/2);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (50, 0);
  curveVertex (50, 0);
  curveVertex (mouseX-mouseY/2-100, mouseY-mouseX/2);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (60, 0);
  curveVertex (60, 0);
  curveVertex (mouseX-mouseY/2-90, mouseY-mouseX/2);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (70, 0);
  curveVertex (70, 0);
  curveVertex (mouseX-mouseY/2-80, mouseY-mouseX/2);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (80, 0);
  curveVertex (80, 0);
  curveVertex (mouseX-mouseY/2-70, mouseY-mouseX/2);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (90, 0);
  curveVertex (90, 0);
  curveVertex (mouseX-mouseY/2-60, mouseY-mouseX/2);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (100, 0);
  curveVertex (100, 0);
  curveVertex (mouseX-mouseY/2-50, mouseY-mouseX/2);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (110, 0);
  curveVertex (110, 0);
  curveVertex (mouseX-mouseY/2-40, mouseY-mouseX/2);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (120, 0);
  curveVertex (120, 0);
  curveVertex (mouseX-mouseY/2-30, mouseY-mouseX/2);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (130, 0);
  curveVertex (130, 0);
  curveVertex (mouseX-mouseY/2-20, mouseY-mouseX/2);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (140, 0);
  curveVertex (140, 0);
  curveVertex (mouseX-mouseY/2-10, mouseY-mouseX/2);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (150, 0);
  curveVertex (150, 0);
  curveVertex (mouseX-mouseY/2+0, mouseY-mouseX/2);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (160, 0);
  curveVertex (160, 0);
  curveVertex (mouseX-mouseY/2+10, mouseY-mouseX/2);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (170, 0);
  curveVertex (170, 0);
  curveVertex (mouseX-mouseY/2+20, mouseY-mouseX/2);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (180, 0);
  curveVertex (180, 0);
  curveVertex (mouseX-mouseY/2+30, mouseY-mouseX/2);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (190, 0);
  curveVertex (190, 0);
  curveVertex (mouseX-mouseY/2+40, mouseY-mouseX/2);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (200, 0);
  curveVertex (200, 0);
  curveVertex (mouseX-mouseY/2+50, mouseY-mouseX/2);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (210, 0);
  curveVertex (210, 0);
  curveVertex (mouseX-mouseY/2+60, mouseY-mouseX/2);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (220, 0);
  curveVertex (220, 0);
  curveVertex (mouseX-mouseY/2+70, mouseY-mouseX/2);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (230, 0);
  curveVertex (230, 0);
  curveVertex (mouseX-mouseY/2+80, mouseY-mouseX/2);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (240, 0);
  curveVertex (240, 0);
  curveVertex (mouseX-mouseY/2+90, mouseY-mouseX/2);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (250, 0);
  curveVertex (250, 0);
  curveVertex (mouseX-mouseY/2+100, mouseY-mouseX/2);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (260, 0);
  curveVertex (260, 0);
  curveVertex (mouseX-mouseY/2+110, mouseY-mouseX/2);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (270, 0);
  curveVertex (270, 0);
  curveVertex (mouseX-mouseY/2+120, mouseY-mouseX/2);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (280, 0);
  curveVertex (280, 0);
  curveVertex (mouseX-mouseY/2+130, mouseY-mouseX/2);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (290, 0);
  curveVertex (290, 0);
  curveVertex (mouseX-mouseY/2+140, mouseY-mouseX/2);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (300, 0);
  curveVertex (300, 0);
  curveVertex (mouseX-mouseY/2+150, mouseY-mouseX/2);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
   
// Rechts
  beginShape ();
  curveVertex (300, 0);
  curveVertex (300, 0);
  curveVertex (mouseX+mouseY/2, mouseY-mouseX/2-150);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (300, 10);
  curveVertex (300, 10);
  curveVertex (mouseX+mouseY/2, mouseY-mouseX/2-140);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (300, 20);
  curveVertex (300, 20);
  curveVertex (mouseX+mouseY/2, mouseY-mouseX/2-130);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (300, 30);
  curveVertex (300, 30);
  curveVertex (mouseX+mouseY/2, mouseY-mouseX/2-120);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (300, 40);
  curveVertex (300, 40);
  curveVertex (mouseX+mouseY/2, mouseY-mouseX/2-110);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (300, 50);
  curveVertex (300, 50);
  curveVertex (mouseX+mouseY/2, mouseY-mouseX/2-100);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (300, 60);
  curveVertex (300, 60);
  curveVertex (mouseX+mouseY/2, mouseY-mouseX/2-90);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (300, 70);
  curveVertex (300, 70);
  curveVertex (mouseX+mouseY/2, mouseY-mouseX/2-80);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (300, 80);
  curveVertex (300, 80);
  curveVertex (mouseX+mouseY/2, mouseY-mouseX/2-70);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (300, 90);
  curveVertex (300, 90);
  curveVertex (mouseX+mouseY/2, mouseY-mouseX/2-60);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (300, 100);
  curveVertex (300, 100);
  curveVertex (mouseX+mouseY/2, mouseY-mouseX/2-50);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (300, 110);
  curveVertex (300, 110);
  curveVertex (mouseX+mouseY/2, mouseY-mouseX/2-40);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (300, 120);
  curveVertex (300, 120);
  curveVertex (mouseX+mouseY/2, mouseY-mouseX/2-30);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (300, 130);
  curveVertex (300, 130);
  curveVertex (mouseX+mouseY/2, mouseY-mouseX/2-20);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (300, 140);
  curveVertex (300, 140);
  curveVertex (mouseX+mouseY/2, mouseY-mouseX/2-10);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (300, 150);
  curveVertex (300, 150);
  curveVertex (mouseX+mouseY/2, mouseY-mouseX/2-0);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (300, 160);
  curveVertex (300, 160);
  curveVertex (mouseX+mouseY/2, mouseY-mouseX/2+10);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (300, 170);
  curveVertex (300, 170);
  curveVertex (mouseX+mouseY/2, mouseY-mouseX/2+20);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (300, 180);
  curveVertex (300, 180);
  curveVertex (mouseX+mouseY/2, mouseY-mouseX/2+30);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (300, 190);
  curveVertex (300, 190);
  curveVertex (mouseX+mouseY/2, mouseY-mouseX/2+40);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (300, 200);
  curveVertex (300, 200);
  curveVertex (mouseX+mouseY/2, mouseY-mouseX/2+50);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (300, 210);
  curveVertex (300, 210);
  curveVertex (mouseX+mouseY/2, mouseY-mouseX/2+60);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (300, 220);
  curveVertex (300, 220);
  curveVertex (mouseX+mouseY/2, mouseY-mouseX/2+70);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (300, 230);
  curveVertex (300, 230);
  curveVertex (mouseX+mouseY/2, mouseY-mouseX/2+80);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (300, 240);
  curveVertex (300, 240);
  curveVertex (mouseX+mouseY/2, mouseY-mouseX/2+90);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (300, 250);
  curveVertex (300, 250);
  curveVertex (mouseX+mouseY/2, mouseY-mouseX/2+100);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (300, 260);
  curveVertex (300, 260);
  curveVertex (mouseX+mouseY/2, mouseY-mouseX/2+110);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (300, 270);
  curveVertex (300, 270);
  curveVertex (mouseX+mouseY/2, mouseY-mouseX/2+120);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (300, 280);
  curveVertex (300, 280);
  curveVertex (mouseX+mouseY/2, mouseY-mouseX/2+130);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (300, 290);
  curveVertex (300, 290);
  curveVertex (mouseX+mouseY/2, mouseY-mouseX/2+140);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (300, 300);
  curveVertex (300, 300);
  curveVertex (mouseX+mouseY/2, mouseY-mouseX/2+150);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
// unten
  beginShape ();
  curveVertex (10, 300);
  curveVertex (10, 300);
  curveVertex (mouseX-mouseY/2-140, mouseY+mouseX/2);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (20, 300);
  curveVertex (20, 300);
  curveVertex (mouseX-mouseY/2-130, mouseY+mouseX/2);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (30, 300);
  curveVertex (30, 300);
  curveVertex (mouseX-mouseY/2-120, mouseY+mouseX/2);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (40, 300);
  curveVertex (40, 300);
  curveVertex (mouseX-mouseY/2-110, mouseY+mouseX/2);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (50, 300);
  curveVertex (50, 300);
  curveVertex (mouseX-mouseY/2-100, mouseY+mouseX/2);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (60, 300);
  curveVertex (60, 300);
  curveVertex (mouseX-mouseY/2-90, mouseY+mouseX/2);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (70, 300);
  curveVertex (70, 300);
  curveVertex (mouseX-mouseY/2-80, mouseY+mouseX/2);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (80, 300);
  curveVertex (80, 300);
  curveVertex (mouseX-mouseY/2-70, mouseY+mouseX/2);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (90, 300);
  curveVertex (90, 300);
  curveVertex (mouseX-mouseY/2-60, mouseY+mouseX/2);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (100, 300);
  curveVertex (100, 300);
  curveVertex (mouseX-mouseY/2-50, mouseY+mouseX/2);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (110, 300);
  curveVertex (110, 300);
  curveVertex (mouseX-mouseY/2-40, mouseY+mouseX/2);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (120, 300);
  curveVertex (120, 300);
  curveVertex (mouseX-mouseY/2-30, mouseY+mouseX/2);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (130, 300);
  curveVertex (130, 300);
  curveVertex (mouseX-mouseY/2-20, mouseY+mouseX/2);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (140, 300);
  curveVertex (140, 300);
  curveVertex (mouseX-mouseY/2-10, mouseY+mouseX/2);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (150, 300);
  curveVertex (150, 300);
  curveVertex (mouseX-mouseY/2+0, mouseY+mouseX/2);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (160, 300);
  curveVertex (160, 300);
  curveVertex (mouseX-mouseY/2+10, mouseY+mouseX/2);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (170, 300);
  curveVertex (170, 300);
  curveVertex (mouseX-mouseY/2+20, mouseY+mouseX/2);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (180, 300);
  curveVertex (180, 300);
  curveVertex (mouseX-mouseY/2+30, mouseY+mouseX/2);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (190, 300);
  curveVertex (190, 300);
  curveVertex (mouseX-mouseY/2+40, mouseY+mouseX/2);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (200, 300);
  curveVertex (200, 300);
  curveVertex (mouseX-mouseY/2+50, mouseY+mouseX/2);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (210, 300);
  curveVertex (210, 300);
  curveVertex (mouseX-mouseY/2+60, mouseY+mouseX/2);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (220, 300);
  curveVertex (220, 300);
  curveVertex (mouseX-mouseY/2+70, mouseY+mouseX/2);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (230, 300);
  curveVertex (230, 300);
  curveVertex (mouseX-mouseY/2+80, mouseY+mouseX/2);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (240, 300);
  curveVertex (240, 300);
  curveVertex (mouseX-mouseY/2+90, mouseY+mouseX/2);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (250, 300);
  curveVertex (250, 300);
  curveVertex (mouseX-mouseY/2+100, mouseY+mouseX/2);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (260, 300);
  curveVertex (260, 300);
  curveVertex (mouseX-mouseY/2+110, mouseY+mouseX/2);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (270, 300);
  curveVertex (270, 300);
  curveVertex (mouseX-mouseY/2+120, mouseY+mouseX/2);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (280, 300);
  curveVertex (280, 300);
  curveVertex (mouseX-mouseY/2+130, mouseY+mouseX/2);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (290, 300);
  curveVertex (290, 300);
  curveVertex (mouseX-mouseY/2+140, mouseY+mouseX/2);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
  beginShape ();
  curveVertex (300, 300);
  curveVertex (300, 300);
  curveVertex (mouseX-mouseY/2+150, mouseY+mouseX/2);
  curveVertex (mouseX, mouseY);
  curveVertex (mouseX, mouseY);
  endShape ();
   
  }
 
}


