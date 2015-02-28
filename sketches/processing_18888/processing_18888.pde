

    //Eye SPEED
  float eyeSize1 = 88;
  float eyeSize2 = 50;
  float eyeSize3 = 16.5;




void setup() {
  size (640, 480);
  smooth();
}


void draw () {
  background(245);
  noStroke();


  //FOLLOW TO MOUSE
  //Pupil Right X
  float followPRx=map(mouseX, 0, 640, 428, 460);
   //Pupil Left X
  float followPLx=map(mouseX, 0, 640, 191, 223);
   //Pupil Right Y
  float followPRy=map(mouseY, 0, 500, 197, 229);
   //Pupil Left Y
  float followPLy=map(mouseY, 0, 500, 197, 229);
   
   
   //SCARED MODE CIRCLES PARAMETERS
  int radius = 150;
  float dL = dist(mouseX, mouseY, 203, 212);
  float dR = dist(mouseX, mouseY, 441, 212);
  

  
  
  //LEFT EYE
  //odd shape
  fill(37, 29, 27);
  beginShape();
  vertex(200.19, 102.94);
  bezierVertex(153, 103, 112.9, 147.5, 113.45, 212.19);
  bezierVertex(114, 277, 159, 321.5, 200.19, 321.45);
  bezierVertex(240.22, 321.44, 301.4, 270.3, 301.93, 206.6);
  bezierVertex(302.9, 143, 228, 103, 200.19, 102.94);
  endShape(CLOSE);

  //Ring 1
  fill(45, 40, 37);
  ellipse (207, 213, 160, 160);

  //Ring 2
  fill(61, 57, 58);
  ellipse(207, 213, 145, 145);  

  //White Circle 
  fill(234, 236, 238);
  ellipse(207, 213, 133, 133);


     //LEFT INNER EYE
    //blue circle
    fill(72, 168, 222);
    ellipse(followPLx, followPLy, eyeSize1, eyeSize1);
    //Inner Black
    fill(0);
    ellipse(followPLx, followPLy, eyeSize2, eyeSize2);
    //White Trans
    fill(255, 65);
    ellipse(followPLx +20, followPLy+20, eyeSize3, eyeSize3);


  //RIGHT EYE
  //odd shape
  fill(37, 29, 27);
  beginShape();
  vertex(448.5, 107);
  bezierVertex(419.5, 106.5, 346.13, 147.14, 346.7, 210.8);
  bezierVertex(347.24, 274.5, 408.4, 325.6, 448.4, 325.6);
  bezierVertex(488.5, 325.6, 534.6, 281.1, 535.2, 216.4);
  bezierVertex(535.7, 151.6, 495.7, 107, 448.5, 107);
  endShape();


  //Ring 1
  fill(45, 40, 37);
  ellipse(444, 213, 160, 160);

  //Ring 2
  fill(61, 57, 58);
  ellipse(444, 213, 145, 145);

  //White Circle
  fill(234, 236, 238);
  ellipse(444, 213, 133, 133);

    
      //RIGHT INNER EYE
    //Blue Circle
    fill(72, 168, 222);
    ellipse(followPRx, followPRy, eyeSize1, eyeSize1);
    //Inner Black
    fill(0);
    ellipse(followPRx, followPRy, eyeSize2,eyeSize2);
    //White Trans 
    fill(255, 65);
    ellipse(followPRx+20, followPRy+20, eyeSize3, eyeSize3);
    

 

//SCARED MODE
   if (dL < radius  ||  dR < radius) {
     // big eyes
    eyeSize1 += (110 - eyeSize1) *.06;
    eyeSize2 += (70 - eyeSize2) *.04;
    eyeSize3 += (21 - eyeSize3) *.06;
     
    }else{
      //normal eyes
    eyeSize1 += (88 - eyeSize1) *.1;
    eyeSize2 += (50 - eyeSize2) *.1;
    eyeSize3 += (16.5 - eyeSize3) *.1;
    

    }




//CLOSED MODE    
     fill(61, 57, 58);
    noStroke();

    if(mousePressed) {
    //left blink
    ellipse(207, 213, 145, 145); 
    //right blink
    ellipse(444, 213, 145, 145);
    
    }
}


                
                
