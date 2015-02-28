
//Elizabeth Ibarra
//Homework
//using processing.org


float x, y, angle;

void setup(){
  size(600,600);
  background(255);
  smooth();
  x = 0;
  y = 0;
  angle = 0;
  
}

void draw(){
 
  x = cos(radians(angle)) * 100 + width/2;
  y = sin(radians(angle)) * 100 + height/2;
 
 
//shape1  
stroke(192,99,167,1);
noFill();
  beginShape();
  vertex(115,y);
  vertex(x,106);
  vertex(271,y);
  vertex(x,239);
  vertex(196,y);
  vertex(x,243);
  vertex(115,y);
  endShape();
  
  
//shape2 
stroke(124,205,203,1);
noFill();
 
  beginShape();
  vertex(265,y);
  vertex(x,78);
  vertex(399,y);
  vertex(x,234);
  vertex(262,y);
  vertex(x,153);
  vertex(265,y);
  endShape();
  
  //shape3
  stroke(192,99,167,1);
  noFill();
  beginShape();
  vertex(419,y);
  vertex(x,143);
  vertex(501,y);
  vertex(x,280);
  vertex(345,y);
  vertex(x,147);
  vertex(419,y);
  endShape();
  
  //shape4
  stroke(124,205,203,1);
noFill();
  beginShape();
  vertex(413,y);
  vertex(x,208);
  vertex(547,y);
  vertex(x,364);
  vertex(410,y);
  vertex(x,283);
  vertex(413,y);
  endShape();
  
  
  //shape5
    noFill();
    stroke(192,99,167,1);
  beginShape();
  vertex(338,y);
  vertex(x,292);
  vertex(494,y);
  vertex(x,425);
  vertex(420,y);
  vertex(x,429);
  vertex(338,y);
  endShape();
  
  //shape6
    stroke(124,205,203,1);
noFill();
  beginShape();
  vertex(260,y);
  vertex(x,346);
  vertex(393,y);
  vertex(x,502);
  vertex(256,y);
  vertex(x,422);
  vertex(260,y);
  endShape();


//shape7  
    noFill();
    stroke(192,99,167,1);
  beginShape();
  vertex(187,y);
  vertex(x,341);
  vertex(269,y);
  vertex(x,478);
  vertex(113,y);
  vertex(x,345);
  vertex(187,y);
  endShape();
  
  
//shape8  
      stroke(124,205,203,1);
noFill();
  beginShape();
  vertex(71,y);
  vertex(x,214);
  vertex(207,y);
  vertex(x,295);
  vertex(204,y);
  vertex(x,370);
  vertex(71,y);
  endShape();


//green1
      stroke(205,216,57,1);
noFill();
  beginShape();
  vertex(x,74);
  vertex(193,y);
  vertex(x,121);
  vertex(297,y);
  vertex(x,182);
  vertex(96,y);
  vertex(x,74);
  endShape();

//green2
      stroke(205,216,57,1);
noFill();
  beginShape();
  vertex(x,524);
  vertex(405,y);
  vertex(x,477);
  vertex(301,y);
  vertex(x,408);
  vertex(502,y);
  vertex(x,524);
  endShape();
  
  //green3
      stroke(205,216,57,1);
noFill();
  beginShape();
  vertex(x,80);
  vertex(506,y);
  vertex(x,194);
  vertex(300,y);
  vertex(x,123);
  vertex(412,y);
  vertex(x,80);
  endShape();
  
  
  //green4
      stroke(205,216,57,1);
noFill();
  beginShape();
  vertex(x,118);
  vertex(456,y);
  vertex(x,134);
  vertex(300,y);
  vertex(x,475);
  vertex(186,y);
  vertex(x,118);
  endShape();
  

angle++;
}

