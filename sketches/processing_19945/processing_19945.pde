
//Animated Dalek program

color x = color(245,169,69);

void setup(){
  frameRate(300);
  smooth();
size(800,600);
background(245,169,69);
}

void draw(){
  //invisi-text
  PFont font = loadFont("PortagoITCTT-48.vlw");
  textFont(font);
  fill(x);
  textAlign(CENTER);
  text("Exterminate!",170,85);
  
  //head light1
  fill(255);
  quad(333,28,326,38,340,60,362,49);
  
 //Dalek head
 fill(183,112,41);
 ellipse(400,100,150,150); 

 beginShape();
 vertex(340,100);
 vertex(340,90);
 vertex(350,60);
 vertex(390,60);
 vertex(390,100);
 endShape();
 
 fill(0);
 triangle(370,60,380,80,347,80);
 
 //eye-pointer
 fill(130);
 rect(317,68,50,5);
 fill(255);
 ellipse(317,70,30,30);
 ellipse(310,70,35,35);
 ellipse(305,70,35,35);
 ellipse(303,70,30,30);
 
 fill(0);
 ellipse(297,70,30,30);
 fill(0,0,255);
 ellipse(294,70,15,15);
 
 //head lights
 fill(255);
 quad(424,53,450,28,460,36,445,65);
 
 //dalek neck
 fill(0);
 quad(325,100,475,100,475,175,325,175);
 fill(183,112,41);
 quad(340,100,345,100,345,140,340,140);
 quad(375,100,380,100,380,140,375,140);
 quad(410,100,415,100,415,140,410,140);
 quad(445,100,450,100,450,140,445,140);
 
 
 quad(325,110,475,110,480,115,320,115);
 quad(325,125,475,125,480,130,320,130);
 quad(325,140,475,140,480,145,320,145);
 
 //dalek torso
 quad(320,145,480,145,500,230,300,230);
 quad(308,200,493,200,500,230,300,230);
 if(dist(400,184,mouseX,mouseY)<=100){
   x = 0;
 }else{
   x = color(245,169,69);
 }
 
  //tred
 fill(130);
 beginShape();
 vertex(255,420);
 vertex(245,430);
 vertex(245,450);
 vertex(286,456);
 vertex(550,450);
 vertex(550,433);
 vertex(540,423);
 endShape();
 
 line(245,430,290,438);
 line(290,438,550,433);
 
 //dalek bottom half
  fill(183,112,41);
 beginShape();
 vertex(300,230);
 vertex(255,420);
 vertex(292,427);
 vertex(540,423);
 vertex(500,230);
 vertex(300,230);
 endShape();
 
 line(292,427,337,230);
 line(360,426,374,230);
 line(430,425,411,230);
 line(495,424,453,230);
 
 //dalek balls
 fill(209,151,44);
 ellipse(312,252,30,30);
 ellipse(302,302,30,30);
 ellipse(290,351,30,30);
 ellipse(280,401,30,30);
 
 ellipse(353,252,30,30);
 ellipse(345,302,30,30);
 ellipse(336,351,30,30);
 ellipse(330,401,30,30);
 
 ellipse(394,252,30,30);
 ellipse(394,302,30,30);
 ellipse(395,351,30,30);
 ellipse(396,401,30,30);
 
 ellipse(436,252,30,30);
 ellipse(444,302,30,30);
 ellipse(452,351,30,30);
 ellipse(461,401,30,30);
 
 ellipse(485,252,30,30);
 ellipse(492,302,30,30);
 ellipse(504,351,30,30);
 ellipse(513,401,30,30);
 
 //pointer
 fill(130);
 quad(297,186,338,186,331,219,282,219);
 fill(115);
 ellipse(310,202,20,20);
 fill(135);
 quad(312,200,247,187,247,191,312,204);
 fill(50);
 ellipse(254,193,40,40);
 ellipse(249,193,30,50);
 ellipse(249,193,20,40);
 
 //shooter
 fill(135);
 quad(381,186,422,186,426,219,377,219);
 fill(115);
 ellipse(401,202,20,20);
 fill(200);
 ellipse(401,202,15,15);
 quad(401,200,356,197,356,201,401,204);
 beginShape();
 vertex(397,201);
 vertex(390,190);
 vertex(368,190);
 vertex(361,198);
 vertex(365,197);
 vertex(369,192);
 vertex(389,192);
 vertex(394,200);
 endShape();
 
 println("x: " + mouseX);
 println("y: " + mouseY);
 
 
}

