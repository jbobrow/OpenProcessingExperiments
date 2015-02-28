
size(200,200);
smooth();
stroke(#bbbbbb);
fill(#EDE0C4); //brown body fill

beginShape(); //snout
  vertex(60,60); //under chin
  vertex(40,70);
  vertex(16,72);
  vertex(10,68);
  vertex(9,58);
  vertex(14,54);
  vertex(46,26);
  vertex(70,18); //tangent to ear
  vertex(78,20); //tangent to ear
  
  vertex(116,80); //back
  vertex(134,96);
  vertex(164,140); //matches start of tail
  vertex(164,180);
  
  vertex(140,190); //rump
  vertex(90,150);
  vertex(80,110);
  vertex(70,76);
endShape(CLOSE);

noStroke(); //nose has no stroke
fill(0,0,0,180); //black nose, slightly transparent

ellipse(11,60,9,9); //nose

fill(#F2EDD9); //lighter-brown tail
stroke(#bbbbbb); //return stroke

beginShape(); //tail
  vertex(164,140); //matches back
  vertex(182,110);
  vertex(180,70);
  vertex(184,68);
  vertex(188,108);
  vertex(164,180);
 endShape();
 
fill(#493418); //set ear to a brown fill
noStroke();

ellipse(70,32,28,28); //ear top

beginShape(); //ear bottom
  vertex(56,32);
  vertex(64,76);
  vertex(76,76);
  vertex(84,32);
 endShape();
 
fill(#EDE0C4); //set body back to a light-brown fill
stroke(#aaaaaa); //return stroke, a bit darker (foreground elements)
 
beginShape(); //front leg
   vertex(82,100);
   vertex(82,191);
   vertex(92,191);
   vertex(92,124);
endShape();

ellipse(140,160,62,62); //rump

beginShape(); //back leg
   vertex(140,191);
   vertex(102,191);
   vertex(102,181);
   vertex(130,181);
endShape();


