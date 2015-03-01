
size(600,600); 
background(49,104,111); 
noStroke(); 
fill(64,162,157); 
ellipse(170,140,200,200); 
fill(188,167,62); 
ellipse(170,140,180,180); 
fill(0); 
ellipse(170,140,7,7); 


stroke(0); 
strokeWeight(4); 
for(int i =40; i<170;i+=8){ 
  for(int j =40; j<i; j+=8){ 
    point(i,j); 
  } 
} 
for(int h =140; h<300; h+=8){ 
  for(int k =170; k<h; k+=8){ 
    point(k,h-30); 
  } 
} 


stroke(255); 
strokeWeight(0.5); 
fill(124,57,15); 
triangle(355,80,380,55,330,20); 
strokeWeight(0.8); 
fill(49,104,111); 
triangle(126,299,153,254,118,278); 

strokeWeight(0.5); 
fill(123,62,119); 
triangle(105,250,70,330,140,330); 
fill(182,142,93); 
triangle(105,250,95,270,120,280); 

fill(131,56,54); 
triangle(227,357,176,450,262,450); 
fill(51,54,125); 
triangle(227,357,246,408,209,392); 
fill(80,84,83); 
triangle(219,362,216,331,240,346); 
fill(49,104,111); 
triangle(223,354,216,337,235,345); 

strokeWeight(0.5); 
fill(142,88,24); 
triangle(465,153,491,159,484,116); 
fill(60,50,123); 
triangle(420,250,511,281,476,159); 
fill(49,104,111); 
triangle(426,248,475,166,501,268); 


strokeWeight(1.2); 
stroke(255); 
fill(100,10,9); 
rect(320,80,75,100); 
fill(79,25,49); 
rect(330,80,10,100); 
rect(350,80,10,100); 
fill(117,78,97); 
rect(370,80,10,100); 

stroke(255); 
fill(43,58,27); 
rect(235,410,10,90);
fill(105,75,111); 
rect(245,410,10,90);
fill(16,29,37); 
rect(255,410,13,90);
fill(75,32,78); 
rect(268,410,14,90);
fill(170,107,74); 
rect(282,410,15,90);
fill(75,48,85); 
rect(297,410,14,90);

strokeWeight(0.7); 
stroke(255); 
fill(152,96,69); 
rect(115,300,70,90);
fill(85,26,44); 
rect(115,300,10,90);
fill(85,26,44); 
rect(135,300,10,90);
fill(51,34,50); 
rect(155,300,10,90);
fill(109,77,101); 
rect(175,300,10,90);

strokeWeight(1); 
stroke(255); 
fill(16,29,37); 
rect(450,230,10,80);
fill(109,71,96); 
rect(460,230,12,80);
fill(16,29,37); 
rect(472,230,10,80);
fill(109,71,96); 
rect(482,230,10,80);
fill(127,110,82); 
rect(492,230,10,80);
fill(16,29,37); 
rect(502,230,10,80);

strokeWeight(1); 
fill(49,104,111); 
bezier(250,410,270,300,370,265,450,310); 
bezier(250,410,270,340,390,290,450,310); 

strokeWeight(0.5); 
fill(60,50,123); 
ellipse(420,200,40,40); 
noStroke(); 
fill(66,25,70); 
ellipse(330,380,3,100); 
ellipse(375,380,5,130); 
ellipse(415,360,3,100); 
ellipse(330,445,3,8);  
ellipse(375,460,3,10); 
ellipse(415,430,3,8); 
stroke(0); 
ellipse(95,490,80,80); 
fill(117,78,97); 
ellipse(95,490,70,70); 


noFill(); 
stroke(255); 
strokeWeight(0.5); 
beginShape(); 
vertex(330,330); 
vertex(370,380); 
vertex(330,430); 
endShape(); 

beginShape(); 
vertex(375,315); 
vertex(413,360); 
vertex(380,405); 
endShape(); 
  
line(330,380,370,380); 
line(378,360,413,360); 
line(416,357,450,310); 

strokeWeight(3); 
line(380,530,550,370); 
strokeWeight(2); 
stroke(0); 
line(372,507,565,390); 
strokeWeight(1); 
line(366,492,563,379); 
 


