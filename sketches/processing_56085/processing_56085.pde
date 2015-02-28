
int x= 150; //Head and Neck
int y= 200; //Head and Neck
int d= 40; //Diameter of Eye

size(400, 400);
smooth();  
background(255,255,255);

//NECK
strokeWeight (3);
fill (46,46,46);
triangle (200,300, x-30,y+50, x+30, y+50);

//ANTANNEA
strokeWeight (1);
line (x,y-60,x,y-80);
fill (48,224,49);
quad (x,y-90, x+5,y-85, x,y-80, x-5,y-85);

//HEAD
fill (100,100,100);
strokeWeight(2);
ellipse (x,y, 120,120); //main shape
strokeWeight(1);
 //mouth
 fill (255,255,255);
 for (int i= 170; i<225; i+=10) { //upper teeth
 rect (x-i+190, y+10, 10, 10);
 }
 
  for (int i= 170; i<225; i+=10) { //lower teeth
 rect (x-i+190, y+20, 10, 10);
 }
 

  //eyes
  strokeWeight (2);
  fill (255,18,50);
  ellipse (x-20,y-20,d,d); //left eye
  strokeWeight (3);
  fill (18,59,255);
  quad (x+20,y-40, x+40,y-20, x+20,y, x,y-20); //right eye
  //ears
  strokeWeight (1);
    //left ear
    line (x+60,y, x+70,y-10); 
    line (x+70, y-10,x+80,y);
    line (x+80,y, x+90,y-10);
    //right ear
    line (x-60,y, x-70,y-10); 
    line (x-70,y-10, x-80,y);
    line (x-80,y, x-90,y-10);
    
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

