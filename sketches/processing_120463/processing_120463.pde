
int eSize = 3;
size(400,565);
background(238,238,201);


stroke(0);               //random ten
for (int i = 0; i < 1000; i++)
{
  if(i % 3 == 0){
  point(random(width), random(height));
 }
}
 


stroke(0);             //akamaru
fill(255,62,47);
arc(170, 160, 150, 150, 2, PI *1.5 );


stroke(0);              //akamaru tatesen
strokeWeight(1);    
line(170, 0, 170, 160);


stroke(0);              //akamaru naname
strokeWeight(1);    
line(170, 160, 138, 227); 


stroke(0);              //akamaru R naname
strokeWeight(1);    
line(170, 83, 400, 400); 

stroke(0);              //akamaru / naname
strokeWeight(1);    
line(138,227,0,400); 



stroke(0);             //sikaku
fill(182,187,194);
quad(260, 208, 340, 318, 280, 510, 190, 387);


stroke(0);              //sikaku sita \sen
strokeWeight(1);    
line(0, 127, 280, 510);



stroke(0);              //sankaku / sen
strokeWeight(1);    
line(340, 0, 120, 565);


stroke(0);               //sankaku
fill(55,55,55);
triangle(340, 318, 400, 400, 279, 510);


stroke(0);              //sankaku / sen
strokeWeight(1);    
line(400, 400, 220, 565);


strokeWeight(1);         //kimaru
fill(255,246,163);
ellipse(101, 400, 155, 155);


stroke(0);             //yoko tyouhoukei
fill(253,212,212);
quad(170, 38, 270, 180, 260, 210, 170, 84);


stroke(0);             //yoko tyouhoukei
fill(253,212,212);
quad(170, 38, 270, 0, 339, 0, 170, 84);



