
//int hatSize1 = 200;
 //int hatSize2 = 70;
 
 //int tophatSize1 = 150;
 //int tophatSize2 = 100;
 
 //int pupilSize = 10;
 //int pupilSize2 = 10;
 
 //int earringColor1 = 255;
 //int earringColor2 = 154;
 //int earringColor3 = 23;
 
 //int earringColor4 = 255;
 //int earringColor5 = 154;
 //int earringColor6 = 23;
 
 //int ringSize1 = 15;
 //int ringSize2 = 15;
 
 //boolean clicked = false;
 
 //run once
 void setup(){
   size(500,500);
   background(155,96,2);

 }
  
 // void keyPressed (){
   // clicked = ! clicked;
 // }
  
  void draw(){
    background(155,96,2);
   // if (clicked == false){
      
     // eyeSize = 20;
      //eyeSize2 = 20;
      
      //eyeColor1 = 255;
      //eyeColor2 = 255;
      //eyeColor3 = 255;
      
      //hatColor1 = 104;
     // hatColor2 = 69;
     // hatColor3 = 0;
      
     // hatSize1 = 200;
     // hatSize2 = 70;
      
     // tophatSize1 = 150;
     // tophatSize2 = 100;
      
     // pupilSize = 10;
     // pupilSize2 = 10;
      
    //  earringColor1 = 255;
     // earringColor2 = 154;
     // earringColor3 = 23;
 
    //  earringColor4 = 255;
     // earringColor5 = 154;
    //  earringColor6 = 23;
      
    //  ringSize1 = 15;
    //  ringSize2 = 15;
 // }
  
   // if (clicked == true){
    //  eyeSize = 60;
     // eyeSize2 = 10;
      
    //  eyeColor1 = 1;
    //  eyeColor2 = 135;
      //eyeColor3 = 159;
      
      //hatColor1 = 217;
     // hatColor2 = 0;
     // hatColor3 = 102;
      
     // hatSize1 = 250;
    //  hatSize2 = 120;
      
      //tophatSize1 = 200;
      //tophatSize2 = 10;
      
      //pupilSize = 35;
      //pupilSize2 = 5;
      
      //earringColor1 = 5;
      //earringColor2 = 199;
      //earringColor3 = 0;
 
     // earringColor4 = 1;
      //earringColor5 = 246;
      //earringColor6 = 255;
      
      //ringSize1 = 30;
      //ringSize2 = 5;
  //}
  
  translate(250,250);
  noStroke();
  fill(255,206,120);
  ellipse(0,0,200,300);
  
  // Right Eye
  fill(255,255,255);
  ellipse(40,-40,20,20);
  
  // Right Eye Pupil
  fill(0,0,0);
  ellipse(40,-40,10,10); 
  
  // Nose
  pushMatrix();
  translate(0,20);
  fill(255,225,173);
  triangle(0,-20,-18,18,18,18);
  popMatrix();
  
  // Left Eye
  fill(255,255,255);
  ellipse(-40,-40,20,20);
  
  // Left Eye Pupil
  fill(0,0,0);
  ellipse(-40,-40,10,10);
  
  // Mouth
  fill(255,183,173);
  arc(0, 80, 60, 50, 0, PI/1.5+QUARTER_PI, CHORD);
  
  // Right Ear
  fill(255,206,120);
  ellipse(110,-10,40,60);
  
  // Left Ear
  fill(255,206,120);
  ellipse(-110,-10,40,60);
 
  // Bottom Hat Section
  fill(104,69,0);
  rect(-100,-160,200,70,55);
  
  // Top Hat Section
  fill(104,69,0);
  rect(-75,-200,150,100,90);
  
  // Teeth
  fill(255,255,255);
  translate(-20,82);
  rect(3,3,5,5,1,6,50,18);
  
  // Right Earring
  fill(255,154,23);
  ellipse(130,-70,15,15);
  
  // Left Earring
  fill(255,154,23);
  ellipse(-90,-70,15,15);
  
  //Cheeks
  translate(-60,-55);
  fill(255,223,216);
  ellipse(140,0,40,40);
 
  //Cheeks
  translate(-120,0);
  fill(255,223,216);
  ellipse(140,0,40,40);
  
  }
