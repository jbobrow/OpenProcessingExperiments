
int x=260; //x coord
int y=170; //y coord
int bodyH=120; //bodyHeight
int neckH=130; //neckheight
int radius=20; //head radius
int z=260; //antennae
int w=150;
int q=400;
int bodyW=197; //body width
int eyeH=10; //eyeHeight

size(500,500);
smooth();
strokeWeight(4);
ellipseMode(RADIUS);

//Neck
stroke(100);
fill(100,23,250,136);
rect(x,y-bodyH,30,230);
//Antennae
strokeWeight(9);
line(z,w,q,130);
line(z,w,q*.2,80);
//Body
noStroke();
fill(102);
ellipse(x+20, 380, 46, 46);
fill(0, 122, 135,135);
rect(y, 257, bodyW, 120);
fill(102,89,123,200);
rect(y, 280, bodyW, 10);
//Head
fill(200,89,89); //Teal colour
ellipse (288,150,90,20);
fill (166,152,124);                 
ellipse(288, 150, 15, 15);  
fill(0,200,123);
ellipse(288, 150, 3, 3);
fill(160,256,15);
rect(260, 148, eyeH,eyeH);
rect(220, 140, eyeH+2,eyeH+2);
rect(338, 140, eyeH+7, eyeH+7);



