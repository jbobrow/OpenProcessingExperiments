
size(500, 500);
background(255, 0, 0); //red rect top right

fill(0, 0, 255); //blue rect bottom left
rect(0, 350, 150, 150); 

noStroke();
fill(#FDF8F2); 
rect(0, 0, 150, 350); //left white rect
rect(150, 350, 350, 150); //left white rect
fill(255, 255, 0);
rect(430, 425, 75, 75);

stroke(0);
strokeWeight(10);
line(150, 0, 150, 500); //left long vertical
line(0, 350, 500, 350); //bottom long horizontal
line(430, 350, 430, 500);//bottom right short vertical

strokeWeight(15);
line(0, 130, 145, 130);
line(432, 425, 500, 425); //bottom right short horizontal


