
size(400, 400);
smooth();  
background(255,255,255);

//NECK
strokeWeight (3);
fill (46,46,46);
triangle (200,300, 170,200, 230,200);

//ANTANNEA
strokeWeight (1);
line (200,90, 200,70);
fill (48,224,49);
quad (200,60, 205,65, 200,70, 195,65);

//HEAD
fill (100,100,100);
strokeWeight(2);
ellipse (200,150, 120,120); //main shape
strokeWeight(1);
 //mouth
 fill (255,255,255);
  rect (170,160, 10,10); //upper Teeth
  rect (180,160, 10,10); 
  rect (190,160, 10,10); 
  rect (200,160, 10,10); 
  rect (210,160, 10,10); 
  rect (220,160, 10,10); 
  rect (170,170,10,10); // lower teeth
  rect (180,170, 10,10); 
  rect (190,170, 10,10); 
  rect (200,170, 10,10); 
  rect (210,170, 10,10); 
  rect (220,170, 10,10);
  //eyes
  strokeWeight (2);
  fill (255,18,50);
  ellipse (180,130, 10,10); //left eye
  strokeWeight (3);
  fill (18,59,255);
  quad (220,110, 240,130, 220,150, 200,130); //right eye
  //ears
  strokeWeight (1);
    //left ear
    line (260,150, 270,140); 
    line (270, 140,280,150);
    line (280,150, 290,140);
    //right ear
    line (140,150, 130,140); 
    line (130,140, 120,150);
    line (120,150, 110,140);
    
//WHEELS
fill (46,46,46);
ellipse (170,370, 20,20); //left 
ellipse (230,370, 20,20); //right

fill (0,0,0);
ellipse (170,370, 5,5); //inner left 
ellipse (230,370, 5,5); //inner right

//ARMS
fill (100,100,100);
  //left arm
  beginShape (); 
  vertex (150,320);
  vertex (150,330);
  vertex (130,330);
  vertex (130,340);
  vertex (120,340);
  vertex (120,320);
  vertex (150,320);
  endShape ();
  //right arm
  beginShape (); 
  vertex (250,320);
  vertex (250,330);
  vertex (270,330);
  vertex (270,340);
  vertex (280,340);
  vertex (280,320);
  vertex (250,320);
  endShape ();  

//BODY
fill (100,100,100);
strokeWeight(2);
rect (150,300, 100,60); //main body
fill (46,46,46);
rect (180,320, 40,20); //inner rect
  //buttons
  strokeWeight(1);
  fill (48,224,49);
  ellipse (165,310, 10,10); //left top corner
  ellipse (165,350, 10,10); //left bottom corner
  ellipse (235,310, 10,10); //right top corner
  ellipse (235,350, 10,10); //right bottom corner
  
  fill (18,59,255);
  quad (200,305, 205,310, 200,315, 195, 310); //top
  quad (200,345, 205,350, 200,355, 195, 350); //bottom

