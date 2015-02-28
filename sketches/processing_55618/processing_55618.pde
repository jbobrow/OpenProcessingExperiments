

size(340,500);
background(170);
smooth(); 

int neckh = 250;
int eye = 5;

//Head
noStroke();
fill(185,5,40);
rect(100,100,90,90); 
strokeWeight(5);
stroke(250);
ellipse(140,150,eye+35,eye+35);
noStroke();
fill(255,215,75); 
ellipse(135,150,eye,eye);

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
line(145,190,145,neckh);
line(140,190,140,neckh);
line(150,190,150,neckh); 

//Body
fill(185,5,40);
beginShape(); 
vertex(100,neckh);
vertex(190,neckh); 
vertex(220,neckh+70);
vertex(70,neckh+70);
vertex(100,neckh);
endShape(); 
stroke(255,215,75);
strokeCap(SQUARE);
strokeWeight(5);
line(120,neckh,120,neckh+80); 
line(170,neckh,170,neckh+80); 
noStroke();
fill(255,215,75);
arc(145,neckh+80,80,80,0,radians(180)); 




