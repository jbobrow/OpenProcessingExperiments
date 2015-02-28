
size(450,625); 
smooth(); 

//
fill(#ae2501); 
ellipse(90,100,150,150); 

//
fill(#7b1c0c); 
quad(186,377,221,377,152,565,122,565);
//
quad(280,584,401,518,401,546,293,604);
//
fill(#e8b009); 
quad(25,260,351,229,352,254,29,290); 
quad(157,399,179,399,103,625,81,625);
quad(340,586,437,537,437,558,340,604); 
//
fill(#d2d1d7); 
quad(233,392,282,392,233,539,179,539);
//
fill(#131b8f); 
beginShape(); //formas complejas 
vertex(201, 113); 
vertex(181, 118); 
vertex(180, 109); 
vertex(199, 103); 
vertex(196, 84); 
vertex(206, 82); 
vertex(209, 100); 
vertex(230, 94); 
vertex(233, 102); 
vertex(211, 110); 
vertex(290, 549); 
vertex(279, 556); 
endShape(CLOSE); 

//
pushMatrix(); //reservado 
translate(244,98); 
rotate(PI/5.8);  
fill(#100e25); 
rect(0,0,146,140); 
popMatrix(); 


