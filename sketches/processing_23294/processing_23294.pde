
int x=50;
int y=50;
int eyeSize=15;
int bodyWidth=65;
int footSize=15;

background(255);
smooth();
fill(0);
rect(x-20,y-40,40,30);//hat


//ARMS
fill(35,72,247);
quad(x-42,y+10,x-33,y,x-33,y+3,x-42,y+13);
fill(162,208,255);
ellipse(x-42,y+10,8,8);
fill(35,72,247);
quad(x+33,y,x+45,y-10,x+45,y-13,x+33,y-3);
fill(162,208,255);
ellipse(x+45,y-10,8,8);

//BODY&FACE
fill(35,72,247);
ellipse(x,y,bodyWidth,40);//body
fill(255);
ellipse(x-8,y,eyeSize,eyeSize);//eye
ellipse(x+8,y,eyeSize,eyeSize);//eye
fill(82,205,252);
ellipse(x-8,y-2,4,4);//eye dot
ellipse(x+8,y-2,4,4);//eye dot
line(x-20,y+10,x+20,y+10);//mouth
fill(248,255,193);
triangle(x-15,y+10,x-5,y+10,x-10,y+15);//tooth1
triangle(x-5,y+10,x+5,y+10,x,y+15);//tooth2
triangle(x+5,y+10,x+15,y+10,x+10,y+15);//tooth3
fill(35,72,247);
curve(x-5,y+15,x-15,y-10, x,y-10,x-10,y+15);//eyebrowL
curve(x+10,y+15,x,y-10, x+15,y-10,x+5,y+10);//eyebrowR

//LEGS
quad(x-10,y+20,x-10,y+35,x-15,y+35,x-15,y+18);
quad(x+10,y+20,x+10,y+35,x+15,y+35,x+15,y+18);
fill(0);
ellipse(x-15,y+35,footSize,footSize-5);
ellipse(x+15,y+35,footSize,footSize-5);

//FLOWER
fill(255);
stroke(4,203,29);
strokeWeight(3);
curve(x+20,y-20,x+20,y-20, x+30,y-35,x+50,y);
stroke(0);
strokeWeight(1);
fill(250,73,191);
ellipse(x+32,y-39,5,5);
ellipse(x+36,y-36,5,5);
ellipse(x+34,y-32,5,5);
ellipse(x+30,y-32,5,5);
ellipse(x+28,y-36,5,5);
fill(250,255,111);
ellipse(x+32,y-35,5,5);

//HAT2
strokeWeight(5);
line(x-25,y-18,x+25,y-18);


