
println("Paula Canet");
size(500,500);//determinem que width és 500 i height és 500

//color fons
background(0);

//color línea
stroke(0); 

//gruix línea
strokeWeight (2);



// fons
fill(95,22,124);       ellipse (width/2,height/2,width,height);

fill(110,31,142);      ellipse (width/2,height/2,20*width/21,20*height/21);

fill(133,68,160);      ellipse (width/2,height/2,10*width/11,10*height/11);

fill(153,103,173);     ellipse (width/2,height/2,20*width/23,20*height/23);

fill(169,127,185);     ellipse (width/2,height/2,5*width/6,5*height/6);

fill(62,49,60);        ellipse (width/2,height/2,width/2,height/2);



//ulls
fill(255);             arc(5*width/13, 5*height/14, width/5, height/5, 0, PI+QUARTER_PI, CHORD);
fill(0);               ellipse (5*width/13,2*height/5,width/22,height/10);

fill(255);            arc(8*width/13,5*height/14,width/5,height/5, -QUARTER_PI, PI,  CHORD);
fill(0);              ellipse (8*width/13,2*height/5,width/22,height/10);


//gruix linia
stroke(0);      line(width/3,20*height/37,2*width/3,20*height/37);


//llengua
fill(252,166,243);       arc (width/2,20*height/37,width/3,height/2,0,PI);


//sombra
fill(100);          ellipse(width/2,17*height/20,width/3,height/15); 


//dents
fill(236,240,155);
beginShape(TRIANGLES);
vertex(width/3, 20*height/37);
vertex(5*width/12, 20*height/37);
vertex(3*width/8,2*height/3);
vertex(2*width/3,20*height/37);
vertex(7*width/12,20*height/37);
vertex(15*width/24,2*height/3);
endShape();


//celles
strokeWeight(5); line(width/4,height/4,25*width/51,4*height/11);
strokeWeight(5); line(3*width/4,height/4,26*width/51,4*height/11);


