
/*--------------------------------------------

"Robot Friend"
Simple programming sketch creating a drawing of a robot to practice creating basic shapes and fills.

Created January 22, 2015
By Megan Cattey
megancattey@gmail.com

Created for Art 3001 - Programming for Artists
BFA in Art and Technology
The Ohio State University
http://www.openprocessing.org/classroom/4626

Modified January 26, 2015
By Megan Cattey
http://www.openprocessing.org/sketch/182880

---------------------------------------------*/

background(255,178,102);  //bg color
size(510,700); //sets canvas size

//smoothes edges (antialiasing)
smooth();

//declaring variables
int a,b,x;

//assigning variables integers
a = 25;
b=100;
x=250;   //middle x coord for torso, etc.

//light blue color fill
fill(104,219,228);
//head
quad(x-60,90,x+60,90,x+35,180,x-35,180);
//torso
quad(x-95,200,x+95,200,x+55,365,x-55,365);
//hips
quad(x-55,385,x+55,385,x+80,475,x-80,475);

//darkest teal color fill
fill(5,106,110);
//left eye
rect(215,b,a,a);
//right eye
rect(260,b,a,a);
//dark teal color fill
fill(22,138,146);
//neck
rect(237.5,180,a,a-5);
//rump
arc(250,475,150,120,0,PI);
//waist
rect(215,365,b-30,a-5);
line(x-80,475,x+80,475);


//mouth begin from left to right
line(225,160,235,160);
line(235,160,240,150);
line(240,150,245,170);
line(245,170,250,150);
line(250,152,255,170);
line(255,170,260,150);
line(260,150,265,160);
line(265,160,275,160);
//mouth end

//left shoulder
ellipse(145,215,a,a);
//right shoulder
ellipse(355,215,a,a);
//left elbow
ellipse(76,375,20,20);
//right elbow
ellipse(396,379.5,20,20);

//teal color fill
fill(104,219,228); 
//left upper arm
quad(127,220,147,230,90,370,70,360);
//right upper arm
quad(348,229,368,225,400,367,380,372);
//left lower arm
triangle(70,390,90,381,150,535);
//right lower arm
triangle(396,365,414,379,500,215);
