
//Head of Man by Paul Klee
//All directional references belong to the reflected version
//of the image, ie "left" here means the right hand side of
//the produced image

void setup()
{
  size(650,650);
  background(#FF9966);
}

void draw()
{
  noStroke();
  fill(255);
  rect(250, 415, 150, 150);   //neck
  
  fill(#B547B5);
  rect(350, 420, 50, 75);   //inside purple neck square
  
  fill(#6666FF);
  rect(300, 495, 50, 55);   //inside blue neck square

  fill(#D11919);
  rect(150, 550, 235, 100);   //red clavicle area
  
  fill(#751975);
  rect(385, 550, 85, 100);   //purple clavicle area
  
  fill(255);
  beginShape();
  curveVertex(350, 610);
  curveVertex(350, 610);
  curveVertex(250, 609);   //white arc inside clavicle
  curveVertex(150, 550);
  curveVertex(150, 550);
  endShape();
  triangle(150, 550, 350, 550, 350, 610);
  stroke(255);
  line(150, 550, 350, 610);
  
  fill(#FFFF33);
  beginShape();
  curveVertex(350, 610);
  curveVertex(350, 610);
  curveVertex(410, 590);   //yellow area inside clavicle
  curveVertex(470, 550);
  curveVertex(470, 550);
  endShape();
  triangle(350, 550, 350, 610, 470, 550);
  stroke(#FFFF33);
  line(350, 610, 470, 550);

  noStroke();
  fill(#F5AC36);
  beginShape();
  curveVertex(128, 154);
  curveVertex(128, 154);
  curveVertex(157, 100);
  curveVertex(195, 61);   //right orange upper arc of face
  curveVertex(262, 25);
  curveVertex(325, 17);
  curveVertex(325, 17);
  endShape();
  triangle(128, 154, 325, 17, 325, 154);
    
  fill(#FA7156);
  beginShape();
  curveVertex(128, 154);
  curveVertex(128, 154);
  curveVertex(115, 227);   //right peach half of face
  curveVertex(128, 300);
  curveVertex(128, 300);
  endShape();
  rect(128, 154, 225, 146);

  fill(#FCED78);
  beginShape();
  curveVertex(530, 180);
  curveVertex(530, 180);
  curveVertex(535, 235);   //left pale yellow half of face
  curveVertex(522, 300);
  curveVertex(522, 300);
  endShape();
  quad(353, 154, 530, 180, 522, 300, 353, 300);
  
  fill(#F0D822);
  beginShape();
  curveVertex(325, 17);
  curveVertex(325, 17);
  curveVertex(400, 29);
  curveVertex(460, 65);   //yellow upper arc of face
  curveVertex(511, 127);
  curveVertex(530, 180);
  curveVertex(530, 180);
  endShape();
  triangle(325, 17, 325, 180, 530, 180);

  fill(#FA7156);  //extra bit of peach part near left eye
  triangle(325, 166, 325, 180, 350, 180);

  fill(255);   //white triangle above right eye
  triangle(150, 154, 240, 70, 325, 170);   
  
  fill(#C072D8);   //purple quad under right eye
  quad(150, 154, 322, 170, 340, 300, 188, 300);
  
  fill(#C977E3);  //purple quad under left eye
  quad(335, 170, 500, 180, 480, 300, 325, 300);
  
  fill(255);  //white quad above left eye
  quad(325, 50, 465, 70, 500, 180, 325, 170); 
  
  fill(#FA7156);  
  beginShape();
  curveVertex(262, 25);
  curveVertex(262, 25);
  curveVertex(270, 60);
  curveVertex(305, 65);   //peach arc above right eye
  curveVertex(325, 50);   //bottom half
  curveVertex(325, 17);
  curveVertex(325, 17);
  endShape();
  beginShape();
  curveVertex(262, 25);
  curveVertex(262, 25);
  curveVertex(295, 18);   //top half
  curveVertex(325, 17);
  curveVertex(325, 17);
  endShape();
  
  fill(#F0D822);
  beginShape();
  curveVertex(325, 17);
  curveVertex(326, 17);
  curveVertex(325, 50);
  curveVertex(340, 80);
  curveVertex(400, 100);   //yellow arc above left eye
  curveVertex(440, 90);
  curveVertex(465, 70);
  curveVertex(465, 70);
  endShape();
  
  fill(#F7C1A7);
  beginShape();
  curveVertex(325, 170);
  curveVertex(325, 170);
  curveVertex(370, 135);
  curveVertex(410, 125);   //pale pink arc above left eye
  curveVertex(450, 140);
  curveVertex(500, 180);
  curveVertex(500, 180);
  endShape();

  fill(#D0D3AD);
  beginShape();
  curveVertex(150, 154);
  curveVertex(150, 154);
  curveVertex(255, 140);   //top curve of right eye
  curveVertex(330, 170);
  curveVertex(330, 170);
  endShape();
  fill(#D0D3AD);
  line(150, 154, 330, 170);
  
  beginShape();
  curveVertex(150, 154);
  curveVertex(150, 154);
  curveVertex(235, 185);   //bottom curve of right eye
  curveVertex(330, 170);
  curveVertex(330, 170);
  endShape();
  
  beginShape();
  curveVertex(330, 170);
  curveVertex(330, 170);
  curveVertex(420, 163);   //top curve of left eye
  curveVertex(508, 180);
  curveVertex(508, 180);
  endShape();
  
  beginShape();
  curveVertex(330, 170);
  curveVertex(330, 170);
  curveVertex(390, 200);   //bottom curve of left eye
  curveVertex(450, 200);
  curveVertex(508, 180);
  curveVertex(508, 180);
  endShape();

  fill(#DB281F);
  ellipse(240, 162, 45, 44);   //right pupil
  ellipse(380, 180, 30, 30);   //left pupil

  fill(255);
  beginShape();
  curveVertex(128, 300);
  curveVertex(128, 300);
  curveVertex(180, 375);
  curveVertex(250, 422);
  curveVertex(325, 437);   //lower white arc of face
  curveVertex(400, 422);
  curveVertex(470, 375);
  curveVertex(522, 300);
  curveVertex(522, 300);
  endShape();
  
  fill(#7F2D98);   //small purple quad under left eye
  quad(326, 285, 344, 285, 344, 300, 325, 300);
  
  fill(#EA66E2);
  quad(325, 300, 344, 300, 344, 315, 324, 315);
  
  fill(#7F2D98);   //small purple quad under right eye
  quad(302, 300, 325, 300, 324, 315, 302, 315);
  
  fill(#7D5833);
  beginShape();
  curveVertex(150, 550);
  curveVertex(150, 550);
  curveVertex(50, 575);  //right shoulder
  curveVertex(0, 650);
  curveVertex(0, 650);
  endShape();
  triangle(0, 650, 150, 550, 150, 650);
  
  beginShape();
  curveVertex(470, 550);
  curveVertex(470, 550);
  curveVertex(600, 575);   //left shoulder
  curveVertex(650, 650);
  curveVertex(650, 650);
  endShape();
  triangle(470, 550, 470, 650, 650, 650);
}


