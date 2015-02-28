
size(500,500);
background(5,14,100);



for (int i = 2; i < width; i += 2) {  
    stroke(250,250,250);   
    point(random(0,width),random(0,height));
}

noStroke();;
fill(50,50,50);
rect(100,200,300,300);
stroke(250,250,250);
line(100,350,400,350);
line(150, 250, 350, 250);
line(100,400,400,400);
line(150,420,350,420);
fill(235,195,110);
rect(150,420,200,100);



for (int i = 150; i < width; i += 50) {
 if (i < 400) {  
    stroke(250,250,250);   
  line(i, 250, i, 350);
}
}

for (int i = 350; i < height; i += 2) {
 if (i < 400) {  
    stroke(250,250,250);  
  line(100, i, 400, i);
}
}

for (int i = 150; i < width; i += 50) {
 if (i < 400) {  
    stroke(250,250,250);   
  line(i, 420 , i, 500);
}
}
