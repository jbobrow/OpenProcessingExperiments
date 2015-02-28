


 
void setup(){
  size(400,800);
  background(25);
   


}
 
 
void draw()


   {

     
     
//White Keyboard
fill(250); rect (0,650,800,150);

//White Keys shadow
noStroke(); fill(200) ; rect(0,650,5,800);
rect(0,650, 400, 5);
rect(21,650,5,800);
      rect(25,650,5,100);
rect(41,650,5,800);
      rect(45,650,5,100);
rect(61,650,5,800);
rect(81,650,5,800);
      rect(85,650,5,100);
rect(101,650,5,800);
      rect(105,650,5,100);
rect(121,650,5,800);
      rect(125,650,5,100);
rect(141,650,5,800);
rect(161,650,5,800);
      rect(165,650,5,100);
rect(181,650,5,800);
      rect(185,650,5,100);
rect(201,650,5,800);
rect(221,650,5,800);
      rect(225,650,5,100);
rect(241,650,5,800);
      rect(245,650,5,100);
rect(261,650,5,800);
      rect(265,650,5,100);
rect(281,650,5,800);
rect(301,650,5,800);
      rect(305,650,5,100);
rect(321,650,5,800);
      rect(325,650,5,100);
rect(341,650,5,800);
rect(361,650,5,800);
      rect(365,650,5,100);
rect(381,650,5,800);
      rect(385,650,5,100);
      
//White Keys
stroke (1); line(20,650,20,800);
line(40,650,40,800);
line(60,650,60,800);
line(80,650,80,800);
line(100,650,100,800);
line(120,650,120,800);
line(140,650,140,800);
line(160,650,160,800);
line(180,650,180,800);
line(200,650,200,800);
line(220,650,220,800);
line(240,650,240,800);
line(260,650,260,800);
line(280,650,280,800);
line(320,650,320,800);
line(340,650,340,800);
line(360,650,360,800);
line(380,650,380,800);
line(300,650,300,800);
line(320,650,320,800);
line(340,650,340,800);
line(360,650,360,800);
line(380,650,380,800); 



//Black Keys
fill(0); 
rect (15,650,10,100);
rect (35,650,10,100);

rect (75,650,10,100);
rect (95,650,10,100);
rect (115,650,10,100);

rect (155,650,10,100);
rect (175,650,10,100);

rect (215,650,10,100);
rect (235,650,10,100);
rect (255,650,10,100);

rect (295,650,10,100);
rect (315,650,10,100);

rect (355,650,10,100);
rect (375,650,10,100);

//Black Key light
fill(100); 
rect (15,650,3,90);
rect (35,650,3,90);
rect (75,650,3,90);
rect (95,650,3,90);
rect (115,650,3,90);
rect (155,650,3,90);
rect (175,650,3,90);
rect (215,650,3,90);
rect (235,650,3,90);
rect (255,650,3,90);
rect (295,650,3,90);
rect (315,650,3,90);
rect (355,650,3,90);
rect (375,650,3,90);



//Background
fill(0); noStroke() ;rect(0,640,800,10);
fill(3); rect(0,630,800,10);
fill(5); rect(0,620,800,10);
fill(7); rect(0,610,800,10);
fill(9); rect(0,600,800,10);
fill(11); rect(0,590,800,10);
fill(13); rect(0,580,800,10);
fill(15); rect(0,570,800,10);
fill(17); rect(0,560,800,10);
fill(19); rect(0,550,800,10);
fill(21); rect(0,540,800,10);
fill(23); rect(0,530,800,10);

//Orange Ellipses
smooth(); fill(255, 182, 33); ellipse (0,0,300,300);
smooth(); fill(255, 80); ellipse (0,0,290,290);
smooth(); fill(255, 182, 33); ellipse (0,0,280,280);
noStroke(); fill(245, 172, 25); ellipse (0,0,260,260);
noStroke(); fill(237, 164, 16); ellipse (0,0,220,220);
noFill(); stroke(50, 70) ; ellipse (0,0,320,320);
noFill(); stroke(50, 30) ; ellipse (0,0,340,340);
noFill(); stroke(50, 10) ; ellipse (0,0,360,360);
noFill();stroke(30, 10) ; ellipse (0,0,380,380);
noFill(); stroke(20, 10) ; ellipse (0,0,400,400);

smooth(); fill(255, 182, 33); ellipse (300,400,20,20);
smooth(); fill(235, 162, 20); ellipse (300,400,10,10);
noFill(); smooth(); stroke(50, 70) ; ellipse (300,400,30,30);
noFill(); smooth(); stroke(50, 10) ; ellipse (300,400,40,40);

smooth(); fill(255, 182, 33); ellipse (350,200,70,70);
smooth(); fill(245, 172, 27); ellipse (350,200,60,60);
smooth(); fill(235, 162, 20); ellipse (350,200,50,50);
noFill(); smooth(); stroke(50, 70) ; ellipse (350,200,80,80);
noFill(); smooth(); stroke(50, 10) ; ellipse (350,200,90,90);

fill(255, 182, 33); smooth(); ellipse (50, 420, 10,10 );
noFill(); smooth(); stroke(50, 15) ; ellipse (50, 420, 20,20 );
noFill(); smooth(); stroke(50, 5) ; ellipse (50, 420, 30,30 );

fill(255, 182, 33); smooth(); ellipse (25, 580, 8,8 );
fill(255, 182, 33); smooth(); ellipse (225, 580, 8,8 );
fill(255, 182, 33); smooth(); ellipse (240, 580, 8,8 );
fill(255, 182, 33); smooth(); ellipse (345, 580, 8,8 );
fill(255, 0, 0); smooth(); ellipse (360, 580, 8,8 );

//Red Ellipses
smooth(); fill(255, 70, 70); ellipse (300,25,15,15);
smooth(); fill(255, 0, 0); ellipse (300,25,10,10);
noFill(); smooth(); stroke(50, 70) ; ellipse (300,25,25,25);
noFill(); smooth(); stroke(50, 10) ; ellipse (300,25,35,35);

smooth(); fill(255, 0, 0); ellipse (200,200,5,5);
noFill(); smooth(); stroke(50, 20) ; ellipse (200,200,15,15);

smooth(); fill(180, 0, 0); ellipse (70,260,70,70);
smooth(); fill(200, 0, 0); ellipse (70,260,60,60);
smooth(); fill(220, 0, 0); ellipse (70,260,50,50);
smooth(); fill(240, 0, 0); ellipse (70,260,40,40);
smooth(); fill(255, 0, 0); ellipse (70,260,30,30);
noFill(); smooth(); stroke(50, 50) ; ellipse (70,260,80,80);
noFill(); smooth(); stroke(50, 25) ; ellipse (70,260,95,95);
noFill(); smooth(); stroke(50, 5) ; ellipse (70,260,110,110);
noFill(); smooth(); stroke(50, 5) ; ellipse (70,260,140,140);

fill(255, 0, 0); smooth(); ellipse (195, 380, 12,12 );
noFill(); smooth(); stroke(50, 15) ; ellipse (195, 380, 22,22 );
noFill(); smooth(); stroke(50, 5) ; ellipse (195, 380, 32,32 );



//Turning Knobs
noFill(); smooth(); stroke(1,20); ellipse (100, 500, 30,30 );
noFill(); smooth(); stroke(1,20); ellipse (300, 500, 30,30 );
fill(25); noStroke() ; rect (0, 500, 400, 20);
fill(120); smooth(); ellipse (100, 500, 15,15 );
fill(120); smooth(); ellipse (300, 500, 15,15 );
fill(80); stroke(1); smooth(); ellipse (100, 500, 9,9 );
fill(80); stroke(1); smooth(); ellipse (300, 500, 9,9 );
fill(255, 182, 33); smooth(); ellipse (100, 485, 4,4 );
fill(255, 182, 33); smooth(); ellipse (310, 490, 4,4 );



}
 
void keyPressed()
//Takes PNG screenshots when you push S
//Careful - doesn't prompt when overwriting files!
{
  if(key == 's' || key == 'S')
  {
    String filePath = selectInput("Saving PNG - Select or Type File Name");  // Opens file chooser
    if(filePath != null)
    {
      save(filePath + ".png");
    }
  }
}

