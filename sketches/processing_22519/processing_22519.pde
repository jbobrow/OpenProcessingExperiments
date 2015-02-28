
size(300, 300);
smooth();

//legs
line(width/2-5, height/2, width/2-5, height-5);
line(width/2+5, height/2, width/2+5, height-5);

//wing
quad(width/2+10 -40, height/2-10, 
     width*3/4+5 -40, height/2-20,
     width*3/4 -40, height/2-55,
     width/2+40 -40, height/4);

//tail
triangle(width/2+50, height/2+50,
         width/2+90, height/2+70,
         width/2+95, height/2+55);
triangle(width/2+40, height/2+40,
         width/2+60, height/2+70,
         width/2+75, height/2+40);
triangle(width/2+30, height/2+30,
         width/2+40, height/2+60,
         width/2+60, height/2+35);

ellipse(width/2, height/2, 100, 100); //body
ellipse(width/2-30, height/2-30, 70, 70); //head

//eyes
ellipse(width/2-62, height/2-30, 10, 15); 
ellipse(width/2+2, height/2-30, 10, 15); 

noFill();
arc(width/2-30, height/2+20, 20, 50, PI/2, TWO_PI-PI/2); //mouth

//wing
fill(255);
quad(width/2+10, height/2-10, 
     width*3/4+5, height/2-20,
     width*3/4, height/2-55,
     width/2+40, height/4);

//feet
triangle(width/2+5 -10, height-5, 
         width/2-15 -10, height-5, 
         width/2 -10, height-15);
triangle(width/2+5, height-5, 
         width/2-15, height-5, 
         width/2, height-15);


