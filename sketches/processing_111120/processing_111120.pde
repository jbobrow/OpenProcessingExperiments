
int px;
void setup() {
  size(600, 500);
  background(0);
  smooth();
  frameRate(25);
  px=0;
}
void draw() {
  
background(0);

   px++;
  noStroke ();
  fill (200);
  ellipse (px,90,50,50);  
  
    fill(200);
    rect(0,300,600,10);
    rect(550,150,10,450);
    rect(50,150,10,450);
    stroke(200);
    line(53,150,0,250);
    line(557,150,600,250);
    line(60,280,240,270);
    line(550,280,360,270);
    line(0,350,50,350);
    line(560,350,600,350);
    noFill();
     
    triangle(70,280,80,300,60,300);
     triangle(90,280,100,300,80,300);
     triangle(110,280,120,300,100,300);
     triangle(130,278,140,300,120,300);
     triangle(150,275,160,300,140,300);
     triangle(170,275,180,300,160,300);
     triangle(190,273,200,300,180,300);
     triangle(210,272,220,300,200,300);
     triangle(230,273,240,300,220,300);
     triangle(250,274,260,300,240,300);
     triangle(270,275,280,300,260,300);
     triangle(290,276,300,300,280,300);
     triangle(310,277,320,300,300,300);
     triangle(330,274,340,300,320,300);
     triangle(350,274,360,300,340,300);
     triangle(370,273,380,300,360,300);
     triangle(390,274,400,300,380,300);
     triangle(410,274,420,300,400,300);
     triangle(430,274,440,300,420,300);
     triangle(450,275,460,300,440,300);
     triangle(470,276,480,300,460,300);
     triangle(490,280,500,300,480,300);
     triangle(510,280,520,300,500,300);
     triangle(530,280,540,300,520,300);
     triangle(550,280,560,300,540,300);
  

        fill(206,202,17);
    rect(45,380,20,30);
    rect(545,380,20,30);

    noFill();
    arc(305,150,493,250,0,PI);
    
   noStroke ();
   rect(0,400,600,200);
  fill (143, 238, 252, 180);
 rect(0,400,600,200);
 

 
 noStroke();
 px++;
 ellipse(px+10,430,45,45);

 
 
 fill(255,0,0);
    rect(mouseX,450,70,30);
    triangle(mouseX-20,450,mouseX,450,mouseX,480);
    triangle(mouseX+70,450,mouseX+90,450,mouseX+70,480);
    fill(180);
    triangle(mouseX+20,449,mouseX+50,449,mouseX+50,380);
 
 stroke(0);
 
 if (mouseX>200) {
  fill (255,254,150);
 ellipse(10,234,5,5);// luz1
 ellipse(20,217,5,5);
 ellipse(30,198,5,5); 
 ellipse(40,179,5,5);
 ellipse(50,160,5,5);
 ellipse(60,165,5,5);
 ellipse(70,185,5,5);
 ellipse(80,199,5,5);
 ellipse(90,210,5,5);
 ellipse(100,218,5,5);
 ellipse(110,225,5,5);
 ellipse(120,233,5,5);
 ellipse(130,239,5,5);
 ellipse(140,243,5,5);
 ellipse(150,247,5,5);
ellipse(160,251,5,5);
ellipse(170,254,5,5);
ellipse(180,257,5,5);
ellipse(190,260,5,5);
ellipse(200,262,5,5);
ellipse(210,264,5,5);
ellipse(220,266,5,5);
ellipse(230,268,5,5);
ellipse(240,270,5,5);
ellipse(250,272,5,5);
ellipse(260,273,5,5);
ellipse(270,274,5,5);
ellipse(280,275,5,5);
ellipse(290,275,5,5);
ellipse(300,275,5,5);
ellipse(310,274,5,5);
ellipse(320,274,5,5);
ellipse(330,273,5,5);
ellipse(340,272,5,5);
ellipse(350,272,5,5);
ellipse(360,272,5,5);
ellipse(370,271,5,5);
ellipse(380,270,5,5);
ellipse(390,268,5,5);
ellipse(400,266,5,5);
ellipse(410,264,5,5);
ellipse(420,262,5,5);
ellipse(430,260,5,5);
ellipse(440,257,5,5);
ellipse(450,253,5,5);
ellipse(460,249,5,5);
ellipse(470,245,5,5);
ellipse(480,241,5,5);
ellipse(490,235,5,5);
ellipse(500,229,5,5);
ellipse(510,222,5,5);
 ellipse(520,214,5,5);
  ellipse(530,204,5,5);// luz1
 ellipse(540,192,5,5);
  ellipse(550,171,5,5); 
   ellipse(560,162,5,5);
    ellipse(570,180,5,5);
     ellipse(580,205,5,5);
 ellipse(590,221,5,5);
  ellipse(600,243,5,5);
        
         
       
}
else {
  fill (0);
  ellipse(10,234,5,5);
  ellipse(20,217,5,5); 
  ellipse(30,198,5,5);
   ellipse(40,179,5,5);
    ellipse(50,160,5,5);
     ellipse(60,165,5,5);
 ellipse(70,185,5,5);
  ellipse(80,199,5,5);
   ellipse(90,210,5,5);
    ellipse(100,218,5,5);
 ellipse(110,225,5,5);
  ellipse(120,233,5,5);
 ellipse(130,239,5,5);
  ellipse(140,243,5,5);
 ellipse(150,247,5,5);
  ellipse(160,251,5,5);
 ellipse(170,254,5,5);
  ellipse(180,257,5,5);
   ellipse(190,260,5,5);
    ellipse(200,262,5,5);
    ellipse(170,254,5,5);
ellipse(180,257,5,5);
ellipse(190,260,5,5);
ellipse(200,262,5,5);
ellipse(210,264,5,5);
ellipse(220,266,5,5);
ellipse(230,268,5,5);
ellipse(240,270,5,5);
ellipse(250,272,5,5);
ellipse(260,273,5,5);
ellipse(270,274,5,5);
ellipse(280,275,5,5);
ellipse(290,275,5,5);
ellipse(300,275,5,5);
ellipse(310,274,5,5);
ellipse(320,274,5,5);
ellipse(330,273,5,5);
ellipse(340,272,5,5);
ellipse(350,272,5,5);
ellipse(360,272,5,5);
ellipse(370,271,5,5);
ellipse(380,270,5,5);
ellipse(390,268,5,5);
ellipse(400,266,5,5);
ellipse(410,264,5,5);
ellipse(420,262,5,5);
ellipse(430,260,5,5);
ellipse(440,257,5,5);
ellipse(450,253,5,5);
ellipse(460,249,5,5);
ellipse(470,245,5,5);
ellipse(480,241,5,5);
ellipse(490,235,5,5);
ellipse(500,229,5,5);
ellipse(510,222,5,5);
 ellipse(520,214,5,5);
  ellipse(530,204,5,5);// luz1
 ellipse(540,192,5,5);
  ellipse(550,171,5,5); 
   ellipse(560,162,5,5);
    ellipse(570,180,5,5);
     ellipse(580,205,5,5);
 ellipse(590,221,5,5);
  ellipse(600,243,5,5);
}
 for(int i= 0; i<600; i=i+10)
 if (mouseX>200) {
  fill (255,242,150);
  ellipse(i,300,5,5);
 }
 else{
   fill(0);
    ellipse(i,300,5,5);
 }
 fill(255);
 ellipse (random(0,600),random(0,400),3, 4);

fill (143, 238, 252, 180);
noStroke(); // ondas
beginShape();
curveVertex(0,470-mouseX/30);
curveVertex(25, 480+mouseX/40);
curveVertex(65,470);
curveVertex(145,480-mouseX/40);
curveVertex(165,480);
curveVertex(205,480-mouseX/40);
curveVertex(245, 480);
curveVertex(285, 480);
curveVertex(305,470+mouseX/40);
curveVertex(325,480-mouseX/40);
curveVertex(365, 480);
curveVertex(385,480+mouseX/40);
curveVertex(445,470);
curveVertex(500,480+mouseX/60);
curveVertex(550,480+mouseX/80);
curveVertex(585,470);
endShape();


 }
