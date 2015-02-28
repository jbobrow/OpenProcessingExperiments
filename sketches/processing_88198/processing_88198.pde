
size (400, 400) ; 


//background
strokeWeight (0); fill (49, 79, 79) ; ellipse (200, 200, 600, 600) ;
fill (85, 107, 47) ; ellipse (200, 200, 500, 500) ;

//decoration
 fill (240, 255, 240) ; strokeWeight (20); 
beginShape();
    vertex(100, 45);
    vertex(80, 200);
    vertex (125, 100);
    vertex (140, 135);
    vertex (190, 40);
    vertex (210, 190);
    endShape(CLOSE);

//body
fill(190, 190, 190);
  beginShape();
    vertex(15,400);
    vertex(55,240);
    vertex(105,200);
    vertex(265,265);
    vertex(305,400);
    endShape(CLOSE);
    
    
strokeWeight (1); 

fill (255, 235, 205) ; ellipse (150, 150, 190, 240) ; //face
fill (255, 255, 240) ; ellipse (105, 135, 50, 5) ; //eyewhite
fill (255, 255, 240) ; ellipse (200, 135, 50, 5) ; //eyewhite
fill (139, 69, 19) ; ellipse (115, 135, 5, 5) ; // pupil
fill (139, 69, 19) ; ellipse (210, 135, 5, 5) ; // pupil 

line (170, 150, 175, 200) ;
line (175, 200, 140, 185) ; 
line (140, 225, 190, 225) ; 
line (100, 48, 80, 200) ; line (80, 200, 120, 90) ; line (120, 90, 125, 140) ; line (125, 140, 190, 40) ; 

//eyebrows
strokeWeight(9);line (75, 115, 135, 115) ; line (175, 115, 225, 115) ;

    







