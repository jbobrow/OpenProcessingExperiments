
Eye e1, e2, e3, e4, e5,e6,e7,e8;
   int bheight = 80;
   int bwidth = 20;

boolean on = false;
  
int btnX = 431;
int btnY = 357;
int btnW = 8;
int btnH = 15;

void setup() 
{
 size(500,500);
 smooth(10);

// EYES
  e1 = new Eye(140,280,10);
  e2 = new Eye(165,270,10);  
  e3 = new Eye(190,290,10);
  e4 = new Eye(145,300,10); 
  e5 = new Eye(170,308,10);
  e6 = new Eye(190,310,10);
  e7 = new Eye(135,310,10);
  e8 = new Eye(360,275,10);


// what happens when the mouse is pressed        
  { if(!mousePressed == true){
  fill(0,100);
  rect(0,0,500,500);
}}

  

}
void draw(){
   background(#A0987C);
   noStroke();
   
// art on walls
   //strings
   strokeWeight(2);
   stroke(#1F1E1D);
   line(450,20,500,0);
   line(460,220,500,215);
   line(60,30,0,20);
   line(80,180,0,165);
   strokeWeight(15);      //top right
   stroke(#433937);
   fill(#1F2923);
   rect(450,20,80,180);
   strokeWeight(10);      // bottom right
   stroke(#433937);
   fill(#151627);
   rect(460,220,80,90);
   strokeWeight(1);
   strokeWeight(15);      //top left
   stroke(#433937);
   fill(#0B2027);
   rect(-20,35,80,100);
   strokeWeight(10);      // bottom left
   stroke(#433937);
   fill(#151627);
   rect(-20,180,100,130);
   strokeWeight(1);
// CABINET
   fill(#765342);
   rect(110,100,280,360); //outside
   fill(#3B3433);
   rect(120, 120, 260, 300, 10); //inside
   // shelves
     fill(#433937);
     rect(120,215,260,5);
     rect(120,320,260,5);
 // top of cabinet
     //top background shape
     fill(#765342);
     beginShape();
       vertex(95,65);
       vertex(85,70);
       vertex(415,70);
       vertex(405,65);
     endShape();
     beginShape();
       vertex(85,75);
       vertex(80,80);
       vertex(420,80);
       vertex(415,75);
     endShape();
     // bottom background shape
     fill(#4D4541);
     beginShape();
       vertex(80,81);
       vertex(95,90);
       vertex(405,90);
       vertex(420,81);
     endShape();
     beginShape();
       vertex(95,95);
       vertex(110,100);
       vertex(390,100);
       vertex(405,95);
     endShape();
     //horizontal bars (rectangles)
     fill(#3B3433);
       rect(95,60,310,5); //a
       rect(85,70,330,5); //b
     stroke(#3B3433);
       line(80,80,420,80); // c
     noStroke();
       rect(95,90,310,5); //d
  // bottom of cabinet
    // background shapes behind rectangles
      fill(#765342);
      beginShape(); // 5
        vertex(100,470);
        vertex(90,480);
        vertex(410,480);
        vertex(400,470);
      endShape();
      beginShape(); // 6
        vertex(90,485);
        vertex(80,490);
        vertex(420,490);
        vertex(410,485);
      endShape();
    //bottom of cabinet shading
     fill(#3B3433);
      rect(100,460,300,10); //e
      rect(90,480,320,5);   //f
      rect(80,490,340,10);  //g
//STUFF ON SHELVES  
  //art on top shelf
   strokeWeight(5);
   stroke(#2E201B);
   fill(#645F5C);
   rect(250,140,75,73);
   strokeWeight(20);
   stroke(28,39,28,50);
   line(265,155,310,195);
   line(310,155,265,195);
   line(288,155,288,200);
   strokeWeight(1);
  // art on middle shelf
   strokeWeight(5);
   stroke(#2E201B);
   fill(#645F5C);
   rect(180,230,75,86);
   strokeWeight(20);
   stroke(47,28,72,25);
   line(240,245,195,300);
   line(195,245,240,300);
   strokeWeight(1);
   // jar with eyes
     // lid
     fill(#8E6B00);
     rect(130,245,65,5);
     //jar
      fill(108,239,255,100);
      beginShape();
       vertex(133,250);
       vertex(133,253);
       vertex(125,260);
       vertex(125,320);
       vertex(200,320);
       vertex(200,260);
       vertex(192,253);
       vertex(192,250);
     endShape();
      // water level
      fill(108,255,158,50);
          rect(125,260,75,60);
    // jar with baby thing
      //lid
       fill(#8E6B00);
       rect(335,240,40,5);
      // glass
       fill(108,239,255,100);
      beginShape();
       vertex(335,245);
       vertex(325,260);
       vertex(325,320);
       vertex(380,320);
       vertex(380,253);
       vertex(375,245);
     endShape();
      //babything
      noStroke();
      fill(#B4988E);
        ellipse(360,275,30,25);
        pushMatrix();            // separating rotation from rest of objects
        translate(360,295);
        rotate(radians(25));
        ellipse(0,0,25,45);
        popMatrix();             // ending separation from other objects
       pushMatrix();
       translate(365,295);        // separating rotation from rest of objects
       rotate(radians(25));
        fill(#A28C85);
        ellipse(0,0,8,20);
        popMatrix();          // ending separation
      // water level, over babything
       fill(108,255,158,50);
        rect(325,260,55,60);

  // mini jars, top
     //lid
       fill(#8E6B00);
       rect(215,265,20,5);
      // glass
       fill(108,239,255,100);
      beginShape();
       vertex(215,270);
       vertex(210,275);
       vertex(210,290);
       vertex(240,290);
       vertex(240,275);
       vertex(235,270);
     endShape();
  //mini jars, bottom
     //lid
       fill(#8E6B00);
       rect(215,290,20,5);
      // glass
       fill(108,239,255,100);
      beginShape();
       vertex(215,295);
       vertex(210,300);
       vertex(210,320);
       vertex(240,320);
       vertex(240,300);
       vertex(235,295);
     endShape();
   
  // mini drawer set
   fill(#43281E);
     rect(240,255,80,5);
   fill(#523328);
     rect(245,260,70,60);
   fill(#5F3B2E);
     rect(250,265,60,12);
     rect(250,285,60,12);
     rect(250,305,60,12);
   fill(#523328);
     ellipse(280,272,8,8);
     ellipse(280,292,8,8);
     ellipse(280,312,8,8);
     
  // mini jars top shelf
       //lid
       fill(#8E6B00);
       rect(340,155,30,5);
      // glass
       fill(108,239,255,50);
      beginShape();
       vertex(340,160);
       vertex(335,170);
       vertex(335,215);
       vertex(375,215);
       vertex(375,170);
       vertex(370,160);
     endShape();
     //lid
       fill(#8E6B00);
       rect(315,185,25,5);
      // glass
       fill(108,239,255,50);
      beginShape();
       vertex(315,190);
       vertex(305,200);
       vertex(305,215);
       vertex(350,215);
       vertex(350,200);
       vertex(340,190);
     endShape();
  
  //books, bottom shelf
    //right book with curve
    fill(#4D311E);
    rect(361,340,bwidth-1,bheight,0,0,20,0);
      fill(#503624);
      rect(361,340+15,bwidth-1,bheight/7);
    //left book with curve
    fill(#4D311E);
    rect(120,340,bwidth,bheight,0,0,0,20);
      fill(#503624);
      rect(120,340+15,bwidth/2-1,bheight/7);
       stroke(#3E2718);
      line(130,340,130,419);
    noFill();
    noStroke();
    // other books, bottom shelf
    book(131,340,bwidth/2,bheight);
    book(340,340, bwidth,bheight);
    book(320,340,bwidth,bheight);
    book(300,340,bwidth,bheight);
    book(285,350,bwidth-5,bheight-10);
    book(275,340,bwidth-11,bheight);
    book(265,340,bwidth-11,bheight);
    book(255,350,bwidth-11,bheight-10);
      pushMatrix();                        //rotated book, right
      translate(240,350);
      rotate(radians(25));
      book(0,0,bwidth-5,bheight-10);
      popMatrix();
      pushMatrix();                        //rotated book, left
      translate(228,353);
      rotate(radians(25));
      book(0,0,bwidth-10,bheight-10);
      popMatrix();
  //books, top shelf
    book(120,140,bwidth,bheight-5);
    book(141,135,bwidth,bheight);
    book(162,130,bwidth-10,bheight+5);
    book(173,130,bwidth-10,bheight+5);
    book(184,130,bwidth-10,bheight+5);
    book(195,140,bwidth,bheight-5);
    book(216,150,bwidth,bheight-15);
  //books, top of cabinet
    //right
      book(300,0,bwidth, bheight-20);
      book(321,0,bwidth,bheight-20);
      book(342,0,bwidth,bheight-20);
      book(363,0,bwidth,bheight-20);
    //left
      book(110,0,bwidth,bheight-20);
      book(131,0,bwidth,bheight-20);
      book(152,0,bwidth,bheight-20);
      book(173,0,bwidth,bheight-20);
      pushMatrix();
      translate(190,8);
      rotate(-radians(25));
      book(0,0,bwidth-10,bheight-20);
      popMatrix();
    //center
       fill(#4D311E);
       rect(220,45,70,5);
       fill(#765E4E);
       rect(222,50,67,10);
       fill(#4D311E);
       rect(225,30,60,5);
       fill(#765E4E);
       rect(227,35,57,10);
 
 
 
//eyes
  e1.update(mouseX, mouseY);
  e2.update(mouseX, mouseY);
  e3.update(mouseX, mouseY);
  e4.update(mouseX, mouseY);
  e5.update(mouseX, mouseY);
  e6.update(mouseX, mouseY);
  e7.update(mouseX, mouseY);
  e8.update(mouseX, mouseY);
  e1.display();
  e2.display();
  e3.display();
  e4.display();
  e5.display();
  e6.display();
  e7.display();
  e8.display();
  
  
  // light switch
  fill(#B7AD87);
 rect(420,345,30,40);

  fill(#CBC19C);
  stroke(0,150);
  strokeWeight(1);
  rect(btnX, btnY, btnW, btnH);
  noStroke();


// TURN OFF LIGHT
  if (on == true) {
  fill(0,150);
  rect(0,0,500,500);
  }
  else {
  }
 


 
}
class Eye 
{
  int ex, ey;
  int size;
  float angle = 0.0;
  Eye(int x, int y, int s) {
    ex = x;
    ey = y;
    size = s;
 }
  void update(int mx, int my) {
    angle = atan2(my-ey, mx-ex);
  }
  void display() {
    pushMatrix();
    translate(ex, ey);
    fill(#D0D9DB);
    ellipse(0, 0, size, size);
    rotate(angle);
    fill(0);
    ellipse(size/4, 0, size/2, size/2);
    popMatrix();
  }


  
}

void book(int xloc, int yloc, int bwidth, int bheight){
fill(#4D311E);
  rect(xloc,yloc,bwidth,bheight);
    fill(#503624);
      rect(xloc,yloc+15,bwidth,bheight/7);
  stroke(#3E2718);
  line(xloc+bwidth,yloc,xloc+bwidth,yloc+bheight-1);
  noStroke();
}

//button limits
void mousePressed() {
  if ( mouseX > btnX && mouseX < (btnX+btnW) && mouseY > btnY && mouseY < (btnY+btnH)) {
    // toggle the value of 'on'
    // in other words, if on == true, then on becomes not true (false) and
    // vice versa
    on = !on;   // on = (not)on
  }
}


