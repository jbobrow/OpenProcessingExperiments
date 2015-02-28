
size(350, 600);
background(243,243,243);
smooth();

//head hexagon 
fill(0);
beginShape();
vertex(80, 140);
vertex(80, 200);
vertex(120, 260);
vertex(200, 260);
vertex(240, 200);
vertex(240, 140);
vertex(80, 140);
endShape();

fill(0);
ellipse(160,140,160,160);

strokeWeight(3); //Stroke weight to 3 pixels
line(160,20,160,60);

fill(86,99,240);
strokeWeight(8); //legs
line(140,360,80,420);
line(150,360,120,460);
line(170,360,200,460);
line(180,360,220,420);



noStroke();
fill(222,222,121);
triangle(140,20,160,10,180,20);

//mouth
quad(120,220,140,240,180,240,200,220);

//eye
fill(222,121,121);
ellipse(100,180,100,100);
ellipse(220,180,100,100);

fill(222,185,121,100);
ellipse(100,180,80,80);
ellipse(220,180,80,80);

fill(128,121,222,50);
ellipse(100,180,30,30);
ellipse(220,180,30,30);

//body triangles
fill(121,222,208);
beginShape();
vertex(140,360);
vertex(120,350);
vertex(140,340);
vertex(120,330);
vertex(140,320);
vertex(120,310);
vertex(140,300);
vertex(120,290);
vertex(140,280);
vertex(120,270);
vertex(140,260);
endShape();

beginShape();
vertex(180,360);
vertex(200,350);
vertex(180,340);
vertex(200,330);
vertex(180,320);
vertex(200,310);
vertex(180,300);
vertex(200,290);
vertex(180,280);
vertex(200,270);
vertex(180,260);
endShape();

fill(121,180,22); //rectangle 
rect(140,260,40,100);

fill(222,121,215); //lines
rect(140,280,25,2);
rect(140,300,25,2);
rect(140,320,25,3);
rect(140,340,25,3);

fill(86,99,240,100); //rightlines
rect(150,270,25,1);
rect(150,290,25,2);
rect(150,310,25,3);
rect(150,330,25,4);
rect(150,350,25,5);

//leg circles
fill(222,222,121);
ellipse(80,420,20,20);
ellipse(120,460,20,20);
ellipse(200,460,20,20);
ellipse(220,420,20,20);








