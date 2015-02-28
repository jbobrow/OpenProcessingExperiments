
void setup() {
  size(900, 600);
  frameRate(30) ;
 background(mouseY-100, mouseY-200, mouseX);
}

void draw() {
  smooth();
   
  // Set ellipses and rects to CENTER mode
  ellipseMode(CENTER);
  rectMode(CENTER);
  
  //X line
  strokeWeight(10);
  stroke(50, mouseX-100, mouseX+100);
  line(0, 0, 900, 600);
  line(900, 0, 0, 600);

  // Draw Zoog’s body
  noStroke();
  fill(random(225), random(225), random(225));
  //1 triangle
  ellipse(100, 100, int(mouseY/10), int(mouseY/10));
  ellipse(120, 120, int(mouseY/10), int(mouseY/10));
  ellipse(80, 120, int(mouseY/10), int(mouseY/10));
  ellipse(60, 140, int(mouseY/10), int(mouseY/10));
  ellipse(140, 140, int(mouseY/10), int(mouseY/10));
  ellipse(100, 140, int(mouseY/10), int(mouseY/10));
  //2 triangle
  ellipse(400, 500,  int(mouseX/10), int(mouseX/10));
  ellipse(420, 520, int(mouseX/10), int(mouseX/10));
  ellipse(380, 520, int(mouseX/10), int(mouseX/10));
  ellipse(360, 540, int(mouseX/10), int(mouseX/10));
  ellipse(440, 540, int(mouseX/10), int(mouseX/10));
  ellipse(400, 540, int(mouseX/10), int(mouseX/10));
  
   //3 triangle
  ellipse(700, 300, int(mouseX/10), int(mouseY/10));
  ellipse(720, 370, int(mouseX/10), int(mouseY/10));
  ellipse(680, 370, int(mouseX/10), int(mouseY/10));
  ellipse(660, 440, int(mouseX/10), int(mouseY/10));
  ellipse(740, 440, int(mouseX/10), int(mouseY/10));
  ellipse(700, 440, int(mouseX/10), int(mouseY/10));
   //4 triangle
  ellipse(200, 520, int(mouseX/5), int(mouseX/5));
  ellipse(220, 570, int(mouseX/5), int(mouseX/5));
  ellipse(180, 570, int(mouseX/5), int(mouseX/5));
  ellipse(220, 470, int(mouseX/5), int(mouseX/5));
  ellipse(180, 470, int(mouseX/5), int(mouseX/5));
  

  
   
   //line
   strokeWeight(1);
   stroke(255, mouseX, 255);
   line(164,222,229,213);
   line(164,222,230,125);
   line(164,222,243,292);
   
   line(229,213,230,125);
   line(229,213,243,292);
   line(229,213,295,190);
   line(229,213,275,249);
  
   line(230,125,295,190);
   line(230,125,337,302);
   line(230,125,344,153);
   
   line(243,292,295,190);
   line(243,292,337,302);
   
   line(295,190,337,302);
   line(295,190,344,153);
   
   line(275,249,337,302);
   line(275,249,340,303);
   line(275,249,344,153);
   
   line(340,303,344,153);
   
   //triangle rect
   fill(random(225), random(225),random(225));
   rect(100,500, int(mouseY-mouseX), 20);
   rect(100,400, int(mouseY-mouseX), 15);
   rect(100,340, int(mouseY-mouseX), 10);
   rect(100,300, int(mouseY-mouseX), 5);
   rect(100,270, int(mouseY-mouseX), 1);
   
   
   rect(700,30, int(mouseX+mouseY), 1);
   rect(700,40, int(mouseX+mouseY), 1);
  rect(700,50, int(mouseX+mouseY), 1);
  rect(700,60, int(mouseX+mouseY), 1);
  rect(700,70, int(mouseX+mouseY), 1);
  
  rect(800,500, int(mouseX-mouseY), 20);
   rect(800,400, int(mouseX-mouseY), 15);
   rect(800,340, int(mouseX-mouseY), 10);
   rect(800,300, int(mouseX-mouseY), 5);
   rect(800,270, int(mouseX-mouseY), 1);
   noStroke();
   rect(400,220, int(mouseX-mouseY), 1);
   rect(400,200, int(mouseX-mouseY), 5);
   rect(400,160, int(mouseX-mouseY), 10);
   rect(400,100, int(mouseX-mouseY), 15);
   rect(400,20, int(mouseX-mouseY), 20);
   //line
   strokeWeight(1);
   stroke(random(225));
   line(364,422,429,413);
   line(364,422,430,325);
   line(364,422,443,492);
   
   line(429,413,430,325);
   line(429,413,443,492);
   line(429,413,495,390);
   line(429,413,475,449);
  
   line(430,325,495,390);
   line(430,325,537,502);
   line(430,325,544,353);
   
   line(443,492,495,390);
   line(443,492,537,502);
   
   line(495,390,537,502);
   line(495,390,544,353);
   
   line(475,449,537,502);
   line(475,449,540,503);
   line(475,449,544,353);
   
   line(540,503,544,353);
   //point
  strokeWeight(10);
  stroke(random(300), random(300), random(300));
   
   point(164,222);//1
   point(229,213);//2
   point(230,125);//3
   point(243,292);//4
   point(295,190);//5
   point(275,249);//6
   point(337,302);//7
   point(340,303);//8
   point(344,153);//9
   
   //point
  strokeWeight(10);
  stroke(225, mouseY, 100);
   
   point(364,422);//1
   point(429,413);//2
   point(430,325);//3
   point(443,492);//4
   point(495,390);//5
   point(475,449);//6
   point(537,502);//7
   point(540,503);//8
   point(544,353);//9
   
   //top point
   point(564,122);//1
   point(629,113);//2
   point(630,25);//3
   point(643,192);//4
   point(695,90);//5
   point(675,149);//6
   point(737,202);//7
   point(744,153);//9
   
   //line
   strokeWeight(1);
   stroke(random(225));
   line(764,222,829,213);
   line(764,222,830,125);
   line(764,222,843,292);
   
   line(829,213,830,125);
   line(829,213,843,292);
   line(829,213,895,190);
   line(829,213,875,249);
  
   line(830,125,895,190);
   line(830,125,937,302);
   line(830,125,944,153);
   
   line(843,292,895,190);
   line(843,292,937,302);
   
   line(895,190,937,302);
   line(895,190,944,153);
   
   line(875,249,937,302);
   line(875,249,940,303);
   line(875,249,944,153);
   
   line(940,303,944,153);
  
}
void mousePressed(){
background(random(225), mouseY-200, mouseX);
}
void keyPressed(){
   //point
  strokeWeight(40);
  stroke(255-mouseY, 150, 100-mouseX);
   
   point(164,222);//1
   point(229,213);//2
   point(230,125);//3
   point(243,292);//4
   point(295,190);//5
   point(275,249);//6
   point(337,302);//7
   point(340,303);//8
   point(344,153);//9
   
   //point
  strokeWeight(40);
  stroke(random(225), random(225), random(225));
   
   point(364,422);//1
   point(429,413);//2
   point(430,325);//3
   point(443,492);//4
   point(495,390);//5
   point(475,449);//6
   point(537,502);//7
   point(540,503);//8
   point(544,353);//9
   
   //top point
   point(564,122);//1
   point(629,113);//2
   point(630,25);//3
   point(643,192);//4
   point(695,90);//5
   point(675,149);//6
   point(737,202);//7
   point(744,153);//9
   strokeWeight(2);
   stroke(0);
  fill(random(225), random(225), random(225));
  //1 triangle
  ellipse(100, 100, int(mouseY/10), int(mouseY/10));
  ellipse(120, 120, int(mouseY/10), int(mouseY/10));
  ellipse(80, 120, int(mouseY/10), int(mouseY/10));
  ellipse(60, 140, int(mouseY/10), int(mouseY/10));
  ellipse(140, 140, int(mouseY/10), int(mouseY/10));
  ellipse(100, 140, int(mouseY/10), int(mouseY/10));
  //2 triangle
  ellipse(400, 500,  int(mouseX/10), int(mouseX/10));
  ellipse(420, 520, int(mouseX/10), int(mouseX/10));
  ellipse(380, 520, int(mouseX/10), int(mouseX/10));
  ellipse(360, 540, int(mouseX/10), int(mouseX/10));
  ellipse(440, 540, int(mouseX/10), int(mouseX/10));
  ellipse(400, 540, int(mouseX/10), int(mouseX/10));
  
   //3 triangle
  ellipse(700, 300, int(mouseX/10), int(mouseY/10));
  ellipse(720, 370, int(mouseX/10), int(mouseY/10));
  ellipse(680, 370, int(mouseX/10), int(mouseY/10));
  ellipse(660, 440, int(mouseX/10), int(mouseY/10));
  ellipse(740, 440, int(mouseX/10), int(mouseY/10));
  ellipse(700, 440, int(mouseX/10), int(mouseY/10));
   //4 triangle
  ellipse(200, 520, int(mouseX/5), int(mouseX/5));
  ellipse(220, 570, int(mouseX/5), int(mouseX/5));
  ellipse(180, 570, int(mouseX/5), int(mouseX/5));
  ellipse(220, 470, int(mouseX/5), int(mouseX/5));
  ellipse(180, 470, int(mouseX/5), int(mouseX/5));
  line(pmouseX,pmouseY,mouseX,mouseY);

}

