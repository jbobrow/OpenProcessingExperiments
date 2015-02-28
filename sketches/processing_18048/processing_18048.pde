
size(250, 250);
smooth();
noStroke();
rotate(0.05);
background(#500112);

//circle background
for(int y=0; y<=500; y+=30){ 
for (int x=0; x<=500; x+=30){ 
fill(0, 60); 
ellipse(x,y,40,40);}} 
//

//weird pattern made by accident
translate(0, 50);
for(int y=0; y<=500; y+=20){ 
for (int x=0; x<=500; x+=20){ 
fill(#E39423, 90); 
rect(x,y, 10, y-x,20,20);}} 

//squares
translate(0, -50);
rectMode(CENTER);
translate(80, -110);
rotate(.72);

fill(#BF9D3E, 70);
rect(200, 50, 60, 60);

fill(#E39423, 50);
rect(200, 50, 40, 40);

fill(#BF9D3E, 70);
rect(150, 100, 40, 40);

fill(#E39423, 50);
rect(151, 99, 20, 20);

fill(#E39423, 90);
rect(190, 280, 60, 60);
//


