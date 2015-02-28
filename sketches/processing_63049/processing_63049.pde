
size(600, 600);
background(250);
smooth();
stroke(0);
 
float x= 20;
 
 int faceWidth = 450;
 int faceHeight = 450;
 
 int eyeWidth = 60;
 int eyeHeight = 60;
 
 int mouthXpos = 25;
 
 int noseWidth = 150;
 int noseHeight = 150;
 
 int nostrilWidth = 8;
 int nostrilHeight = 8;
 
 // outline
stroke(0);
noFill();
strokeWeight(1);
  ellipse(300, 300, faceWidth, faceHeight);
 
 // eyes outline
stroke(0);
ellipse(200, 170, eyeWidth,eyeHeight);
 ellipse(200, 180, 10,10);
  fill (250);
    ellipse(400, 170, eyeWidth,eyeHeight);
    fill(0);
    ellipse(400, 180, 30,30);
    fill(250);
    ellipse(400, 180, 8,8);
 




strokeWeight(x/2); // variable x
strokeCap(SQUARE);
 



  //nose
    fill(0);
  ellipse(300, 340, noseHeight, noseWidth);
  fill(250);
    ellipse (285,402, nostrilHeight+10,nostrilWidth+10);
    ellipse (318,402, nostrilHeight+10,nostrilWidth+10);


  
  ellipse (200,380, 15,15);
  
  stroke(0);
line(250,460,  280, 420);
line(350,460,  320, 420);

strokeWeight(0);
stroke(250);
bezier(280,480,
       280,460,
       290,460,
       300, 460);
       
  //mouth
  fill(0);
  ellipse(300,450,40,40);
  
  //unibrow
  fill(0);
rect(200,125, 188,10);

