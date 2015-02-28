
PFont logo;

void setup(){
 size(600,600); 
 background(255,255,255);
 logo = loadFont("Magneto-Bold-48.vlw");
 textFont(logo, 18);
}

void draw(){
 fill(0); 
 rect (150,150,300,300);//black background
 fill(95,95,95);
 rect (200,200,200,200);//grey square
 fill(60,60,60);
 ellipse (300,290,180,180);//hot plate background shadow
 fill(10,10,10);
 ellipse (300,290,120,180);//hot plate background
 fill(0,0,0);
 ellipse (300,390,200,50);//hot plate shadow
 fill(180,180,180);
 ellipse (300,370,120,30);//hot plate
 fill(255,255,255);
 ellipse(300,340,90,80);//cup body
 fill(237,237,237);
 ellipse(300,315,80,30);//inner cup shadow
 noStroke();
 fill(131,90,90);
 ellipse(300,315,75,20);//inner cup - coffee
 fill(255,255,255);
 ellipse(350,340,30,30);//handle
  fill(0,0,0);
 ellipse(350,340,15,15);//handle inner
 fill(227,227,227);
 rect(200,200,200,40);//machine top
 fill(139,139,139);
 rect(290,240,20,40);//machine spout
 fill(113,113,113);
 rect(290,240,10,40);//machine spout shadow
 fill(220,220,220);
 ellipse(300,280,20,3);//spout tip
 fill(220,220,220);
 rect(200,390,200,10);//machine bottom - grey bar
 fill(113,113,113);
 rect(150,150,300,50);//Machine - top panel 
 fill(113,113,113);
 rect(150,400,300,50);//Machine - Bottom panel
 fill(100,100,100);
 rect(165,410,270,30);//Machine - Bottom panel shadow
 fill(60,60,60);
 rect(170,415,260,2);//Machine - Bottom panel vent 1 
 rect(170,420,260,2);//Machine - Bottom panel vent 2 
 rect(170,425,260,2);//Machine - Bottom panel vent 3 
 rect(170,430,260,2);//Machine - Bottom panel vent 4 
 rect(170,435,260,2);//Machine - Bottom panel vent 5
 
 //text
 fill(255,255,255);
 text("Grumpy Coffee",160,175);
 fill(70,70,70);
 text("Grumpy Coffee",161,176);
 
 //buttons
 fill(255,240,206);
 ellipse(175,260,40,20);//left
 ellipse(175,310,40,20);
 ellipse(175,360,40,20);
 ellipse(425,260,40,20);//right
 ellipse(425,310,40,20);
 ellipse(425,360,40,20);
 
}


