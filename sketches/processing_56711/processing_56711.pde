
   PImage landscape;  
   PFont font; 
   float angle = 0.0;
float offset = 80;
float scalar = 60;
float speed = 0.05;

 void setup() { 
   size(650, 420);  
  landscape = loadImage("fantasy.jpg");  
   smooth();  
}  

void draw() {  
  image(landscape,0,0);
   int x=120;  
   int y=60;
   float y1 = offset + sin(angle) * scalar;
 float y2 = offset + sin(angle + 0.5) * scalar;
 float y3 = offset + sin(angle + 1.0) * scalar;
 float y4 = offset + sin(angle + 1.5) * scalar;
 float y5 = offset + sin(angle + 2.0) * scalar;
 float y6 = offset + sin(angle + 2.5) * scalar;
 
fill(255,49,49);
 ellipse(x+142, y1, 12, 12);
 fill(93,155,84);
 ellipse(x+147, y2, 12, 12);
 fill(240,187,12);
 ellipse(x+152, y3, 12, 12);
 fill(255,115,0);
 ellipse(x+157, y4, 12, 12);
 fill(22,115,234);
 ellipse(x+162, y5, 12, 12);
 fill(225,35,124);
 ellipse(x+167, y6, 12, 12);
angle += speed;

//HEAD
fill(14,5,77);
rect(x+40,y+40,60,60);

//EYES
fill(255);
rect(x+50,y+60,15,20);
rect(x+75,y+60,15,20);
fill(0);
ellipse(x+57,y+70,10,10);
ellipse(x+82,y+70,10,10);

//MOUTH
fill(200);
rect(x+60,y+90,20,5);

//EARS
fill(255,115,0);
rect(x+30,y+65,10,15);
rect(x+100,y+65,10,15);

//NECK
fill(93,155,84);
rect(x+60,y+100,20,20);

//BODY
fill(255,49,49);
rect(x+30,y+120,80,80);

//ANTENNAE
stroke(10);
line(x+45,y+10,x+65,y+40);
line(x+95,y+10,x+75,y+40);

//TV BOX BELLY
fill(14,5,77);
rect(x+50,y+140,40,50);
fill(240,187,12);
rect(x+60,y+150,20,3);

//ARMS
fill(14,5,77);
ellipse(x+15,y+140,30,30);
ellipse(x-15,y+170,30,30);
ellipse(x+125,y+140,30,30);
ellipse(x+155,y+115,30,30);
fill(240,187,12);
rect(x-30,y+125,30,30);
rect(x-30,y+185,30,30);
rect(x+140,y+125,30,30);
rect(x+140,y+70,30,30);

//FEET
fill(93,155,84);
rect(x+30,y+200,30,40);
rect(x+80,y+200,30,40);
rect(x+30,y+270,30,30);
rect(x+80,y+270,30,30);
fill(14,5,77);
ellipse(x+44,y+255,30,30);
ellipse(x+95,y+255,30,30);
fill(255,115,0);
rect(x+20,y+300,40,20);
rect(x+80,y+300,40,20);

}







