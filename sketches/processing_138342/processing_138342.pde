
/* @pjs font="FreestyleScript.vlw"; "AgencyFBB.vlw"*/
/*@pjs preload="pink.jpg, circut.jpg"; */

PFont freestyle;
PFont agency; 
float timer= 35.0;
float x = 0; 
float x2= 800;
float xspeed = 3; 
float rad = 0;
boolean games = true; 
PImage circuit;
PImage pink; 




void setup()
{
size(800,600);
background(250); 
stroke(0); 
freestyle = createFont("Freestyle Script",20); 
agency= createFont("AgencyFBB.vlw",15);
circuit = requestImage("circut.jpg"); 
pink= requestImage("pink.jpg"); 
}



void draw()
{
  timer = timer - (1.0 / 30.0);
  
  
  if (timer <= 15.00)
  {
  games = false;  
  background(255); 
  image(pink,width,height);
  pushMatrix();
  float dressX = 350;
  float dressY = 190; 
  fill (252,150,222);
  textSize(40); 
  textFont(freestyle);
  text("EGL",dressX+10,dressY-5);
  text("OP",dressX+10,dressY-20);
  text("OTK",dressX+70,dressY);
  text("OG",dressX+70,dressY-20);
  text("Ribbon and Lace",dressX,dressY+10);
  text("I love it so much",dressX,dressY+20);
  text("Fluffy-and-girly",dressX,dressY+30);
  text("Ruffles-and-frills",dressX,dressY+40);
  text("VictorianMaiden",dressX+5,dressY+55);
  text("AngelicPretty",dressX,dressY+70);
  text("jumperskirts,tiered-skirts",dressX-40,dressY+90);
  text("WonderQueen,RomanticRoseLetter",dressX-70,dressY+110);
  text("SweetCreamHouse,MeltyRoyalChocolate",dressX-80,dressY+130);
  text("Holiday-of-the-Flim-Flam-brass-band,Labyrinth",dressX-95,dressY+150);
  text("Waltz-of-Spring,Candy-Alice-Raindbow,Thumbellina",dressX-110,dressY+170);
  text("mon-petit-chouchou,A-piece-of-the-Red-Märchen",dressX-100,dressY+180);
  text("Night-Ship-Alice,Wonder-Cookie,Fantasy-Wonderland",dressX-120,dressY+195);
  text("Dear-Friend,Twilight-Music,To-My-Lovely-Glutton",dressX-120,dressY+210);
  text("Magic -Tea-Party-Autumn-Fruit,Royal-Carousel",dressX-110,dressY+230);
  popMatrix(); 
  
  ///bows
  pushMatrix();
  float bowX = 500;
  float bowY= 100; 
  textFont(freestyle);
  fill(255,150,222); 
  text("QT",bowX,bowY); 
  text("QT",bowX+80, bowY);
  text("bows", bowX, bowY + 10); 
  text("bows", bowX+80, bowY + 10); 
  text("OTKS", bowX, bowY+ 25);
  text("OTKS", bowX +70, bowY +25);
  text("hats",bowX, bowY + 35);
  text("hats",bowX+ 80, bowY + 35);
  text("OOO",bowX+40, bowY+ 10);
  text("OOO",bowX+40, bowY+ 20);
  text("OOO",bowX+40, bowY+ 30);
  popMatrix(); 
  
    pushMatrix();
  float speed = .05;
  float bowX2 = 100;
  float bowY2= 300 + speed; 
  textFont(freestyle);
  fill(134,242,255); 
  text("QT",bowX2,bowY2); 
  text("QT",bowX2+80, bowY2);
  text("bows", bowX2, bowY2 + 10); 
  text("bows", bowX2+80, bowY2 + 10); 
  text("OTKS", bowX2, bowY2+ 25);
  text("OTKS", bowX2 +70, bowY2 +25);
  text("hats",bowX2, bowY2 + 35);
  text("hats",bowX2+ 80, bowY2 + 35);
  text("OOO",bowX2+40, bowY2+ 10);
  text("OOO",bowX2+40, bowY2+ 20);
  text("OOO",bowX2+40, bowY2+ 30);
  popMatrix(); 
  
  pushMatrix();
  float bowX3 = 550;
  float bowY3= 500; 
  textFont(freestyle);
  fill(209,99,255); 
  text("QT",bowX3,bowY3); 
  text("QT",bowX3+80, bowY3);
  text("bows", bowX3, bowY3 + 10); 
  text("bows", bowX3+80, bowY3 + 10); 
  text("OTKS", bowX3, bowY3+ 25);
  text("OTKS", bowX3 +70, bowY3 +25);
  text("hats",bowX3, bowY3 + 35);
  text("hats",bowX3+ 80, bowY3 + 35);
  text("OOO",bowX3+40, bowY3+ 10);
  text("OOO",bowX3+40, bowY3+ 20);
  text("OOO",bowX3+40, bowY3+ 30);
  popMatrix(); 
  
  pushMatrix();
  float bowX4 = 30;
  float bowY4= 90 ; 
  textFont(freestyle);
  fill(124,255,170); 
  text("QT",bowX4,bowY4); 
  text("QT",bowX4+80, bowY4);
  text("bows", bowX4, bowY4 + 10); 
  text("bows", bowX4+80, bowY4 + 10); 
  text("OTKS", bowX4, bowY4+ 25);
  text("OTKS", bowX4 +70, bowY4 +25);
  text("hats",bowX4, bowY4 + 35);
  text("hats",bowX4+ 80, bowY4 + 35);
  text("OOO",bowX4+40, bowY4+ 10);
  text("OOO",bowX4+40, bowY4+ 20);
  text("OOO",bowX4+40, bowY4+ 30);
  popMatrix(); 
  
  
    pushMatrix();
  float bowX5 = 60;
  float bowY5= 530 ; 
  textFont(freestyle);
  fill(235,255,88); 
  text("QT",bowX5,bowY5); 
  text("QT",bowX5+80, bowY5);
  text("bows", bowX5, bowY5 + 10); 
  text("bows", bowX5+80, bowY5 + 10); 
  text("OTKS", bowX5, bowY5+ 25);
  text("OTKS", bowX5 +70, bowY5 +25);
  text("hats",bowX5, bowY5 + 35);
  text("hats",bowX5+ 80, bowY5 + 35);
  text("OOO",bowX5+40, bowY5+ 10);
  text("OOO",bowX5+40, bowY5+ 20);
  text("OOO",bowX5+40, bowY5+ 30);
  popMatrix(); 
  
     pushMatrix();
  float bowX6 = 630;
  float bowY6= 330 ; 
  textFont(freestyle);
  fill(235,255,88); 
  text("QT",bowX6,bowY6); 
  text("QT",bowX6+80, bowY6);
  text("bows", bowX6, bowY6 + 10); 
  text("bows", bowX6+80, bowY6 + 10); 
  text("OTKS", bowX6, bowY6+ 25);
  text("OTKS", bowX6 +70, bowY6 +25);
  text("hats",bowX6, bowY6 + 35);
  text("hats",bowX6+ 80, bowY6 + 35);
  text("OOO",bowX6+40, bowY6+ 10);
  text("OOO",bowX6+40, bowY6+ 20);
  text("OOO",bowX6+40, bowY6+ 30);
  popMatrix(); 
  
  pushMatrix(); 
  textFont(freestyle);
 fill(198,57,255);
  textSize(50); 
  translate(150,150);
  rotate(frameCount / -50.0);
  text("SUPER EFFIN' GIRLY", 0, 0,200,300);
  popMatrix(); 
  
  
  }
  
  if (timer <= 0.00)
  {timer= 35.0;
   games =true; }

  
 if (games == true)
 {
   background(255);
  image(circuit,width,height); 
  textFont(agency); 
  fill(255,0,255);
  textSize(45); 
  text ("P1", 150,100); 
  text("P2", 500,300); 
  strokeWeight(5);
  noFill();
  bezier(205, 140, 10, -40,300, 50, 500, 0);
  bezier(600, 340, 950, 100, 400, 300, 800, 0);
  
  
  pushMatrix();
  fill(0); 
  textSize(20);
  float stickX = 100;  
  float stickY = 200; 
  text("here's my rant",stickX+65,stickY-40); 
  text("Hi~my-name-is-Mia",stickX+40,stickY-20); 
  text("I'm-a-girl-who-makes-games",stickX,stickY); 
  text("it's-not-all-that-unusual-really",stickX,stickY+20);  
  text("But that's not the real point",stickX,stickY+40);  
  text("but....since         I like games",stickX,stickY+60);  
  text("It's-thought       that I'm not",stickX,stickY+80);  
  text(" --------- like       a-----------",stickX,stickY+100);  
  text("  'normal                 GIRL'",stickX,stickY+120);  
popMatrix(); 

pushMatrix(); 
 float stickX2 = 500;  
  float stickY2 = 400; 
  text("but why?",stickX2+75,stickY2-40); 
  text("What's the matter",stickX2+40,stickY2-20); 
  text("with-stuff-normal-girls-do?",stickX2,stickY2); 
  text("As if games are solely male",stickX2,stickY2+20);  
  text("and that they're exclusive??",stickX2,stickY2+40);  
  text("femininity         is something",stickX2,stickY2+60);  
  text("expected           tobedebunked",stickX2,stickY2+80);  
  text(" ---------tru      th -----------",stickX2,stickY2+100);  
  text("  'is, I'm             actually'",stickX2,stickY2+120);  
popMatrix(); 


pushMatrix();
  textFont(agency);
   
  String t = "Agency";
   
  if (x2 < width )
  {
    x2 = 0;
  }
  else if (x > 0)
  {
    xspeed = -3;
  }
     x2 += xspeed;
     rad += 0.01;
textSize(30);
fill(255,0,0); 
text("'I'm not a conventional girl'", x2, 200);
popMatrix(); 
  
  }
  
  
}


