

int diameter,top,left,i;
 

size(400,400);
colorMode(RGB,200,255,100,100);
background(200,250,200,100);
noStroke();
fill(210,100,100,10);
 

diameter = 400;
top = 200;
left = 200;
 

for(i=0; i<16; i++){
    ellipse(top,left,diameter,diameter);
    diameter = diameter - 20;
}

stroke(100, 225, 100); 

strokeWeight(50); 

line(400, 0, 400, 400); 

line(0, 400, 400, 400); 

line(0, 0, 0, 400); 

line(0, 0, 400, 0); 

stroke(RGB );
strokeWeight(10);

line(400,300,300,400);
line(400,250,250,400);
line(400,200,200,400);
line(400,150,150,400);


