
  size(300, 400);
  background(136,157,196,90);
  smooth();
  
fill(206,237,105);  
  ellipse(70,180,50,50);
fill(229,90,127);  
  ellipse(70,180,27,27);
  
line(15,200,265,30);
line(15,210,267,33);
line(19,218,268,38);
line(25,224,269,42);
line(30,235,270,46);
//links nach rechts
line(35,201,290,280);
line(33,211,287,285);
line(19,217,288,290);
//unten nach oben
line(70,330,215,130);
line(95,353,205,120);
line(125,345,195,118);
//kurze Linien
line(125,110,150,145);
line(120,115,145,150);
line(118,117,143,152);


//rechtecke unten
fill(87,175,90);
rect(50,359,7,17);
fill(198,72,97);
rect(36,359,7,17);
fill(49,33,203);
rect(62,359,4,17);
fill(216,207,22);
rect(80,359,2,17);
rect(85,359,2,17);
rect(90,359,3,17);
fill(198,72,97);
rect(100,359,7,17);
fill(0,0,0);
rect(115,359,9,17);

//mitte
beginShape();
fill(49,33,203);
vertex(160, 359);
vertex(180, 359);
vertex(175, 135);
vertex(167,130 );
endShape(CLOSE);


//rechtes Zeichen
fill(0,0,0);
quad(256,270,250,270,250,210,256,210);
fill(198,72,97);

quad(268,270,238,270,238,277,268,277);

strokeWeight(1);
line(266,220,240,220);
line(266,222,240,222);
line(269,226,237,226);


//halbmond
fill(255,178,33);
noStroke();
beginShape();
vertex(264, 128);
bezierVertex( 264, 171, 184, 170, 184, 129);
bezierVertex( 168, 179, 270, 197, 264, 128);
endShape();
 

//kreise 
noStroke();                     
strokeWeight(1);
fill(221, 137, 21,170);
ellipse(147, 93, 38, 38);
 
noStroke();                   
fill(249, 233, 0, 180);
ellipse(180, 90, 60, 60);

noStroke();                   
fill(0,0,0);
ellipse(180, 90, 10, 10);

stroke(14, 46, 5);                     
strokeWeight(3);
fill(87,175,90,170);
ellipse(174, 56, 36, 36);

noStroke();                   
fill(255,178,33,90);
ellipse(120, 50, 55, 55);

beginShape(TRIANGLES);
noStroke();
fill(229,90,127);
vertex(30, 75);
vertex(40, 20);
vertex(50, 75);
vertex(60, 20);
vertex(70, 100);
vertex(80, 20);
endShape();


