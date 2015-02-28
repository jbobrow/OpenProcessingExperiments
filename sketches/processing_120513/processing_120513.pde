
size(400, 565);
int i = 1;
if (i > 0) background(255); //haikeishoku
 
 pushMatrix();   //zahyounohozonn
noStroke();  //sikakkeinokatamuki
fill(105, 139, 105);
rotate(6);  
rect(10, 90, 150, 150);
 popMatrix();

 pushMatrix();  //zahyounohozonn
noStroke();
fill(225, 0, 0);
rotate(6);  //sikakkeinokatamuki
rect(60, 250, 185, 185);
 popMatrix();

noStroke();  //sakakkei
fill(58, 95, 205, 230);
rect(150, 40, 170, 150);

noStroke();  //sikakkei
fill(143, 188, 143);
rect(10, 221, 148, 200);

noStroke();  //sikakkei
fill(238, 197, 145);
rect(260, 300, 148, 200);

pushMatrix();  //zahyounohozonn
noStroke();
fill(255, 130, 171);
rotate(6.5);   //zahyounokatamuki
rect(160, 300, 185, 185);
 popMatrix();

noStroke();   //sikakkei
fill(251, 0, 0);
rect(260, 120, 148, 140);

fill(0, 0, 139, 150);  //enn
ellipse(165, 174, 30, 30);

fill(0, 139, 139, 150);   //enn
ellipse(55.5, 93, 30, 30);

fill(255);  //enn
ellipse(385, 135, 30, 30);

fill(255, 165, 0, 150);   //enn
ellipse(276, 484, 30, 30);

fill(144, 238, 144, 150);   //enn
ellipse(26, 406.4, 30, 30);

fill(255, 52, 179, 150);   //enn
ellipse(72, 495, 30, 30);

stroke(255);   //senn
strokeWeight(10);
line(385, 135, 276, 484);

stroke(255);   //senn
strokeWeight(6);
line(385, 135, 26, 406.4);

stroke(255);   //senn
strokeWeight(8);
line(385, 135, 72, 495);

stroke(255);   //senn
strokeWeight(2);
line(385, 135, 55.5, 93);

stroke(255);   //senn
strokeWeight(4);
line(385, 135, 165, 174);



