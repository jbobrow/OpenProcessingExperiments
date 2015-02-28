
int x=1;
int y=1;

 void setup(){
   size(400,400);// size of window
   background(0);// black background
   noStroke();// no strokes
 }
  void draw(){
    mixer(100,100);// draw mixer
  }
   void mixer(int x,int y){
     x=x+3;// x right 3
     y=y+3;// y up 3
     fill(255);// white
     rect(100,120,265,265);// border around mixer 
     fill(0);// black
     rect(5+x,25+y,250,250);// plate of mixer
     rect(100+x,135+y,50,75);// volume panel
     stroke(255);// stroke of line
     line(150+x,350,200,350);// line is for bottom fader
     line(175,210+y,175,240);// line is for middle left fader
     line(280,210+y,280,240);// line is for middle right fader
     line(100+x,150,150,150); // line is for top left transform switch
     line(200+x,150,250,150);// line is for top right transform switch 
     fill(23,0,0);// burgundy
     rect(225,340,10,20);// bottom fader
     rect(165,275,20,10);// left fader
     rect(270,275,20,10);// right fader
     rect(170,147,10,5);// top left is the transform switch
     rect(275,147,10,5);// top right is the transform switch
     ellipse(120,365,10,10);// bottom left hole
     ellipse(345,365,10,10);// top left hole
     ellipse(120,140,10,10);// bottom right hole
     ellipse(345,140,10,10);// top right hole
     ellipse(112,340,27,19);// left hole on mixer
     ellipse(355,340,27,19);// right hole on mixer
     fill(255);// white
     rect(99,331,11,18);// cover half f the left oval 
     rect(357.55,331,11,18);// cover half of the right oval
     

   }
   

