
void setup(){
  
  size(500,500); 

}

void draw(){
  fill(103, 178, 255);
  rect(0,0,width,height);
    noStroke();
  smooth();
 


  
      fill(#154678); //back medium blue wave
   beginShape();
    curveVertex(1,500);
    curveVertex(1,500);
    curveVertex(1,300);
    curveVertex(136,288);
    curveVertex(130,367);
    curveVertex(180,466);
    curveVertex(209,377);
    curveVertex(234,256);
    curveVertex(254,310);
    curveVertex(240,407);
    curveVertex(240,423);
    curveVertex(300,389);
    curveVertex(388,302);
    curveVertex(400,287);
    curveVertex(413,324);
    curveVertex(390,390);
    curveVertex(384,407);
    curveVertex(440,373);
    curveVertex(500,288);
    curveVertex(500,500);
    curveVertex(500,500);
   endShape();
  
 fill(#3a5a7b); //lt blue middle wave
   beginShape();
    curveVertex(1,500);
    curveVertex(1,500);
    curveVertex(1,300);
    curveVertex(75,266);
    curveVertex(137,390);
    curveVertex(213,267);
    curveVertex(215,370);
    curveVertex(295,290);
    curveVertex(356,451);
    curveVertex(488,229);
    curveVertex(473,411);
    curveVertex(490,450);
   
    curveVertex(500,500);
    curveVertex(500,500);
   endShape();

    fill(242,188,71); //boatman

   ellipse(330,250,120,120);
   rect(328,300,10,50);
rect(310,317,70,7);
   
 fill(98,70,10); //boat
      beginShape();
          curveVertex(228,341);
          curveVertex(228,341);
          curveVertex(333,418);
          curveVertex(435,341);
          curveVertex(435,341);
      endShape();
  

 fill(14,50,86); //dark wave front


    beginShape();
    curveVertex(0, 500);
    curveVertex(0, 500);
    curveVertex(0, 210);
    curveVertex(40, 210);
    curveVertex(123,500);
    curveVertex(150, 550);
    curveVertex(126, 324);
    curveVertex(123, 283);
    curveVertex(150, 300);
    curveVertex(250, 460);
    curveVertex(267, 440);
    curveVertex(280, 385);
    curveVertex(290, 271);
    curveVertex(310, 390);
    curveVertex(346, 441);
    curveVertex(361, 453);
    curveVertex(367, 415);
    curveVertex(370, 373);
    curveVertex(400, 423);
    curveVertex(449, 461);
    curveVertex(459, 384);
    curveVertex(460, 335);
    curveVertex(470, 311);
    curveVertex(485, 350);
    curveVertex(500, 400);
    curveVertex(500, 500);
    curveVertex(500, 500);
    curveVertex(246,459);
   endShape();
   beginShape();
   vertex(300,420);
   vertex(300,420);
   vertex(287,428);
   vertex(274,447);
   vertex(272,463);
   
fill(166,143,92); //paddle
   vertex(300,455);
   vertex(303,431);
   vertex(300,420);
   vertex(300,420);
  endShape();
beginShape();
   vertex(370,309);
   vertex(370,309);
   vertex(377,310);
   vertex(300,423);
   vertex(295,418);
   vertex(295,418);
endShape();

fill(#a44747); //mouth
beginShape();
   curveVertex(358,272);
   curveVertex(358,272);
   curveVertex(376,272);
   curveVertex(389,260);
   curveVertex(389,260);
endShape();   

fill(255); //eyes
ellipse(347,243,15,15);
ellipse(381,233,15,15);
fill(0);
ellipse(347,240,8,8);   
ellipse(383,230,8,8);   

fill(#6b647f); //hat
beginShape();
   curveVertex(258,242);
   curveVertex(258,242);
   curveVertex(283,177);
   curveVertex(387,192);
   curveVertex(387,192);
endShape();   
}                               
