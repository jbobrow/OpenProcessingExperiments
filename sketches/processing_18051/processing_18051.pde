
size(250,250);
background(172,245,158);
smooth();
noStroke();

fill(0,0,0,20);
ellipse(200,255,140,140);

fill(0,0,0,20);
ellipse(95,170,90,90);

fill(0,0,0,20);
ellipse(160,130,20,20);

fill(0,0,0,20);
ellipse(120,0,50,50);

fill(0,0,0,20);
ellipse(140,75,50,50);

fill(0,0,0,20);
ellipse(120,50,35,35);

fill(0,0,0,25);
ellipse(100,250,180,180);

noFill();
stroke(0,118,116,70);
//dark green lines
strokeWeight(2);
for(int y=20; y<=250; y+=60){
for(int x=10; x<=250; x+=40){
bezier(130,0,210,y,100,20,x,250);
}
}
strokeWeight(4);
stroke(250,250,250,20);
//deformed rectangle background
for(int y=20; y<=250; y+=60){
for(int x=20; x<=250; x+=30){
rect(x, 0, 0, 100);
}
}

strokeWeight(4);
stroke(250,250,250,40);
//deformed rectangle background
for(int y=20; y<=250; y+=60){
for(int x=20; x<=250; x+=30){
rect(x, 50, 0, 100);
}
}
strokeWeight(4);
stroke(250,250,250,90);
//deformed rectangle background
for(int y=20; y<=250; y+=60){
for(int x=20; x<=250; x+=30){
rect(x, 100, 0, 100);
}
}
strokeWeight(4);
stroke(250,250,250,250);
//deformed rectangle background
for(int y=20; y<=250; y+=60){
for(int x=20; x<=250; x+=30){
rect(x, 150, 0, 100);
}
}
stroke(103,196,189,100);
//green blue lines
strokeWeight(2);
for(int y=20; y<=250; y+=30){
for(int x=10; x<=250; x+=30){
bezier(x,250,120,100,10,y,130,0);
}
}






