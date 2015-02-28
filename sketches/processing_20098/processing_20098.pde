
void setup(){
size(400,400);
background(139,211,255);
smooth();

//sky


stroke(247,237,20,98);
strokeWeight(250);
line(0,320,400,320);


//tail
fill(236,252,64,120);
  stroke(255,255,255);
  strokeWeight(1);
beginShape();
  vertex(80,290);
   bezierVertex(80,85, 180,200,160,40); //c=
 endShape();

 fill(165,17,240,130);
  stroke(255,255,255);
beginShape();
  vertex(80,290);
   bezierVertex(80,85, 180,200,180,40); //c=
 endShape();


  fill(0,21,232,130);
  stroke(255,255,255);
beginShape();
  vertex(80,290);
   bezierVertex(80,85, 180,200,200,60); //c=
 endShape();
 
  fill(8,250,5,180);
  stroke(255,255,255);
beginShape();
  vertex(80,290);
   bezierVertex(80,85, 180,200,220,80); //c=
 endShape();

fill(187,255,18,200);
beginShape();
  vertex(80,290);
   bezierVertex(80,85, 180,200,240,100); //c=
 endShape();
 
 fill(250,169,5,150);
beginShape();
  vertex(80,290);
   bezierVertex(80,85, 180,200,260,120); //c=
 endShape();
 
  fill(250,5,206,120);
beginShape();
  vertex(80,290);
   bezierVertex(80,85, 180,200,280,140); //c=
 endShape();

//branch
stroke(111,68,3);
strokeWeight(23);
line(0,295,300,260);

//body
fill(16,106,17);
noStroke();
ellipse(80,200,120,180);
fill(3,67,3);
noStroke();
ellipse(70,200,120,180);

//feet
stroke(240,161,34);
strokeWeight(9);
line(28,290,50,280);
line(80,280,102,290);
 

fill(13,49,13);
noStroke();
ellipse(60,200,120,180);



//head
fill(3,25,5);
ellipse(70,140,85,60);
fill(34,80,2,200);
ellipse(70,110,65,60);

//eyes
fill(255,255,255);
ellipse(60,110,15,10);
fill(255,255,255);
ellipse(80,110,15,10);
//pupils
fill(0);
ellipse(60,110,2,8);
fill(0);
ellipse(80,110,2,8);


//nose
fill(240,161,34); 
triangle(60,119,80,119,70,145);
fill(240,103,34); 
triangle(65,119,75,119,70,145);
fill(49,20,6,200); 
triangle(68,119,72,119,70,145);


//littlebird1

//branch
stroke(111,68,3,100);
strokeWeight(6);
line(400,60,299,158);

//branch
stroke(111,68,3,180);
strokeWeight(15);
line(400,210,220,207);


//feet
stroke(240,161,34);
strokeWeight(5);
line(297,148,295,155);
line(299,148,301,155);
 
//body
fill(13,49,13);
noStroke();
ellipse(300,100,70,90);

//head
fill(3,25,5);
ellipse(300,70,50,30);
fill(34,80,2,200);
ellipse(300,50,30,40);

//tail
fill(236,252,64,120);
  stroke(255,255,255);
  strokeWeight(1);
beginShape();
  vertex(300,100);
   bezierVertex(360,85, 190,70,390,40); //c=
 endShape();
 
 //nose
 noStroke();
fill(240,161,34); 
triangle(290,48,269,58,300,55);

//eyes
fill(255,255,255);
ellipse(303,47,8,5);

//pupils
fill(0);
ellipse(303,47,2,3);
 
 

//littlebirdy2

//feet
stroke(240,161,34);
strokeWeight(4);
line(308,208,333,208);
line(308,200,333,202);

//body
fill(13,49,13);
noStroke();
ellipse(330,190,30,40);

//head
fill(3,25,5);
ellipse(330,172,20,15);
fill(34,80,2,200);
ellipse(330,166,16,18);

 //nose
 noStroke();
fill(240,161,34); 
triangle(325,172,325,166,310,174);

//eyes
fill(255,255,255);
ellipse(330,164,6,5);

//pupils
fill(0);
ellipse(330,164,1,2);


//tail
 fill(165,17,240,130);
  stroke(255,255,255);
  strokeWeight(1);
beginShape();
  vertex(330,190);
   bezierVertex(330,190, 300,150,390,200); //c=
 endShape();
 

//lastbird 250, 200
//feet
stroke(240,161,34);
strokeWeight(4);
line(250,210,225,206);
line(250,210,225,211);

//body
fill(13,49,13);
noStroke();
ellipse(250,200,30,40);

//head
fill(3,25,5);
ellipse(250,182,20,15);
fill(34,80,2,200);
ellipse(250,173,16,18);

 //nose
 noStroke();
fill(240,161,34); 
triangle(250,170,235,178,250,176);

//eyes
fill(255,255,255);
ellipse(252,171,6,4);

//pupils
fill(0);
ellipse(252,171,1,2);


//tail
  fill(250,5,206,120);
  stroke(255,255,255);
  strokeWeight(1);
beginShape();
  vertex(250,200);
   bezierVertex(250,200, 230,160,320,210); //c=
 endShape();



}



