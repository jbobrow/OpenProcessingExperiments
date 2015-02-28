
color blush = color (244, 42, 90, 80);
color happy = color (255,246, 164, 100);
color mad = color (244, 42, 90, 255);
float m = 80;
color polar = color(247, 245, 242);


void setup(){
  size(480,320);
  strokeWeight(3);
  strokeCap(ROUND);
  smooth();
  stroke(0);
  
}

void draw(){
  
  background(happy);
  
  fill(polar);
  // hand in
  ellipse(130, 236, 46, 39);
  // arm in
  fill(255);
  beginShape();
  vertex(148, 246);
  bezierVertex(148, 246, 204, 172, 182, 161);
  bezierVertex(159, 147, 108, 232, 108, 232);
  endShape();
  // sleeve in
  fill(255);
  beginShape();
  vertex(109, 229);
  vertex(113, 216);
  vertex(155, 236);
  vertex(149, 244);
  endShape();
  // body
beginShape();
vertex(194,165);
bezierVertex(168,177, 149, 204, 149, 229);
bezierVertex(149, 248, 148, 271, 164, 280);
bezierVertex(177, 286, 204, 280, 222, 279);
bezierVertex(239, 279, 267, 286, 279, 279);
bezierVertex(296, 270, 295, 245, 295, 226);
bezierVertex(295, 200, 277, 176, 251, 165);
endShape();


  // hand out
  stroke(0);
  fill(polar);
  ellipse(319, 237, 46, 39);
  // neck
  beginShape();
  vertex(194, 164);
  bezierVertex(194, 164, 220, 217, 251, 164);
  endShape();
  // arm out
  fill(255);
  beginShape();
  vertex(341, 228);
  bezierVertex(341, 228, 289, 144, 265, 157);
  bezierVertex(244, 169, 300, 242, 300, 242);
  endShape();
  // sleeves
  beginShape();
  vertex(339, 226);
  vertex(335, 212);
  vertex(293, 233);
  vertex(299, 240);
  endShape();
  line(108, 232, 148, 246);
  line(300, 242, 341, 228);
  // leg line
  fill(polar);
  beginShape();
  vertex(156, 273);
  bezierVertex(165, 272, 287, 273, 287, 273);
  endShape();
  line(222, 275, 222, 279);
  

   //if mouse over or pressed
  if(dist(222, 103, mouseX, mouseY)<80) {
  fill(polar);
  
  // hand in
  ellipse(130, 236, 46, 39);
  // arm in
  fill(255);
  beginShape();
  vertex(148, 246);
  bezierVertex(148, 246, 204, 172, 182, 161);
  bezierVertex(159, 147, 108, 232, 108, 232);
  endShape();
  // sleeve in
  fill(255);
  beginShape();
  vertex(109, 229);
  vertex(113, 216);
  vertex(155, 236);
  vertex(149, 244);
  endShape();
  // body
beginShape();
vertex(194,165);
bezierVertex(168,177, 149, 204, 149, 229);
bezierVertex(149, 248, 148, 271, 164, 280);
bezierVertex(177, 286, 204, 280, 222, 279);
bezierVertex(239, 279, 267, 286, 279, 279);
bezierVertex(296, 270, 295, 245, 295, 226);
bezierVertex(295, 200, 277, 176, 251, 165);
endShape();
  // hand out
  fill(polar);
  ellipse(319, 237, 46, 39);
  // neck
  beginShape();
  vertex(194, 164);
  bezierVertex(194, 164, 220, 217, 251, 164);
  endShape();
  //face
  ellipse(222, 103, 159, 131);
  // arm out
  fill(255);
  beginShape();
  vertex(341, 228);
  bezierVertex(341, 228, 289, 144, 265, 157);
  bezierVertex(244, 169, 300, 242, 300, 242);
  endShape();
  // sleeves
  beginShape();
  vertex(339, 226);
  vertex(335, 212);
  vertex(293, 233);
  vertex(299, 240);
  endShape();
  line(108, 232, 148, 246);
  line(300, 242, 341, 228);
  // leg line
  fill(polar);
  beginShape();
  vertex(156, 273);
  bezierVertex(165, 272, 287, 273, 287, 273);
  endShape();
  line(222, 272, 222, 279);
     //ear1
     beginShape();
     vertex(144, 90);
     bezierVertex(148, 71, 163, 55, 184, 45);
     bezierVertex(158, 33, 111, 60, 144, 90);
     endShape();
     //ear2
     beginShape();
     vertex(300, 87);
     bezierVertex(327, 66, 299, 29, 259, 45);
     bezierVertex(280, 53, 295, 68, 300, 87);
     endShape();
     //nose 1
     beginShape();
     vertex(183, 123);
     bezierVertex(183, 160, 261, 160, 261, 123);
     bezierVertex(262, 81, 183, 78, 183, 123);
     endShape();
  } 
  
  else { 
    ellipse(222, 103, 159, 131);
    if(m<255){
     m = m+1; 
     mad = color (244, 42, 90, m);
    }

      fill(mad);
      ellipse(130, 236, 46, 39);
      // arm in
  fill(255);
  beginShape();
  vertex(148, 246);
  bezierVertex(148, 246, 204, 172, 182, 161);
  bezierVertex(159, 147, 108, 232, 108, 232);
  endShape();
  // sleeve in
  beginShape();
  vertex(109, 229);
  vertex(113, 216);
  vertex(155, 236);
  vertex(149, 244);
  endShape();
  // body
beginShape();
vertex(194,165);
bezierVertex(168,177, 149, 204, 149, 229);
bezierVertex(149, 248, 148, 271, 164, 280);
bezierVertex(177, 286, 204, 280, 222, 279);
bezierVertex(239, 279, 267, 286, 279, 279);
bezierVertex(296, 270, 295, 245, 295, 226);
bezierVertex(295, 200, 277, 176, 251, 165);
endShape();
  // hand out
  fill(mad);
  ellipse(319, 237, 46, 39);
    // arm out
  fill(255);
  beginShape();
  vertex(341, 228);
  bezierVertex(341, 228, 289, 144, 265, 157);
  bezierVertex(244, 169, 300, 242, 300, 242);
  endShape();
  // sleeves
  beginShape();
  vertex(339, 226);
  vertex(335, 212);
  vertex(293, 233);
  vertex(299, 240);
  endShape();
  line(108, 232, 148, 246);
  line(300, 242, 341, 228);
    // leg line
  fill(polar);
  beginShape();
  vertex(156, 273);
  bezierVertex(165, 272, 287, 273, 287, 273);
  endShape();
  line(222, 272, 222, 279);
  
      // neck
       fill(mad);
      beginShape();
      vertex(194, 164);
      bezierVertex(194, 164, 220, 217, 251, 164);
      endShape();
     //face
     ellipse(222, 103, 159, 131);
     //ear1
     beginShape();
     vertex(144, 90);
     bezierVertex(148, 71, 163, 55, 184, 45);
     bezierVertex(158, 33, 111, 60, 144, 90);
     endShape();
     //ear2
     beginShape();
     vertex(300, 87);
     bezierVertex(327, 66, 299, 29, 259, 45);
     bezierVertex(280, 53, 295, 68, 300, 87);
     endShape();
     //nose 1
     beginShape();
     vertex(183, 123);
     bezierVertex(183, 160, 261, 160, 261, 123);
     bezierVertex(262, 81, 183, 78, 183, 123);
     endShape();
         //eyebrows
    strokeWeight(5);
    line(200, 92, 159, 75);
    line(246, 92, 287, 75);
    
    // hot air
    fill(polar);
    line(117,49, 107, 41);
    line(122, 40, 112, 30);
    beginShape();
    vertex(95, 42);
    bezierVertex(95, 42, 75, 47, 86, 33);
    bezierVertex(86, 33, 73, 7, 95, 23);
    bezierVertex(95, 23, 115, 1, 108, 26);
    bezierVertex(103, 51, 103, 51, 108, 26);
    endShape();
  }
      //nose 2
    fill(0); 
    beginShape();
    vertex(222, 116);
    bezierVertex(226, 116, 234, 108, 232, 104);
    bezierVertex(230, 100, 214, 100, 212, 104);
    bezierVertex(211, 108, 218, 115, 222, 116);
    endShape();
    // eyes
    ellipse(185, 101, 18, 16);
    ellipse(260, 101, 18, 16);
    
    
      //grapes
  int x= mouseX;
  int y= mouseY;
   stroke(117,76,36);
  strokeWeight(8);
  line(x+30, y, x+20, y+30);
  strokeWeight(3);
  stroke(0);
  fill(110, 75, 157);
  ellipse(x, y, 16, 14);
  ellipse(x-15, y-1, 16, 14);
  ellipse(x+3, y+9, 16, 14);
  ellipse(x+14, y+17, 16, 14);
  ellipse(x, y+10, 16, 14);
  ellipse(x+28, y-6, 16, 14);  
  ellipse(x-15, y-11, 16, 14);
  ellipse(x, y-12, 16, 14);
  ellipse(x+15, y-7, 16, 14);  
  ellipse(x+16, y, 16, 14);  
  ellipse(x+14, y+20, 16, 14);
  ellipse(x+20, y+15, 16, 14);
  ellipse(x, y+20, 16, 14);
 
}

