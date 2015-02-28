
float speed = 0.0;
float easing = 0.5;
float angle;
boolean color_switch = false;
boolean shake_hand = false;

void setup(){
  size(480, 320); 
  smooth(); 
  background(200); 
}

void draw(){
  background(200);

  //explosion
  if (mousePressed==true)
  {
    if ((mouseX >258) && (mouseX < 285) && (mouseY>186) && (mouseY<200))
    {
      shake_hand = true;
    }
    if(!shake_hand)
    {
      noStroke(); 
      for(int d = 24; d>0; d-=1)
      {
        if(color_switch){
          color_switch = false;
          fill(249,8,31);
        }
        else{
          color_switch = true;
          fill(243,249,6);
        }
//Michael Stratford helped create the repeating star
        smooth();

        beginShape();
        vertex(mouseX+cos(.94)*d*30.7,mouseY-sin(.94)*d*30.7);
        vertex(mouseX+cos(.25)*d*100,mouseY-sin(.25)*d*100);
        vertex(mouseX+cos(.31)*d*30.7,mouseY+sin(.31)*d*30.7);
        vertex(mouseX+cos(.96)*d*100,mouseY+sin(.96)*d*100);
        vertex(mouseX,mouseY+d*30.7);
        vertex(mouseX-cos(.96)*d*100,mouseY+sin(.96)*d*100);
        vertex(mouseX-cos(.31)*d*30.7,mouseY+sin(.31)*d*30.7);
        vertex(mouseX-cos(.25)*d*100,mouseY-sin(.25)*d*100);
        vertex(mouseX-cos(.94)*d*30.7,mouseY-sin(.94)*d*30.7);
        vertex(mouseX,mouseY-d*100);
        vertex(mouseX+cos(.94)*d*30.7,mouseY-sin(.94)*d*30.7);
        //xcenter = 40
        //ycenter = 42
        endShape();
      }
    }
  }
  else{
    shake_hand = false;
  }




  //BODY PARTS
  strokeWeight(1);
  //Left foot 
  fill(248, 149, 29); 
  stroke(248,149,29); 
  quad(175, 275, 165, 260, 90, 310, 150, 310); 

  //Right foot 
  fill(248, 149, 29); 
  stroke(248,149,29); 
  quad(175, 275, 185, 260, 260, 310, 200, 310); 

  //Left Arm

  strokeWeight(10);
  line(110,178,96,200);
  line(98,200,70,174);
  //Left Arm 
  fill(145,53,148); 
  stroke(145,53,148);
  strokeWeight(10);
  line(110,178,96,200);
  line(98,200,70,174); 


  strokeWeight(10);
  line(235,178,260,198);
  if(shake_hand)
  {
    angle = atan2(mouseY-198,mouseX-258);
    line(258,198,258+cos(angle)*24,198+sin(angle)*24);
  }
  else{
    line(258,198,282,200);
  }

  //body 
  fill(155,79,159); 
  stroke(155,79,159); 
  ellipse(175,175,138,200); 

  //handshake
  strokeWeight(1);


  //SMILE INTERACTION
  //mouth 
  fill(0); 
  if ((mouseX > 135) && (mouseX < 202) && (mouseY>52) && (mouseY<93)) {
    bezier(142,200,142,220,176,217,176,200);

  } 
  else {
    //smile
    bezier(135,225,146,240, 173,237, 180,225);
  }




  //Stroke and Fill for Eyes 

  noStroke(); 


  fill(255);

  //Rotate Left Eye 
  translate(146, 160); 
  rotate(-PI/8); 
  ellipse(0,0,35,50); 

  //Undo Rotation 
  rotate(PI/8); 
  translate(-146,-160); 

  //Rotate Right Eye 
  translate(173,159); 
  rotate(PI/16); 
  ellipse(0,0,35,50); 

  //Undo Rotation 
  rotate(-PI/16); 
  translate(-173,-159); 

  //Left Pupil
  fill(0);
  ellipse(151,172, 15, 15); 

  //Right Pupil 
  ellipse(167,171,15,15); 

  //hair 
  fill(112,191,68); 
  stroke(112,191,68); 
  beginShape(TRIANGLE_FAN); 
  vertex(163,93); 
  vertex(135,50); 
  vertex(168,70); 
  vertex(177,52); 
  vertex(183,85); 
  vertex(202,55); 
  vertex(187,93); 
  endShape(); 
  noStroke();

  //EYES FOR SMILE INTERACTION
  if ((mouseX > 135) && (mouseX < 202) && (mouseY>52) && (mouseY<93)) {
    fill(255);
    //Rotate Left Eye 
    translate(146, 160); 
    rotate(-PI/8); 
    ellipse(0,0,35,50); 

    //Undo Rotation 
    rotate(PI/8); 
    translate(-146,-160); 

    //Rotate Right Eye 
    translate(173,159); 
    rotate(PI/16); 
    ellipse(0,0,35,50); 

    //Undo Rotation 
    rotate(-PI/16); 
    translate(-173,-159);  
    fill(0);
    ellipse(146,165, 15, 15);
    ellipse(173,165,15,15); 

  } 
  else {
    //smile
    fill(0);
    ellipse(151,172, 15, 15);
    ellipse(167,171,15,15); 
  }
  //BLINK

  if(mousePressed == true && !(shake_hand) && !((mouseX >258) && (mouseX < 285) && (mouseY>186) && (mouseY<200)))  
  { 

    fill(113,32,130); 

    //Rotate Left Eye  
    translate(146, 160);  
    rotate(-PI/8);  
    ellipse(0,0,36,51);  

    //Undo Rotation  
    rotate(PI/8);  
    translate(-146,-160);  

    //Rotate Right Eye  
    translate(173,159);  
    rotate(PI/16);  
    ellipse(0,0,36,51);  

    //Undo Rotation  
    rotate(-PI/16);  
    translate(-173,-159);
  }

  // BLUSHING
  float target = dist(mouseX, mouseY, pmouseX, pmouseY);
  speed += (target - speed) * easing;
  fill(237,119,173,speed);
  ellipse(123,200,20,30);
  ellipse(193,200,20,30);

}


