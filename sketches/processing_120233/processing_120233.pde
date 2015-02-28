
float pie_w =300;
float pie_h =300;
int lastAngle=-90;
int angle0 = 60;  
int angle1 = 40;  

size(565,400);
background(232,218,194);
smooth();





stroke(0);
strokeWeight(2); 
fill(4,96,131);
ellipse(200,290,300,300);
//siro




stroke(0);
strokeWeight(2); 
fill(193,102,10);
ellipse(200,290,200,200);

stroke(0);
strokeWeight(2);
line(565,20,40,400);
//Bline1

stroke(0);
strokeWeight(2);
line(30,0,350,400);
//Bline2



noStroke();
fill(0);
ellipse(350,175,30,30);
//en1

noStroke();
fill(0);
ellipse(400,140,15,15);
//en2

noStroke();
fill(0);
ellipse(270,300,15,15);
//en3


noStroke();
fill(0);
ellipse(150,300,100,100);
//right


noStroke();
fill(255);
rect(0,0,150,400);


//siro

stroke(0);
fill(0);
quad(300,300,350,280,330,330,380,350);


//right



stroke(0);
strokeWeight(2);
line(140,150,110,200);
//Bline

stroke(0);
strokeWeight(3);
line(100,200,0,250);
//Bline

stroke(0);
strokeWeight(2);
line(0,255,120,400);
//Bline



stroke(5);
fill(157,13,34);
rect(3,3,147,147);
//red

noStroke();
fill(4,96,131);
ellipse(100,210,55,55);
//blue

stroke(5);
fill(157,13,34);
ellipse(95,205,35,35);
//red

noStroke();
fill(146,152,137);


fill(146, 152, 137);  

arc(150, 370, 180, 160, radians(lastAngle+ angle0+120), radians(lastAngle + angle0+300));
 
lastAngle += angle0;

int eSize =10;

 for(int y=0; y<=width; y+=20){
   if(y == 100 || y == 300){
    fill(255);
   }
     else{
     fill(0);  
     }
     rect(530,y,40,10);
     println("y=" + y);
   }
 noStroke();
fill(222,211,195);
rect(110,110,40,40);

 noStroke();
fill(0);
rect(150,90,20,20);

 noStroke();
fill(255);
rect(140,80,10,10);












