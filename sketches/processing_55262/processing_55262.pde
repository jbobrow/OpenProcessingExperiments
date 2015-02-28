
size(720, 480); 
smooth(); 
strokeWeight(2); 
background(204); 
ellipseMode(RADIUS); 

//HEAD

  //side of head
    fill(0); //fill black
    ellipse (300,140, 30, 30); //left hand side
    ellipse (450, 140, 30, 30);//right hand side
 
  // top of head
  fill (14, 5, 77); // fills blue
  ellipse (375, 110, 55, 55);
    //third eye
    fill (255); //fills white
    ellipse (375, 90, 15, 15);
    fill (0); //fills black
    ellipse (375, 90, 5, 5);
 
  //main rectangle/face/ neck
  fill(255, 49, 49); //fills red
  rect(300, 110,150, 60);//face
  fill (0); //fills black
  ellipse (330, 140, 10, 10); //left eye
  fill (0); //fills black
  ellipse (420, 140, 10, 10); //right eye
  fill (93, 155, 84); //fills green
  rect (340, 160, 70, 10); //mouth
  //neck
  noFill();
  rect(360, 170, 30, 30);
  
  //antennae
  fill (255, 115, 0); //fills orange
  ellipse (220, 140, 5, 5); //bauble at end, left
  ellipse (535, 140, 5, 5); //bauble at end right
  ellipse (375, 10, 5, 5); //bauble top
  line (375, 15, 375, 55); //antenna top
  line (225, 140, 270, 140); //antenna left
  line (480, 140, 530, 140); //antenna right

//BODY
  //main torso
  fill (240, 187, 12); //fills mustard yellow
  beginShape ();
    vertex (320, 200);
    vertex (430, 200);
    vertex (480, 340);
    vertex (270,340);
  endShape (CLOSE);
  
  //buttons
  fill (255); //fill white
  rect(320, 270, 25, 25); //left button
  fill (0); //fills black
  ellipse(330, 280, 5, 5);
  fill (255); //fill white
  rect (360, 270, 25, 25); //middle button
  fill (0); //fills black
  ellipse(375, 280, 5, 5);
  fill (255); //fill white
  rect (410, 270, 25, 25); //right button
  fill (0); //fills black
  ellipse(420, 280, 5, 5);
  rect (320, 240, 110, 10); //main switch
  
//LEG/WHEEL

  rect(370, 340, 10, 50); //leg
  fill(0); //fill black
  ellipse (375, 420, 35, 35); //outer wheel
  fill (93, 155, 84); //fills green
  ellipse (375, 420, 25, 25); // inner wheel
  //line (); // wheel detail
  //line (); //lower wheel detail

