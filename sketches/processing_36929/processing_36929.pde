
size(300,400);
background(202,200,193);

//big blue circle
noStroke();
fill(30,50,200);
smooth();
ellipse(100,200,300,300);

//white triangle
fill(255);
triangle(300,150,120,250,300,340);

//9
fill(200,0,0);
rect(170,40,50,30);//top horizontal 
rect(220,40,30,70);//right vertical
rect(170,40,30,60);//left vertical
rect(170,80,70,30);//bottom horizontal
rect(170,120,40,30);
quad(210,110,185,150,225,150,250,110);

//overlapping black and white
stroke(255);
strokeWeight(13);
line(0,240,300,375);
stroke(0);
strokeWeight(10);
line(0,240,300,375);

//rotated black rectangles
fill(0);
stroke(100);
strokeWeight(1);
rotate(.33);
rect(200,100,10,300);

stroke(100);
rect(100,120,10,340);
rect(130,100,7,230);
rect(80,80,12,300);
rect(140,70,10,200);
rect(160,80,10,210);
rect(180,100,8,260);

noStroke();
rotate(radians(-85));
rect(-190,30,30,500);




