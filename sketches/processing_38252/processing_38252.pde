
 size(600, 600);
 background(240, 19, 7);
 smooth();
 
 //Hair base
 fill(70, 38, 6);
 noStroke(); 
 ellipse(285, 200, 320, 340);
 beginShape();
 vertex(150, 280);
 vertex(150, 450);
 vertex(350, 440);
 endShape(CLOSE);
 
 //Facial structure
 fill(242, 196, 122);
 ellipse(315, 175, 225, 175);
 ellipse(310, 310, 225, 250);
 ellipse(335, 420, 70, 40); //chin
 rect(198, 100, 150, 200);
 ellipse(180, 250, 50, 105); //ear
 
 //Neck
 rect(215, 340, 120, 200);
 triangle(215, 460, 215, 540, 160, 540);
 triangle(330, 490, 330, 540, 420, 540);
 triangle(160, 540, 330, 600, 420, 540);

//Bangs chunks
 fill(70, 38, 6);
 noStroke(); 
 
 beginShape();
 vertex(342, 205);
 vertex(252, 100);
 vertex(235, 180);
 vertex(252, 205);
 endShape(CLOSE);
 
 beginShape();
 vertex(235, 180);
 vertex(198, 230);
 vertex(198, 100);
 vertex(260, 100);
 endShape(CLOSE);
 
 beginShape();
 vertex(342, 205);
 vertex(342, 80);
 vertex(198, 80);
 endShape(CLOSE);
 
 beginShape();
 vertex(342, 190);
 vertex(356, 205);
 vertex(356, 90);
 vertex(300, 90);
 endShape(CLOSE); 
 
 beginShape();
 vertex(356, 205);
 vertex(356, 90);
 vertex(400, 90);
 vertex(400, 205);
 endShape(CLOSE);
 
 beginShape();
 vertex(400, 160);
 vertex(410, 205);
 vertex(445, 205);
 vertex(400, 85);
 endShape(CLOSE);
 
 //Hair bottom
 beginShape();
 vertex(150, 280);
 vertex(130, 410);
 vertex(200, 410);
 endShape(CLOSE);
 
 beginShape();
 vertex(150, 280);
 vertex(140, 430);
 vertex(200, 400);
 endShape(CLOSE);
 
 beginShape();
 vertex(150, 280);
 vertex(150, 450);
 vertex(200, 450);
 endShape(CLOSE);
 
 beginShape();
 vertex(150, 280);
 vertex(120, 340);
 vertex(150, 180);
 endShape(CLOSE);
 
 beginShape();
 vertex(150, 320);
 vertex(125, 400);
 vertex(150, 180);
 endShape(CLOSE);
 
 //Shirt
 fill(133, 26, 149);
 beginShape();
 vertex(330, 600);
 vertex(160, 540);
 vertex(70, 560);
 vertex(30, 600);
 endShape(CLOSE);
 
 beginShape();
 vertex(330, 600);
 vertex(420, 540);
 vertex(500, 560);
 vertex(570, 600);
 endShape(CLOSE);
 
//Mouth
  fill(227, 82, 82);
  arc(337, 365, 75, 40, 0, 3);
  ellipse(320, 365, 40, 17);
  ellipse(355, 365, 40, 17);
  
 //Nose
 
 stroke(214, 121, 50);
 strokeWeight(3);
 noFill();
 arc(350, 310, 50, 50, 0, radians(80));
 fill(227, 82, 82);
 ellipse(332, 329, 5, 5);
 
 //Eyes and brows
 fill(255);
 noStroke();
 ellipse(285, 230, 60, 25);
 ellipse(378, 230, 45, 25);
 fill(70, 38, 6);
 ellipse(280, 230, 23, 24);
 ellipse(376, 230, 22, 23);
 fill(133, 26, 149);

 

