
/* @pjs preload="Eddie.jpg"; */

PImage myimage;

void setup()

{
 size (400, 700);

myimage = loadImage ("Eddie.jpg");

}

void draw()
{
  //Initial Image of Friend
  
  image(myimage, 0,0,width, height); 
  filter(INVERT);
  

line(200,0,200,700);
line(0,350,400,350);

//backdrop
noStroke();
fill(59,2,0);
quad(0,350,  50,350, 90,450, 0,505);
quad(200,0, 400,0,  400,350,  200, 350);


//ORDER

//left side of face
fill(137, 102, 90);


quad(200,170, 350,140, 365,250, 200,250);


fill(111, 99, 95);
quad( 250, 250, 340, 240,  350, 300, 250, 300);

fill(93,69,61);
quad( 250, 250, 330, 240, 300, 300, 250, 300);

fill(152, 114, 97);
quad(200,210, 290,210, 260,260, 200,270);
quad(200,270, 220,266, 220,350, 200,350);
quad(220,266, 260,260, 275,285, 220,350);
fill(173, 133, 115);
quad(263,300, 320,300, 310,320, 241,325);
quad(320,300, 353,325, 335,350, 310,320);
quad(241,324, 310,320, 335,350, 220,350);

//right side of face


fill(137, 102, 85);
quad(310,210, 350,230, 355,250, 330,260);
quad(330,260, 355,250, 360,280, 328,275);
fill(152, 114, 97);
quad(328,275, 360,280, 355,295, 323,290);
fill(173, 133, 115);
quad(323,290, 355,295, 353,325, 320,300);
triangle(353,325, 350,350, 335,350);


//nose
fill(137, 102, 85);
triangle(290,200, 295,250, 260,260);
fill(173, 133, 115);
quad(290,200, 310,210, 320,245, 295,250);
fill(137, 102, 85);
quad(260,260, 295,250, 300,270, 275,285);
fill(152, 114, 97);
quad(295,250, 320,245, 310,285, 300,270);
fill(137, 102, 85);
triangle(320,245, 330,260, 310,285);
triangle(310,210, 320,245, 330,260);


//eyes

fill(0);
 
ellipse( 230, 200, 12,12);
ellipse( 330, 210, 10, 10);
//lips 
triangle( 250,340,  330, 320, 315, 330);
triangle( 250,340,  315, 330, 320, 350);




//hair
noStroke();
fill(70);
quad(200,40,  255,45,  240,165, 200,180);
quad(255,45,  285,55,  280,170, 235,180);
quad(285,55,  320,70,  300,160, 280,170);
quad(320,70,  360,120,  350,190, 295,180);
quad(360,120, 390,210, 360,280, 350,190);
triangle(50,350, 120,350, 90, 450);
triangle(120,350, 125, 440, 90,450);

//neck/jaw
fill(137, 102, 85);
triangle(135,350, 200,380, 200,600);
fill(173, 133, 115);
quad(135,350, 200,350, 200,380, 145,380);
triangle(145,380, 200,380, 200,420);
fill(152, 114, 97);
quad(120,350, 135,350, 200,600, 105,440);


//Shirt
stroke(150);
strokeWeight(2);
fill(255);
quad(0,505, 105,440,  170, 550,  0,600);
quad(0,600, 170,550,  200, 600,  0, 640);
quad(0,640, 140,613,  150, 700,  0,700);
quad(140,613, 200,600, 200,700, 150,700);









 
 
  
//CHAOS
//shaky lines

stroke(90);
strokeWeight(3);
// moves the left corner down along the Y path
float ly= 90.0;
// moves along the X path
float lx= 120.0;
//length
while (lx <130)
  {
      // moves the second point to the X path (ability to make hte line horizontal)
     float nextX = lx + random (50);
     // moves the second point to the Y path  (ability to make the line vertical)
     float nextY = ly + random (120);
     line (lx, ly, nextX, nextY);
     ly = nextY;
     lx = nextX;
  }

float ly2= 90.0;
float lx2= 90.0;
while (lx2 <95)
  {
     float nextX = lx2 + random (50);
     float nextY = ly2 + random (120);
     line (lx2, ly2, nextX, nextY);
     ly2 = nextY;
     lx2 = nextX;
  }

float ly3= 80.0;
float lx3= 100.0;
while (lx3 <110)
  {
     float nextX = lx3 + random (50);
     float nextY = ly3 + random (120);
     line (lx3, ly3, nextX, nextY);
     ly3 = nextY;
     lx3 = nextX;
  }
  
float ly4= 80.0;
float lx4= 140.0;
while (lx4 < 141)
  {
     float nextX = lx4 + random (50);
     float nextY = ly4 + random (120);
     line (lx4, ly4, nextX, nextY);
     ly4 = nextY;
     lx4 = nextX;
  }

float ly5= 100.0;
float lx5= 80.0;
while (lx5 <90)
  {
     float nextX = lx5 + random (50);
     float nextY = ly5 + random (120);
     line (lx5, ly5, nextX, nextY);
     ly5 = nextY;
     lx5 = nextX;
  }
  
  float ly6= 100.0;
float lx6 = 180.0;
while (lx6 <181)
  {
     float nextX = lx6 + random (50);
     float nextY = ly6 + random (120);
     line (lx6, ly6, nextX, nextY);
     ly6 = nextY;
     lx6 = nextX;
  }

float ly7= 150.0;
float lx7= 60.0;
while (lx7 <90)
  {
     float nextX = lx7 + random (50);
     float nextY = ly7 + random (120);
     line (lx7, ly7, nextX, nextY);
     ly7 = nextY;
     lx7 = nextX;
  }
  
  
//beard  
float ly8= 400.0;
float lx8= 320.0;
while (lx8 <321)
  {
     float nextX = lx8 + random (50);
     float nextY = ly8 + random (120);
     line (lx8, ly8, nextX, nextY);
     ly8 = nextY;
     lx8 = nextX;
  }
float ly9= 400.0;
float lx9= 290.0;
while (lx9 <291)
  {
     float nextX = lx9 + random (50);
     float nextY = ly9 + random (120);
     line (lx9, ly9, nextX, nextY);
     ly9 = nextY;
     lx9 = nextX;
  }
}


