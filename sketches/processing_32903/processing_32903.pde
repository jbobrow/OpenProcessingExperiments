
PImage chicken;
Boolean showPicture = false;
void setup() {
  chicken = loadImage("chicken.jpg");
  size(643, 840);
  noStroke();
  smooth();
}

void draw() {
  if (showPicture) {
    image(chicken, 0, 0);
  } else {
  
    //----------------------------------------------//---------------------------------------------- Youmna 1
  
    fill(127,160,201);
    rect(0,0,289,179);
     
    //Red Shape
    beginShape();
    fill(175,31,31);
    vertex(289,44);
    vertex(279,56);
    vertex(244,59);
    bezierVertex(250,50,226,26,258,13);
    vertex(237,10);
    vertex(193,55);
    bezierVertex(183,72,194,89,190,82);
    vertex(213,81);
    vertex(234,125);
    vertex(234,134);
    vertex(206,179);
    vertex(289,179);
    vertex(289,44);
    endShape();
     
    beginShape();
    fill(231,230,238);
    vertex(269,179);
    vertex(246,153);
    vertex(193,134);
    vertex(172,92);
    vertex(109,61);
    vertex(50,59);
    vertex(99,73);
    vertex(147,113);
    vertex(162,136);
    vertex(149,179);
    vertex(269,179);
    endShape();
     
    //Tiny Red Shape
    beginShape();
    fill(175,31,31);
    vertex(158,179);
    vertex(136,146);
    vertex(105,126);
    vertex(78,126);
    vertex(111,147);
    vertex(129,179);
    vertex(158,179);
    endShape();
     
    //White Shape
    beginShape();
    fill(231,230,238);
    vertex(269,179);
    vertex(246,153);
    vertex(193,134);
    vertex(172,92);
    vertex(109,61);
    vertex(50,59);
    vertex(99,73);
    vertex(147,113);
    vertex(162,136);
    vertex(149,179);
    vertex(269,179);
    endShape();
     
    //black tiny shape
    beginShape();
    fill(16,16,16);
    vertex(54,179);
    vertex(43,163);
    vertex(38,149);
    vertex(39,172);
    vertex(40,179);
    vertex(54,179);
    endShape();
    
    //----------------------------------------------//---------------------------------------------- Aneta 2
    
    pushMatrix();
    translate(288, 0);
    
    fill(81,132,195);
    rect(0,0,354,160);
     
    //begin shape
    beginShape();
     
    fill(183,0,14);
    curveVertex(0,45);
    curveVertex(0,45);
    curveVertex(37,9);
    curveVertex(29,27);
    curveVertex(28,66);
    curveVertex(56,66);
    curveVertex(78,33);
    curveVertex(79,22);
    curveVertex(76,15);
    curveVertex(96,45);
    curveVertex(98,61);
    curveVertex(84,85);
    curveVertex(67,99);
    curveVertex(90,122);
    curveVertex(118,117);
    curveVertex(140,100);
    curveVertex(149,82);
    curveVertex(149,66);
    curveVertex(162,88);
    curveVertex(163,107);
    curveVertex(153,120);
    curveVertex(57,159);
    curveVertex(0,159);
    curveVertex(0,159);
     
    endShape();
     
    ellipse(240,89,130,89);
    
    popMatrix();
    
    //----------------------------------------------//---------------------------------------------- Daniel 3
    
    pushMatrix();
    translate(288, 160);
    /*
    Daniel Albuquerque
    BOOTCAMP
    Best Team Ever, AKA PURPLE
    8/3/2011 Painting Replication
    */
    
    fill( 110, 151, 195); 
    rect(0,0, 354, 205);
    
    smooth();
    noStroke();
     
    fill( 52, 96, 43);
    beginShape(); //green
    vertex( 91, 204);
    vertex( 113, 49);
    bezierVertex( 120, 40, 155, 17, 192, 0);
    vertex( 204, 0);
    bezierVertex( 177, 29, 177, 39, 185, 63);
    vertex(182, 204);
    endShape();
     
    fill(0);
    beginShape(); //black top left
    vertex( 0, 60);
    bezierVertex( 16, 60, 36, 42, 34, 25);
    bezierVertex( 26, 17, 9, 11, 0, 21);
    endShape();
     
    beginShape(); // black bottom left
    vertex( 0, 192);
    bezierVertex( 0, 192, 14, 204, 30, 203);
    bezierVertex( 19, 202, 0, 182, 0, 182);
    endShape();
     
    beginShape(); // midLeft black
    vertex( 76, 204);
    bezierVertex( 50, 154, 58, 104, 113, 49);
    bezierVertex( 153, 44, 104, 204, 104, 204);
    endShape();
     
    beginShape(); //midRight black
    vertex(149, 205);
    vertex(148, 137);
    bezierVertex( 140, 60, 248, 18, 308, 41);
    bezierVertex( 280, 34, 193, 98, 201, 135);
    vertex( 199, 204);
    endShape();
     
    beginShape(); //black point on red, right
    vertex( 314, 126);
    bezierVertex( 314, 126, 339, 126, 344, 128);
    bezierVertex( 340, 127, 326, 134, 322, 138);
    bezierVertex( 322, 132, 313, 133, 314, 126);
    endShape();
     
    triangle( 322, 204, 323, 196, 325, 204); //tiny thing on bottom right
     
    fill( 182, 21, 20);
    beginShape(); // red top left
    vertex(0, 21);
    bezierVertex( 9, 11, 26, 17, 34, 25);
    bezierVertex( 33, 10, 44, 1, 54, 0);
    vertex( 0, 0);
    endShape();
     
    beginShape(); // red right
    vertex( 216, 204);
    bezierVertex( 235, 161, 275, 130, 314, 126);
    bezierVertex( 313, 133, 322, 132, 322, 138);
    bezierVertex( 303, 144, 287, 167, 282, 204);
    endShape();
     
    ellipse( 166, 41, 9, 7); // dot in green
     
    stroke(0); // outlined triangle, bottom right
    strokeWeight(2);
    triangle( 57, 204, 61, 192, 63, 204);
    
    popMatrix();
    
    //----------------------------------------------//---------------------------------------------- Eulani 4
    pushMatrix();
    translate( 0, 178);
    fill (25, 100, 215);
    
    rect (0,0,183, 186);
     
    noStroke ();
     
    fill (183, 0, 13); // protruding red ellipse
    ellipse (130, 125, 110, 90);
    fill (1); // black mark
    ellipse (88, 123, 25, 40);
     
    beginShape (); //black blob
    fill (1);
    vertex (130, 0); // top point
    bezierVertex (150, 40, 70, 90, 170, 186); // vertex 170, 186 - bottom point
    bezierVertex (175, 186, 183, 186, 183, 160); // right point
    vertex (183, 0); //UR corner
    endShape (CLOSE);
    fill (1); // bottom bulge
    ellipse (150, 150, 100, 90);
     
     
    beginShape (); // top banana
    fill (236, 113, 9);
    vertex (50, 0); // left point
    bezierVertex (70, 90, 130, 80, 183, 30); // vertex 183, 30 - right point
    vertex (150, 0);
    bezierVertex (130, 40, 70, 20, 60, 0);
    endShape (CLOSE);
    fill (1); // black mark
    ellipse (55, 5, 10, 20);
    fill (183, 0, 13); // red bit
    ellipse (80, 50, 20, 12);
    beginShape (); // white cap
    fill (255, 255, 255);
    vertex (150, 0);
    vertex (130, 18);
    vertex (160, 50);
    vertex (183, 30);
    vertex (183, 0);
    endShape (CLOSE);
     
    fill (234, 206, 0); // mid mango
    beginShape ();
    vertex (165, 45); // top point
    bezierVertex (120, 60, 160, 90, 123, 113); // vertex 123, 133 - left point
    vertex (123, 113);
    bezierVertex (120, 140, 160, 160, 183, 150); // lower right point
    vertex (183, 45);
    endShape (CLOSE);
    fill (236, 113, 9); // orange patch
    beginShape ();
    vertex (160, 75); // top point
    bezierVertex (120, 60, 160, 90, 123, 113); // vertex 123, 133 - left point
    bezierVertex (120, 120, 120, 125, 130, 136); // vertex 130, 136 - lower right point
    vertex (130, 136);
    bezierVertex (165, 120, 165, 70, 160, 80); // vertex 160, 90 - right point
    endShape (CLOSE);
    fill (183, 0, 13); // red patch
    beginShape ();
    vertex (170, 110); // upper left point
    bezierVertex (170, 140, 120, 140, 150, 150); // vertex 150, 150 - left point
    bezierVertex (160, 152, 170, 156, 183, 150); //vertex 183, 150 - right point
    vertex (183, 110);
    vertex (175, 100);
    vertex (183, 110);
    endShape (CLOSE);
     
    stroke (1); // orange protrusion
    strokeWeight (5);
    fill (236, 113, 9);
    ellipse (183, 30, 40, 50);
    noStroke ();
    fill (255);
    rect (150, 0, 40, 15);
     
    // Finishing touches would include white patches with black dots
    
    
    //----------------------------------------------//---------------------------------------------- Sepand 5
    
    pushMatrix();
    translate(182, 0);
    
     
      fill(#5386BD);
      rect(0, 0, 106,186);
    
     fill(#000000);
     rect(88,0,88,45);
     
     fill(#000000);
     
     beginShape();
     
     curveVertex(67,122);
     curveVertex(67,122);
     curveVertex(85,130);
      curveVertex(97,141);
     
      curveVertex(102,169);
      curveVertex(102,188);
      curveVertex(102,188);
      vertex(53,188);
      vertex(48,137);
     //vertex(0,0);
      endShape();
     
       fill(#F4D94A);
      
     beginShape();
      curveVertex(87,0); // the first control point
      curveVertex(87,0); // is also the start point of curve
      curveVertex(96,17);
      curveVertex(100, 42);
      curveVertex(80,107);
      curveVertex(35,144);
     
      curveVertex(0,158);
      curveVertex(0,158);
      vertex(0,0);
      endShape();
      
    fill(#DF8B33,100);
    rect(14,58,52,25);
     
     fill(#000000);
      beginShape();
      curveVertex(0,45); // the first control point
      curveVertex(0,45); // is also the start point of curve
      curveVertex(34,56);
      curveVertex(67,48);
      curveVertex(32,61);
      curveVertex(0,52);
      curveVertex(0,52);
      vertex(0,45);
     
    //  curveVertex(0,158);
    //  curveVertex(0,158);
     // vertex(0,0);
      endShape();
     
     fill(#AD1F1D);
     ellipse(26,18,55,50);
      
     fill(#090915);
     ellipse(26,18,30,30);
      
      fill(#315E35);
     ellipse(26,18,17,15);
    
    
    popMatrix();
    
    popMatrix();//for the row
    
    //----------------------------------------------//---------------------------------------------- Jennifer 8
    pushMatrix();
    translate(0, 468);
    
    fill(255);
    rect(0,0,196, 173);
      
    // Red
    beginShape();
     
      fill(183, 0, 14);
      noStroke();
       
      vertex(0, 0);
      vertex(80, 0);
      bezierVertex (80, 0, 75, 20, 85, 30);
      vertex(85, 30);
      vertex(80, 60);
      bezierVertex (80, 60, 65, 80, 50, 65);
      vertex(50, 65);
      bezierVertex (50, 65, 40, 60, 25, 80);
      vertex(25, 80);
      bezierVertex (25, 80, 20, 90, 0, 85);
      vertex(0, 90);
       
    endShape(CLOSE);
     
    // Black- top
    beginShape();
     
      fill(0);
      noStroke();
       
      vertex(142, 0);
      vertex(195, 0);
      vertex(175, 40);
      vertex(175, 35);
      vertex(150, 30);
       
    endShape(CLOSE);
     
    // Orange- top
    beginShape();
     
      fill(235, 140, 46);
      noStroke();
       
      vertex(80, 0);
      vertex(142, 0);
      bezierVertex(142, 0, 160, 0, 155, 10);
      vertex(155, 10);
      vertex(150, 15);
      vertex(160, 35);
      bezierVertex(160, 35, 144, 48, 120, 40);
      vertex(120, 40);
      bezierVertex(120, 40, 110, 48, 90, 43);
      vertex(90, 43);
      vertex(80, 20);
      bezierVertex(80, 20, 70, 10, 80, 0);
       
    endShape(CLOSE);
     
    // Green- top
    beginShape();
     
      fill(30, 99, 42);
      noStroke();
       
      ellipse (120, 5, 25, 20);
       
    endShape(CLOSE);
     
    // Blue- top
    beginShape();
     
      fill(81, 132, 195);
      noStroke();
       
      vertex(150, 0);
      vertex(195, 0);
      vertex(190, 8);
      vertex(160, 6);
        bezierVertex(160, 6, 160, 5, 150, 0);
       
    endShape(CLOSE);
     
       
       
    // Black- bottom
      fill(0);
      noStroke();
      ellipse (90, 130, 100, 100);
     
    // Blue circle- L
     
      fill(81, 132, 195);
      noStroke();
      ellipse (95, 50, 8, 4);
       
    // Yellow
    beginShape();
     
      fill(241, 208, 63);
      noStroke();
       
      vertex(0, 85);
      bezierVertex(0, 85, 10, 75, 25, 80);
      vertex (25, 80);
      bezierVertex(25, 80, 35, 65, 55, 60);
      vertex(55, 60);
      bezierVertex(55, 60, 100, 60, 130, 80);
      vertex(130, 80);
      bezierVertex(130, 80, 85, 100, 75, 120);
      vertex(75, 120);
      bezierVertex(75, 120, 80, 153, 100, 173);
      vertex(100, 173);
      vertex(0, 173);
       
    endShape(CLOSE);
     
    // Orange- bottom
    beginShape();
     
      fill(235, 140, 46);
      noStroke();
       
      vertex(180, 30);
        bezierVertex(180, 30, 190, 33, 190, 45);
      vertex(190, 45);
      bezierVertex(190, 45, 160, 70, 160, 90);
      vertex(160, 90);
      bezierVertex(160, 90, 170, 100, 170, 110);
      vertex(170, 110);
      vertex(175, 120);
      vertex(185, 115);
      vertex(190, 130);
      vertex(196, 123);
      vertex(196, 173);
      vertex(100, 173);
      vertex(95, 165);
      vertex(100, 155);
      vertex(100, 140);
      vertex(105, 125);
      vertex(105, 105);
      bezierVertex(105, 105, 105, 90, 145, 70);
      vertex(145, 70);
      bezierVertex(145, 70, 165, 60, 180, 30);
       
    endShape(CLOSE);
     
    // Red circle
     
      fill(183, 0, 14);
      noStroke();
      ellipse (172, 43, 4, 4);
       
    // Blue circle- R
      noStroke();
      ellipse (174, 40, 2, 2);
       
    // Green- bottom
     
    beginShape();
     
      fill(30, 99, 42);
      noStroke();
     
        vertex(115, 55);
        bezierVertex(115, 55, 130, 50, 125, 50);
        vertex(125, 50);
        vertex(135, 45);
        bezierVertex(135, 45, 140, 45, 140, 50);
        vertex(140, 50);
        vertex(155, 50);
        vertex(155, 55);
        vertex(160, 55);
        bezierVertex(160, 55, 150, 70, 130, 80);
        vertex(130, 80);
        vertex(120, 75);
        vertex(110, 70);
        bezierVertex(110, 70, 120, 65, 120, 60);
        vertex(120, 60);
     
    endShape(CLOSE);
    
    
    //----------------------------------------------//---------------------------------------------- Cem 10
    pushMatrix();
    translate(400, 0);
    
    fill(255);
    rect(0,0,242,173);
     
    fill(0);
    triangle(0,160,300,0,0,0);           //addition to black
    fill(30, 99, 42);
    triangle(0,58,0,173,165,173);        //green riht next to red rect
    fill(241, 208, 63);
    triangle(0,173,158,173,92,121);      //right tri of bottom yellow
    triangle(104,173,188,98,279,173);   //second tri of bottom yellow
    rect(187,130,90,59);                 //just to fill a remaining yellow space
    fill(235, 140, 46);
    ellipse(131,139,42,44);             //orange ball
    fill(183,0,14);
    ellipse(190,173,54,35);             //bottom red half ellipse
     
     
     
     
    fill(0);
    triangle(0,0,0,151,304,0); //black on the middle
    fill(183,0,14);
    rect(0,0,67,173);        //red rect on the bottom right
    fill(30, 99, 42);
    ellipse(226,113,48,48);   //green ball on the left
    fill(81,132,195);
    ellipse(242,0,460,211);  //top right blue
    fill(0);
    ellipse(0,0,400,130);    //middle top black
    fill(255);
    ellipse(0,0,185,268);    //top left white
     
    fill(235,140,46);
    triangle(0,0,0,43,56,0);   //orange on top left
    rect(38,0,50,16);          //orange addition
    fill(81,132,195);
    triangle(0,0,0,21,11,0);   //small blue top left
     
    fill(30,99,42);
    triangle(85,60,44,60,44,120);  //green at left
    rect(44,26,15,40);
     
    fill(235, 140, 46);
    ellipse(53,35,18,18);      //orange ellipse
    triangle(0,121,0,134,10,135);
    fill(30,99,42);
    ellipse(53,35,4,4);        //green point
    rect(75,0,19,16);
     
    fill(183,0,14);            //red rect in white
    beginShape();
    vertex(94,13);
    vertex(87,60);
    vertex(67,64);
    vertex(79,16);
    endShape(CLOSE);
     
    fill(241, 208, 63);
    triangle(29,9,54,21,29,43);    //yellow tri top left
     
    fill(255);
    triangle(52,21,79,16,67,64);
    
    
    popMatrix();
    
    
    //----------------------------------------------//---------------------------------------------- Amira 9
    pushMatrix();
    translate(196, 0);
    
    fill(239,234,237);
    rect(0, 0, 205,173);
    stroke(0);
    ellipse(162,0,125,71);
    noStroke();
    
    fill(0,0,0);
    beginShape();
    curveVertex(156,123);
    curveVertex(150,123);
    curveVertex(140,111);
    curveVertex(124,74);
    curveVertex(82,48);
    curveVertex(59,76);
    curveVertex(75,119);
    curveVertex(105,131);
    curveVertex(129,133);
    curveVertex(144,130);
    curveVertex(131,133);
    endShape(CLOSE);
    
    fill(255,0,0);
    beginShape();
    vertex(153,123);
    bezierVertex(127,130,153,123,153,123);
    bezierVertex(107,92,91,48,91,48);
    bezierVertex(78,47,73,52,73,52);
    bezierVertex(127,130,153,123,153,123);
    endShape();
    
    fill(0,255,0);
    beginShape();
    vertex(150,126);
    bezierVertex(150,126, 80,117, 60,72);
    vertex(57,98);
    bezierVertex(82,146, 83,147, 150,126 );
    
    endShape(CLOSE);
    
    fill(0,0,0);
    beginShape();
    vertex(204,134);
    vertex(175,149);
    vertex(198,172);
    vertex(204,172);
    vertex(204,134);
    endShape();
    
    fill(240,209,21);
    beginShape();
    vertex(197,172);
    vertex(175,149);
    vertex(160,172);
    vertex(197,172);
    endShape();
    
    fill(0,0,0);
    //fill();
    //top
    beginShape();
    curveVertex(197,31);
    curveVertex(166,32);
    curveVertex(186,0);
    curveVertex(197,31);
    endShape();
    
    
    
    //left
    fill(255,0,0);
    beginShape();
    curveVertex(112,172);
    curveVertex(112,172);
    curveVertex(102,143);
    curveVertex(74,139);
    curveVertex(58,130);
    curveVertex(46,123);
    curveVertex(17,172);
    curveVertex(112,172);
    curveVertex(112,172);
    endShape();
    
    
    //black
    fill(0,0,0);
    beginShape();
    vertex( 18,172);
    bezierVertex(79,172,79,172,79,172);
    bezierVertex(73,131,40,125,39,130);
    bezierVertex(11,142,18,172,18,172);
    endShape();  
    
    popMatrix();
    
    popMatrix(); //end row 3
    
    
    //----------------------------------------------//---------------------------------------------- Li-Chung 6
    pushMatrix();
    translate(0, 364);
    scale(0.875, 1.04);
    fill(73,123,182);
    rect(0,0,400,100);
     
    noStroke();
    fill(167,33,30);
    triangle(0,50,0,100,140,100);
     
    fill(227,124,57);
    ellipse(95,95,40,10); //orange left
     
    fill(255,255,255);
     
    beginShape();
      vertex(320, 0); //starting vertex
        
      bezierVertex(350, 50, 250, 90, 280, 100);
     
      vertex(280, 100);
      vertex(360, 100);
      bezierVertex(360, 90, 340, 0, 350, 0);
      vertex(350, 0);
     
    endShape();
     
     
    fill(239,220,89);
    ellipse(340,20,20,40); // yellow above
     
    fill(0,0,0);
    ellipse(200,0,40,10); // yellow above
     
    fill(0,0,0);
    beginShape(); // black triangle right
      vertex(360, 100); //starting vertex 
      bezierVertex(360, 80, 360, 50, 400, 0);
      vertex(400, 0);
      vertex(400, 400);
       
    endShape();
     
     
    fill(176,32,32);
    beginShape();
      vertex(380, 100); //starting vertex
      bezierVertex(370, 80, 360, 90, 400, 0);
      vertex(400, 0);
      vertex(400, 400);
       
    endShape();
    
    
    //----------------------------------------------//---------------------------------------------- Daniela 7
    pushMatrix();
    translate(349, 0);
    scale(1, 1.009615384615385);
    fill (#6699FF);
    rect (0,0,400,105);
     
    //first black shape (from left to right)
    fill(0);
    noStroke();
    beginShape();
    vertex(0, 0);
    bezierVertex(70,60,60,130,0,120);
    endShape();
     
    //first green shape (from left to right)
    fill(#339900);
    noStroke();
    beginShape();
    vertex(0, 0);
    bezierVertex(3,1,20,20,0,120);
    endShape();
     
    //second green shape (from left to right)
    fill(#339900);
    noStroke();
    beginShape();
    vertex(10, 0);
    bezierVertex(130,60,20,180,200,110);
    endShape();
     
    //third green shape (from left to right)
    fill(#339900);
    noStroke();
    beginShape();
    vertex(120, 0);
    bezierVertex(260,230,290,370,18,0);
    endShape();
     
    //second black shape (from left to right)
    fill(0);
    noStroke();
    beginShape();
    vertex(40, 0);
    bezierVertex(80,10,70,90,10,0);
    endShape();
     
    //third black shape (from left to right)
    fill(0);
    noStroke();
    beginShape();
    vertex(100, 0);
    bezierVertex(140,130,500,480,140,0);
    endShape();
     
    //fifth black shape (from left to right)
    fill(0);
    noStroke();
    beginShape();
    vertex(370, 0);
    bezierVertex(240,160,80,115,330,120);
    endShape();
     
    // red shape (from left to right)
    fill(#CC0000);
    noStroke();
    beginShape();
    vertex(320, 0);
    bezierVertex(140,300,100,90,230,0);
    endShape();
     
     
    //yellow shape (from left to right)
    fill(#FFCC33);
    noStroke();
    beginShape();
    vertex(230, 200);
    bezierVertex(140, 20, 100, 75, 80, 105);
    endShape();
     
    //fourth black shape (from left to right)
    fill(0);
    noStroke();
    beginShape();
    vertex(220, 200);
    bezierVertex(140,120,180,35,200,80);
    endShape(CLOSE);
     
    //fourth green shape (from left to right)
    fill(#339900);
    noStroke();
    beginShape();
    vertex(240, 190);
    bezierVertex(140, 10, 100, 95, 120, 100);
    endShape();
    
    
    popMatrix();
    
    popMatrix();
    
    
    
    //----------------------------------------------//---------------------------------------------- Brian 11
    pushMatrix();
    translate(0, 641);
    
      fill(241, 208, 63);
      rect(0, 0, 255,198);
       
      beginShape();//black portions at top right corner
      fill(0,0,0);
      vertex(210,0);
      vertex(210,25);
      vertex(255,20);
      vertex(255,0);
      endShape();
       
       
      //red part not tail
      beginShape();
      fill(183, 0, 14);
      vertex(150,29);
      vertex(110,20);
      vertex(115,0);
      vertex(145,5);
      endShape();
       
       
      //orange rooster
      noStroke();
      beginShape();
      fill(235,140,46);
      vertex(210,0);
      vertex(210,25);
      vertex(150,29);
      vertex(103,19);
      vertex(100,0);
      endShape();
       
      noStroke();
      beginShape();
      fill(235, 140, 46);
      vertex(210,25);
      vertex(255,140);
      vertex(255,20);
      endShape();
       
      beginShape();
      fill(235, 140, 46);
      vertex(255,80);
      vertex(195,123);
      vertex(195,140);
      vertex(220,140);
      vertex(255,198);
      endShape();
       
      //red part not foot
      beginShape();
      fill(183, 0, 14);
      vertex(160,29);
      vertex(120,25);
      vertex(105,20);
      vertex(120,0);
      vertex(160,20);
       
      endShape();
       
       
      noStroke();//green part of rooster
      beginShape();
      fill(30, 99, 42);
      vertex(220,140);
      vertex(210,159);
      vertex(210,198);
      vertex(255,198);
      vertex(255,158);
      endShape();
       
       
      beginShape();//red upper clubfoot
      fill(183, 0, 14);
      vertex(95,140);
      vertex(100,140);
      vertex(200,145);
      vertex(195,123);
      endShape();
       
      beginShape();//black toe
      fill(0);
      vertex(97,140);
      vertex(98,141);
      vertex(58,158);
      endShape();
       
       
      beginShape();//black clubfoot
      fill(0);
      vertex(200,140);
      vertex(220,140);
      vertex(203,163);
      vertex(190,150);
      endShape();
       
      beginShape();//red lower claw
      fill(183, 0, 14);
      vertex(190,150);
      vertex(203,163);
      vertex(80,170);
      endShape();
    
    
    
    //----------------------------------------------//---------------------------------------------- I Chien 11
    
    pushMatrix();
    translate(254, 0);
    scale(0.54, 0.495);
    fill(255,210,0);
    rect(0, 0, 400,400);
     
    noStroke();
    fill(0,100,0);//green area
    beginShape();
    vertex(0,290);
    vertex(70,325);
    bezierVertex(40,390,65,350,55,360);
    vertex(55,360);
    vertex(60,400);
    vertex(0,400);
    endShape(CLOSE);
     
    fill(0);
    beginShape();//mouth above front black
    vertex(257,238);
    bezierVertex(140,255,150,250,110,250);
    vertex(110,250);
    bezierVertex(130,280,200,265,260,258);
    endShape(CLOSE);
     
    beginShape();//below mouth black
    vertex(325,275);
    vertex(375,235);
    vertex(400,200);
    vertex(400,230);
    vertex(380,260);
    vertex(340,290);
    endShape();
     
     
     
    fill(255,100,0);
    beginShape();//left orange
    vertex(200,0);
    bezierVertex(175,50,150,20,80,35);
    vertex(80,35);
    bezierVertex(75,90,50,75,25,125);
    vertex(25,125);
    bezierVertex(100,120,80,100,80,78);
    bezierVertex(175,125,100,150,40,170);
    vertex(40,170);
    bezierVertex(0,330,75,300,145,300);
    vertex(145,300);
    bezierVertex(100,360,25,310,0,300);
    vertex(0,300);
    vertex(0,0);
    endShape(CLOSE);
     
     
    fill(210,0,0);
    beginShape();//right up red
    vertex(275,0);
    bezierVertex(310,50,320,50,350,120);
    vertex(350,120);
    vertex(400,190);
    vertex(400,0);
    endShape(CLOSE);
     
    fill(255,100,0);
    beginShape();//right above mouth back
    vertex(400,190);
    bezierVertex(310,232,300,220,250,238);
    vertex(250,238);
    vertex(250,250);
    vertex(255,252);
    vertex(255,260);
    vertex(350,242);
    vertex(355,243);
    vertex(355,243);
    bezierVertex(342,230,375,233,390,225);
    vertex(390,225);
    vertex(400,230);
    endShape(CLOSE);
     
    fill(180,0,0);//below mouth red
    beginShape();
    vertex(300,295);
    bezierVertex(200,327,200,310,175,300);
    vertex(174,300);
    bezierVertex(180,350,280,325,310,320);
    vertex(305,310);
     
    endShape(CLOSE);
    fill(255,100,0);
    beginShape();//mouth below
    vertex(400,235);
    vertex(390,247);
    vertex(375,265);
    vertex(375,265);
    vertex(325,275);
    vertex(290,300);
    vertex(300,300);
    vertex(300,310);
    vertex(300,320);
    bezierVertex(390,295,390,255,400,260);
    vertex(400,260);
    endShape(CLOSE);
     
    fill(255);//below mouth white
    beginShape();
    vertex(350,240);
    vertex(395,215);
    vertex(400,230);
    vertex(390,245);
    vertex(380,235);
    vertex(375,235);
    vertex(360,246);
    endShape(CLOSE);
     
    fill(0);//right little black
    beginShape();
    vertex(400,190);
    vertex(355,125);
    vertex(400,125);
    endShape(CLOSE);
     
    fill(255,150,0);//right big orange
    beginShape();
    vertex(350,100);
    vertex(375,105);
    vertex(400,85);
    vertex(400,160);
    vertex(380,140);
    vertex(355,125);
    vertex(350,120);
    endShape(CLOSE);
     
    fill(0);
    beginShape();//left black
    vertex(200,0);
    bezierVertex(175,50,150,20,80,35);
    vertex(80,35);
    vertex(0,43);
    vertex(0,0);
    endShape(CLOSE);
     
    fill(100,0,0);
    beginShape();//left black2
    vertex(25,125);
    vertex(73,120);
    vertex(60,165);
    vertex(45,173);
    vertex(30,205);
    vertex(25,200);
    vertex(10,195);
    vertex(10,175);
    endShape(CLOSE);
     
    fill(130,0,0);
    beginShape();
    vertex(50,295);
    bezierVertex(90,320,100,304,148,300);
    vertex(148,300);
    bezierVertex(110,355,50,320,25,310);
    vertex(25,310);
     
    endShape(CLOSE);
    
    popMatrix();
    
    //----------------------------------------------//---------------------------------------------- I Kasia 13
    
    pushMatrix();
    translate(466, 0);
    scale(0.586666666666, 0.66);
    
    fill(#FFCC33);
    rect(0, 0, 300,300);
     
    fill(#000000);
    beginShape();
    vertex(0,0);
    bezierVertex(0,100,150,250,250,200);
    bezierVertex(300,200,50,300,0,200);
    endShape();
     
    fill(#FF6600);
    beginShape();
    vertex(0,50);
    bezierVertex(0,50,60,70,70,0);
    bezierVertex(100,50,50,100,0,250);
    endShape();
     
    fill(#CC0000);
    beginShape();
    vertex(100,0);
    bezierVertex(120,90,250,90,260,0);
    endShape();
    
    
    popMatrix();
    
    
    popMatrix();
  }
}
void keyPressed() {
  if (key == 'c') {
    showPicture = !showPicture;
  }
}


