
/*

 Liz Rutledge
 Green Tile Picnic Blanket!
 August 4, 2011
 
 */

int shiftX = 150;
int shiftY = 120;
PImage baseLayer;
PFont font;
boolean showLines;
String[] names = { 
  "Elizabeth C", "Catalina", "Norman", "Amy", "Jane", "Jae", "Nina", "Jason", "Santiago", "Nate", "Conor", "Adam", "Elizabeth U", "Original"
};


void setup() {
  size(600, 474);
  baseLayer = loadImage("painting.jpg");
  font = createFont("Arial", 20);
  textFont(font);
  println(names);
  textAlign(RIGHT);
  
}


void draw() {

  image(baseLayer, 0, 0);
  noStroke();


  //ELIZABETH CLARE


  fill(110, 194, 2);//background,largest color
  rect(0, 0, 150, 120);
  fill(41, 46, 50);
  noStroke();
  colorMode(RGB);
  //im starting at top left and moving right for the rectangles
  rect(74, 0, 37, 38);

  fill(116, 143, 110); 
  rect(110, 0, 40, 38);//top right rect

  fill(74, 131, 102);  //4
  rect(0, 52, 40, 26); 

  fill(59, 111, 13); 
  rect(40, 52, 31, 48);

  fill(62, 181, 4); 
  rect(71, 34, 44, 68);

  fill(34, 130, 37); 
  rect(115, 38, 14, 54);

  fill(32, 99, 69); 
  rect(129, 38, 21, 54); 

  fill(162, 207, 51);  //rectable number9
  rect(0, 78, 41, 5);

  fill(26, 34, 35); 
  rect(0, 83, 40, 37); 

  fill(31, 71, 38); 
  rect(40, 100, 31, 20); 

  fill(64, 194, 44); 
  rect(71, 100, 16, 20); 

  fill(80, 134, 106); //rect13
  rect(87, 100, 28, 20); 

  fill(36, 55, 54); 
  rect(115, 92, 35, 28); 

  fill(44, 131, 77); 
  rect(126, 108, 24, 12);  //15bottomright

  fill(101, 133, 97); 
  rect(71, 116, 16, 4); 


  //CATALINA
  pushMatrix();

  translate(shiftX, 0);

  fill(65, 150, 91);
  rect(0, 0, 150, 120);


  fill(112, 144, 108);
  rect(0, 0, 45, 37);

  fill(70, 186, 3);
  quad(45, 20, 86, 20, 86, 70, 45, 70); 

  fill(32, 99, 70);
  rect(0, 37, 45, 91-37);


  fill(45, 55, 56);
  rect(0, 91, 7, 107-91);

  fill(176, 225, 66);
  rect(7, 91, 30, 107-91);

  fill(176, 225, 66);
  rect(30, 91, 15, 120-91);

  fill(176, 225, 66);
  quad(45, 70, 86, 70, 86, 120, 45, 120); 


  fill(37, 87, 67);
  quad(86, 101, 113, 101, 113, 120, 86, 120); 

  fill(136, 215, 14);
  rect(113, 101, 150-113, 120-101);



  fill(93, 151, 119);
  quad(143, 77, 150, 77, 150, 101, 143, 101); 


  fill(63, 104, 62);
  quad(143, 20, 150, 20, 150, 77, 143, 77); 



  fill(61, 142, 86);
  quad(86, 70, 143, 70, 143, 101, 86, 101); 

  popMatrix();


  //NORMAN

  pushMatrix();
  translate(shiftX*2, 0);

  scale(.15);


  //Rectangle 1
  colorMode (RGB);
  fill(58, 163, 88);
  rect(0, 0, 180, 140);


  //Rectangle 2
  colorMode (RGB);
  fill(146, 223, 22);
  rect(180, 0, 140, 140);

  //Rectangle 3
  colorMode (RGB);
  fill(62, 72, 72);
  rect(320, 0, 390, 240);

  //Rectangle 4
  colorMode (RGB);
  fill(74, 113, 73);
  rect(0, 140, 410, 380);

  //Rectangle 5
  colorMode (RGB);
  fill(96, 154, 119);
  rect(0, 520, 160, 170);

  //Rectangle 6
  colorMode (RGB);
  fill(147, 225, 25);
  rect(0, 690, 160, 160);

  //Rectangle 7
  colorMode (RGB);
  fill(65, 80, 78);
  rect(160, 520, 250, 300);

  //Rectangle 8
  colorMode (RGB);
  fill(105, 218, 76);
  rect(410, 240, 410, 400);

  //Rectangle 9
  colorMode (RGB);
  fill(64, 147, 113);
  rect(700, 0, 300, 300);

  //Rectangle 10
  colorMode (RGB);
  fill(194, 242, 76);
  rect(820, 300, 180, 180);


  //Rectangle 11
  colorMode (RGB);
  fill(88, 127, 71);
  rect(760, 480, 260, 160);

  //Rectangle 12
  colorMode (RGB);
  fill(153, 223, 39);
  rect(410, 340, 200, 350);

  //Rectangle 13
  colorMode (RGB);
  fill(79, 168, 103);
  rect(410, 680, 275, 120);

  //Rectangle 14
  colorMode (RGB);
  fill(91, 133, 94);
  rect(685, 770, 320, 30);

  //Rectangle 14
  colorMode (RGB);
  fill(81, 83, 85);
  rect(685, 770, 320, 30);


  popMatrix();

  //AMY FINDEISS

  pushMatrix();
  translate(shiftX*3, 0);
  fill(10, 255, 110);
  rect(0, 0, shiftX, shiftY);


  // fill colors
  noStroke();
  fill(111, 141, 135); //color 2-army green
  rect(0, 114, 40, 10);
  rect(105, 64, 53, 45);
  rect(62, 40, 43, 30);

  fill(130, 170, 133); //color 3-light army green
  rect(114, 0, 36, 43);

  fill(76, 81, 84); //color 4-green black
  rect(17, 0, 100, 42);
  rect(0, 66, 19, 48);

  fill(115, 236, 30); //color 5-lime green
  rect(105, 42, 47, 28);

  fill(75, 166, 101); //color 6-teal1
  rect(38, 114, 70, 7);

  fill(69, 143, 135); //color 7-teal2
  rect(19, 54, 60, 60);

  fill(196, 245, 78); //color 8-yellow
  rect(0, 42, 26, 32);

  fill(69, 153, 135); //color 9-teal3
  rect(0, 0, 17, 47);




  popMatrix();




  // JANE

  pushMatrix();
  translate(0, shiftY);

  noStroke();

  // up-left skinny
  fill(25, 35, 35);
  rect(0, 0, 38, 4);

  // middle-left long
  fill(39, 119, 70);
  rect(0, 4, 28, 119);

  // bottom-left dark
  fill(24, 30, 32);
  rect(11, 80, 35, (119-80));

  //middle bright green
  fill(103, 182, 1);
  rect(24, 32, (87-24), (80-32));

  // irritatingly overlapping long skinny greens
  fill(24, 77, 54);
  rect(28, 4, (38-28), (33-4));

  fill(32, 70, 34);
  rect(35, 79, (46 - 34), (119 - 79));

  // long base blue-green
  fill(28, 90, 63);
  rect(46, 80, (109-46), (119-80));

  // green third-from-left
  fill(32, 68, 36);
  rect(38, 0, 31, 32);

  // middle-top plain gray
  fill(94, 126, 95);
  rect(68, 0, (87-68), 32);

  // big teal
  fill(50, 130, 76);
  rect(87, 0, (150-87), 80);

  // bottom-right green
  fill(65, 115, 14);
  rect(109, 79, (150-109), (119-79));

  // little bitty blue-green up top
  fill(82, 133, 103);
  rect(87, 0, 116-87, 5);

  // little black box
  fill(28, 55, 47);
  rect(116, 0, (126-116), 4);

  popMatrix();

  // JAE

  pushMatrix();
  translate(shiftX, shiftY);

  colorMode(RGB);
  noStroke();

  //Rectangle 1
  fill(50, 131, 80);
  rect(0, 0, 30, 80);

  //Rectangle 2
  fill(175, 224, 67);
  rect(30, 0, 55, 10);

  //Rectangle 3
  fill(66, 115, 21);
  rect(0, 80, 5, 39);

  //Rectangle 4
  fill(66, 115, 21);
  rect(85, 0, 20, 10);

  //Rectangle 5
  fill(134, 215, 12);
  rect(105, 0, 45, 25);

  //Rectangle 6
  fill(40, 47, 50);
  rect(30, 10, 75, 50);

  //Rectangle 7
  fill(35, 96, 71);
  rect(5, 50, 40, 69);

  //Rectangle 8
  fill(76, 200, 48);
  rect(20, 99, 25, 20);

  //Rectangle 9
  fill(128, 209, 10);
  rect(45, 74, 60, 45);

  //Rectangle 10
  fill(74, 126, 19);
  rect(45, 60, 60, 24);

  //Rectangle 11
  fill(56, 98, 62);
  rect(105, 55, 45, 64);

  //Rectangle 12
  fill(67, 147, 94);
  rect(105, 25, 20, 30);

  //Rectangle 13
  fill(79, 198, 11);
  rect(125, 20, 25, 35);

  popMatrix();


  // NINA

  pushMatrix();
  translate(shiftX*2, shiftY);

  fill(#446A42);
  rect(0, 0, shiftX, shiftY);
  fill(#73906E);
  rect(0, 0, 45, 40);

  fill(#236446);
  rect(0, 40, 47, 52);

  fill(#213132);
  rect(0, 93, 7, 16); 

  fill(#30864C);
  rect(0, 108, 32, 12);


  beginShape();
  fill(#B3E246);
  vertex(46, 71);
  vertex(87, 71);
  vertex(87, 120);
  vertex(32, 120);
  vertex(32, 108);
  vertex(7, 108);
  vertex(7, 91);
  vertex(46, 92);
  endShape();

  fill(#49BB09);
  rect(46, 16, 41, 55);


  beginShape();
  fill(#38A055);
  vertex(46, 0);
  vertex(150, 0);
  vertex(150, 19);
  vertex(145, 19);
  vertex(143, 71);
  vertex(87, 71);
  vertex(87, 16);
  vertex(46, 16);
  endShape();

  fill(#40693E);
  rect(145, 20, 5, 58);

  fill(#398F54);
  rect(87, 71, 56, 30);


  fill(#398F54);
  rect(143, 79, 7, 22);


  fill(#8AD810);
  rect(114, 101, 36, 19);

  fill(#21573F);
  rect(87, 102, 27, 118);

  popMatrix();

  //JASON

  pushMatrix();
  translate(shiftX*3, shiftY);

  // upper left drab green
  fill(89, 132, 98);
  rect(0, 0, 37, 28);

  // large middle bright green
  fill(154, 245, 53);
  rect(47, 25, 68, 55);

  // upper middle, middle green
  fill(39, 119, 70);
  rect(37, 0, 69, 27);

  // neon green square on left
  fill(109, 227, 88);
  rect(0, 70, 16, 17);

  // far bottom left corner
  fill(53, 162, 97);
  rect(0, 86, 27, 33);

  // green vertical piece below black square
  fill(101, 209, 38);
  rect(15, 70, 12, 32);

  // large olive drab rectangle
  fill(121, 160, 50);
  rect(26, 68, 39, 51);

  // black square
  fill(72, 83, 87);
  rect(5, 26, 43, 48);

  // puke green sliver to left of black square
  fill(121, 160, 50);
  rect(0, 28, 5, 43);

  // soft green vertical sliver at bottom middle
  fill(102, 161, 107);
  rect(64, 68, 8, 51);

  // neutral green vertical rectangle at bottom middle
  fill(74, 159, 102);
  rect(72, 76, 25, 43);

  // teal green horizontal rectangle at bottom right
  fill(73, 182, 107);
  rect(96, 90, 45, 29);

  // grey sliver at bottom right
  fill(132, 162, 122);
  rect(140, 90, 10, 29);

  // soft green horizontal sliver at middle right
  fill(102, 161, 107);
  rect(96, 76, 54, 15);

  // neon green horizontal rectangle at middle right
  fill(109, 212, 46);
  rect(114, 29, 36, 47);

  // upper right drab green
  fill(89, 132, 98);
  rect(106, 0, 44, 30);

  popMatrix();

  // SANTIAGO

  pushMatrix();
  translate(0, shiftY*2-1);

  colorMode(RGB);

  fill(40, 112, 62); //  green one on the left top side
  rect(0, 0, 10, 60);

  fill(32, 38, 41); //  next
  rect(10, 0, 20, 60);

  fill(50, 163, 2); //  left  BOTTOM BIG
  rect(0, 60, 60, 60);

  fill(32, 38, 41); //  left bottom SMALL
  rect(0, 112, 30, 10);

  fill(18, 119, 53); //
  rect(30, 0, 25, 12);

  fill(27, 87, 63);  //
  rect(55, 0, 50, 12);

  fill(69, 120, 18); //  top right corner
  rect(105, 0, 45, 15);

  fill(87, 145, 113); //  long one
  rect(30, 12, 120, 9);

  fill(109, 190, 0); //  right
  rect(125, 21, 25, 50);  

  fill(40, 80, 42); //
  rect(102, 21, 23, 68); 

  fill(64, 191, 37); //  middle light green
  rect(93, 21, 9, 45);

  fill(34, 134, 66); //botttom right
  rect(125, 70, 63, 50);

  fill(168, 218, 50); //  BOTTOM light
  rect(83, 93, 42, 40);

  fill(23, 116, 71); //  thin on top of ^
  rect(83, 89, 42, 5);

  fill(87, 145, 113); // square
  rect(83, 66, 19, 24);

  fill(20, 110, 71); // xx
  rect(66, 66, 18, 55);

  fill(24, 45, 39); // xxthin
  rect(60, 66, 6, 55);

  fill(109, 190, 0); //  last one
  rect(30, 21, 63, 45);

  popMatrix();


  // NATE
  pushMatrix();
  translate(shiftX, 2*shiftY-1);

  /* 1 */
  fill(#447514);
  rect (0, 0, 6, 14);
  /* 2 */
  fill(#216348);
  rect (6, 0, 15, 14);
  /* 3 */
  fill(#2a5229);
  rect (15, 0, 36, 70);


  /* 9 (actually presented under 4 so out of order here) */
  fill(#348a4c);
  rect (32, 70, 43, 49);


  /* 4 */
  fill(#57801a);
  rect (51, 0, 66, 75);
  /* 5 */
  fill(#3b653e);
  rect (116, 0, 34, 17);
  /* 6 */
  fill(#50886b);
  rect (0, 14, 28, 9);
  /* 7 */
  fill(#72c708);
  rect (0, 23, 15, 47);
  /* 8 */
  fill(#208138);
  rect (0, 70, 32, 49);

  /* 9 out of order here */

  /* 10 */
  fill(#297055);
  rect (75, 75, 42, 28);
  /* 11 */
  fill(#3b9055);
  rect (117, 17, 35, 86);


  /* 12 */
  fill(#2c3d3b);
  rect (75, 103, 47, 16);

  /* 13 */
  fill(#b6e540);
  rect(122, 101, 28, 18);

  popMatrix();

  //CONOR

  pushMatrix();
  translate(2*shiftX, 2*shiftY-1);

  fill(#87d612);
  rect(0, 0, shiftX, shiftY);


  //change color and draw rectangle
  fill(#b8e73d);
  rect(0, 101, 37, 19);

  //change color and draw rectangle (kermit colored)
  fill(#4fc215);
  rect(0, 0, 70, 55);

  //change color and draw rectangle (kermit colored)
  fill(#b8e749);
  rect(86, 70, 31, 43); 

  //change color and draw rectangle
  fill(#42955e);
  rect(58, 22, 57, 51);

  //change color and draw rectangle
  fill(#41975e);
  rect(0, 0, 37, 101);

  //change color and draw rectangle
  fill(#44945e);
  rect(0, 0, 160, 10);

  //change color and draw rectangle
  fill(#347257);
  rect(4, 5, 101, 20);

  //change color and draw rectangle
  fill(#35a264);
  rect(107, 0, 53, 29);

  //change color and draw rectangle
  fill(#639a7c);
  rect(115, 29, 45, 28); 

  //change color and draw rectangle
  fill(#9fe953);
  rect(116, 57, 44, 55);

  //change color and draw rectangle
  fill(#3c4443);
  rect(85, 112, 75, 8);

  //change color and draw rectangle
  fill(#649c7d);
  rect(135, 102, 25, 18);

  //change color and draw rectangle
  fill(#347257);
  rect(4, 5, 101, 20);

  //change color and draw rectangle
  fill(#37875b);
  rect(111, 56, 12, 57);

  //change color and draw rectangle
  fill(#377a61);
  rect(81, 0, 44, 33);

  //change color and draw rectangle
  fill(#487251);
  rect(0, 0, 7, 15);
  popMatrix();

  // ADAM

  pushMatrix();
  translate(3*shiftX, 2*shiftY-1);

  fill(165, 237, 89); // neon green one on the left side
  noStroke();
  rect(0, 40, 60, 60);

  fill(101, 217, 81); //large neon green square right in the middle
  noStroke();
  rect(57, 5, 95, 100);



  fill(58, 164, 101); //top left square
  noStroke();
  rect(0, 0, 40, 40);

  fill(111, 148, 47); //length rectangle on top of grid
  noStroke();
  rect(22, 0, 62, 5);

  fill(76, 164, 104); //
  noStroke();
  rect(62, 0, 95, 10);

  fill(83, 180, 111); //
  noStroke();
  rect(95, 0, 140, 10);

  fill(98, 133, 102); // 1 under top right corner
  noStroke();
  rect(86, 10, 54, 13);

  fill(128, 156, 117); //top right rect going downwards
  noStroke();
  rect(140, 0, 150, 46);

  fill(100, 156, 125); // bottom left corner box
  noStroke();
  rect(0, 100, 10, 120);

  fill(107, 147, 44); // bottom row 2nd from left
  noStroke();
  rect(10, 100, 45, 120);

  fill(89, 128, 94); // bottom row 3rd from left
  noStroke();
  rect(45, 98, 35, 22);

  fill(75, 114, 100); // 1 up from bottom right
  noStroke();
  rect(95, 87, 130, 100);

  fill(66, 170, 108); // bottom row 2nd from right
  noStroke();
  rect(80, 100, 135, 120);

  fill(196, 243, 86); // bottom right yellowish box
  noStroke();
  rect(135, 85, 150, 120);

  fill(72, 168, 103); //
  noStroke();
  rect(82, 45, 158, 46);

  fill(103, 144, 42); // 2 down from top right
  noStroke();
  rect(90, 22, 50, 23);

  fill(59, 73, 73); // vertical on the top left side. dark color.
  noStroke();
  rect(40, 5, 19, 50);

  fill(100, 157, 125); // neon green one on the left side
  noStroke();
  rect(0, 30, 30, 30);

  popMatrix();

  //ELIZABETH UMBRINO

  pushMatrix();
  translate(0, 3*shiftY-1);


  fill(79, 133, 72);
  rect(0, 70, 32, 43);
  // (x, y, w, h)

  // fill(106,129,72);
  // rect(width/2, height/2, 52, 46);
  // what is width/#?

  fill(106, 129, 72);
  rect(33, 67, 52, 46);

  fill(78, 101, 62);
  rect(85, 67, 64, 46);


  fill(37, 42, 43);
  rect(0, 0, 32, 72);


  fill(109, 173, 40);
  rect(33, 0, 30, 24);

  fill(83, 141, 74);
  rect(33, 24, 30, 17);

  fill(148, 193, 44);
  rect(33, 38, 30, 28);

  fill(51, 55, 57);
  rect( 64, 0, 87, 69);

  fill(194, 221, 82);
  rect(85, 0, 40, 6);

  fill(75, 128, 90);
  rect(72, 0, 15, 6);



  fill(113, 151, 130);
  rect(117, 0, 32, 43);


  popMatrix();

  //when mouse is pressed, show the divider lines between sketches
  if (showLines) {
    stroke(255);
    strokeWeight(2);
    //horizontal lines
    for (int i=0; i<3; i++) {  
      line(0, shiftY*(i+1), width, shiftY*(i+1));
    }

    //vertical lines (need to be more specific because of big chunk on bottom right
    line(shiftX, 0, shiftX, height); 
    line(shiftX*2, 0, shiftX*2, height-(shiftY-3)); 
    line(shiftX*3, 0, shiftX*3, height-(shiftY-3));
  
    fill(255);
    
    //print names in each box
    for(int i=0; i<3; i++) {
        for(int j=0; j<4; j++){
          text(names[i*4 + j],shiftX*(j+1)-3, shiftY*(i+1)-3);
        }
    }
    //print remaining straggler names
   text(names[12],shiftX-3, height-5);
   text(names[13],width-3, height-5);

    
  } //end if statement
}


void mousePressed() {
  showLines = true;
}

void mouseReleased() {
  showLines = false;
}


