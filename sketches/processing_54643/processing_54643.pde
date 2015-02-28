

size(340,400);
background(170);
smooth(); 

//Head
noStroke();
fill(185,5,40);
rect(100,100,90,90); 
strokeWeight(5);
stroke(250);
ellipse(140,150,50,50);
noStroke();
fill(255,215,75); 
ellipse(135,150,13,13);

//Anteannae
stroke(185,5,40);
strokeWeight(2);
line(170,100,200,55);
line(190,150,225,152);
line(80,150,100,140);
ellipse(200,55,10,10); 
ellipse(225,152,5,5); 
ellipse(80,150,3,3); 

//Neck
strokeWeight(3); 
line(145,190,145,210);
line(140,190,140,210);
line(150,190,150,210); 

//Body
fill(185,5,40);
beginShape(); 
vertex(100,210);
vertex(190,210); 
vertex(220,280);
vertex(70,280);
vertex(100,210);
endShape(); 
stroke(255,215,75);
strokeCap(SQUARE);
strokeWeight(5);
line(120,210,120,290); 
line(170,210,170,290); 
noStroke();
fill(255,215,75);
arc(145,290,80,80,0,radians(180)); 