void mouseClicked() {
  if(dist(222, 103, mouseX, mouseY)<80) {
     fill(polar);
  // hand in
  ellipse(130, 236, 46, 39);
  // arm in
  fill(255);
  beginShape();
  vertex(148, 246);
  bezierVertex(148, 246, 204, 172, 182, 161);
  bezierVertex(159, 147, 108, 232, 108, 232);
  endShape();
  // sleeve in
  fill(255);
  beginShape();
  vertex(109, 229);
  vertex(113, 216);
  vertex(155, 236);
  vertex(149, 244);
  endShape();
  // body
beginShape();
vertex(194,165);
bezierVertex(168,177, 149, 204, 149, 229);
bezierVertex(149, 248, 148, 271, 164, 280);
bezierVertex(177, 286, 204, 280, 222, 279);
bezierVertex(239, 279, 267, 286, 279, 279);
bezierVertex(296, 270, 295, 245, 295, 226);
bezierVertex(295, 200, 277, 176, 251, 165);
endShape();
  // hand out
  fill(polar);
  ellipse(319, 237, 46, 39);
  // neck
  beginShape();
  vertex(194, 164);
  bezierVertex(194, 164, 220, 217, 251, 164);
  endShape();
  //face
  ellipse(222, 103, 159, 131);
  // arm out
  fill(255);
  beginShape();
  vertex(341, 228);
  bezierVertex(341, 228, 289, 144, 265, 157);
  bezierVertex(244, 169, 300, 242, 300, 242);
  endShape();
  // sleeves
  beginShape();
  vertex(339, 226);
  vertex(335, 212);
  vertex(293, 233);
  vertex(299, 240);
  endShape();
  line(108, 232, 148, 246);
  line(300, 242, 341, 228);
  // leg line
  fill(polar);
  beginShape();
  vertex(156, 273);
  bezierVertex(165, 272, 287, 273, 287, 273);
  endShape();
  line(222, 272, 222, 279);
     //ear1
     beginShape();
     vertex(144, 90);
     bezierVertex(148, 71, 163, 55, 184, 45);
     bezierVertex(158, 33, 111, 60, 144, 90);
     endShape();
     //ear2
     beginShape();
     vertex(300, 87);
     bezierVertex(327, 66, 299, 29, 259, 45);
     bezierVertex(280, 53, 295, 68, 300, 87);
     endShape();
     //nose 1
     beginShape();
     vertex(183, 123);
     bezierVertex(183, 160, 261, 160, 261, 123);
     bezierVertex(262, 81, 183, 78, 183, 123);
     endShape();
     noLoop();
    }
          //nose 2
    fill(0); 
    beginShape();
    vertex(222, 116);
    bezierVertex(226, 116, 234, 108, 232, 104);
    bezierVertex(230, 100, 214, 100, 212, 104);
    bezierVertex(211, 108, 218, 115, 222, 116);
    endShape();
    // eyes
    ellipse(185, 101, 18, 16);
    ellipse(260, 101, 18, 16);
    //blushing
    noStroke();
    fill(blush);
    ellipse(160, 125, 40, 40);
    ellipse(285, 125, 40, 40);
      save("screen.jpg");
  }
  

  

