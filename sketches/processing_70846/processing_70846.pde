
//Robb Godshaw 2012 www.robb.cc
//Fun little face drawing thing

int clear = 0;
int cleared = 0;

void setup(){
  size(500,500);
  smooth();
  background(255-0.18*255);//I like 18% grey.
  fill(1);//0 is too dark.
 text("Clicking erases cool dude.",width/2+40, int(height-10));
 
 initialFace();
}

void draw(){
stroke(0,255,100);//neon green
strokeWeight(1);

line(width/2,0,width/2,height);//vertical centerline
line(0,height/2,width,height/2);//horizontal centerline
line(0,height/4,width,height/4);//top face guideline
line(0,3*height/4,width,3*height/4);//lower face guideline
noStroke();

if(clear == 1 && cleared == 0)//this little gut clears the face on the first click.
{
background(255-0.18*255);//overwrites the canvas with grey
cleared=1;//makes sure it doesn't happen twice
  }
}

void c(float cX, float cY){//this is a fixed size circle function.
  int rad = 5;
  ellipse(cX,cY, 2*rad, 2*rad);
}


 void mousePressed() {//on click: clear the canvas.
   clear=1;
 int coordX = mouseX, coordY = mouseY;
 int XX = coordX+5-(coordX % 10); //point on 10px grid near mouseX
 int YY = (coordY+5-(coordY % 10)); //point on 10px grid near mouseY
 int XXX = (width-(coordX+5-(coordX % 10))); //point reflected from XX
 int YYY = (coordY+5-(coordY % 10));   //point reflected from YY
 
    c(XX,YY); //draw primary circle
    c(XXX,YYY);//draw secondary circle
    
    print("c("+XX+","); println(YY+");");//prints the usable code that we start off with
    print("c("+XXX+","); println(YYY+");");//allowed me to compose with the mouse and then copy/paste from the console.
  } 
 

void initialFace(){//this function is called in set up, then blanked on click.
//the following code was generated with the print functions above, then copy/pasted here.
c(175,255);
c(325,255);
c(235,375);
c(265,375);
c(245,385);
c(255,385);
c(245,125);
c(255,125);
c(235,135);
c(265,135);
c(225,135);
c(275,135);
c(215,135);
c(285,135);
c(205,145);
c(295,145);
c(195,145);
c(305,145);
c(185,145);
c(315,145);
c(175,155);
c(325,155);
c(165,155);
c(335,155);
c(155,165);
c(345,165);
c(145,175);
c(355,175);
c(145,185);
c(355,185);
c(135,195);
c(365,195);
c(135,205);
c(365,205);
c(135,215);
c(365,215);
c(135,225);
c(365,225);
c(135,235);
c(365,235);
c(135,245);
c(365,245);
c(135,245);
c(365,245);
c(135,255);
c(365,255);
c(135,265);
c(365,265);
c(135,275);
c(365,275);
c(145,285);
c(355,285);
c(145,295);
c(355,295);
c(155,305);
c(345,305);
c(165,315);
c(335,315);
c(165,315);
c(335,315);
c(165,325);
c(335,325);
c(175,335);
c(325,335);
c(185,345);
c(315,345);
c(185,355);
c(315,355);
c(195,365);
c(305,365);
c(205,365);
c(295,365);
c(215,375);
c(285,375);
c(225,375);
c(275,375);
c(235,335);
c(265,335);
c(245,335);
c(255,335);
c(275,325);
c(225,325);
c(185,255);
c(315,255);
c(195,255);
c(305,255);
c(205,255);
c(295,255);
c(175,225);
c(325,225);
c(185,225);
c(315,225);
c(245,135);
c(255,135);
c(245,115);
c(255,115);
c(245,105);
c(255,105);
c(245,85);
c(255,85);
c(245,95);
c(255,95);
c(245,75);
c(255,75);
c(235,125);
c(265,125);
c(245,65);
c(255,65);
c(195,355);
c(305,355);
c(325,345);
c(175,345);
c(325,325);
c(175,325);
c(355,305);
c(145,305);
c(365,285);
c(135,285);
c(365,185);
c(135,185);
c(355,165);
c(145,165);
c(325,145);
c(175,145);
c(295,135);
c(205,135);
c(375,255);
c(125,255);
c(385,245);
c(115,245);
c(385,255);
c(115,255);
c(385,265);
c(115,265);
c(385,275);
c(115,275);
c(385,285);
c(115,285);
c(385,295);
c(115,295);
c(375,285);
c(125,285);
c(345,315);
c(155,315);
c(295,375);
c(205,375);
c(265,385);
c(235,385);
c(235,395);
c(265,395);
c(235,415);
c(265,415);
c(235,405);
c(265,405);
c(235,425);
c(265,425);
c(225,435);
c(275,435);
c(215,435);
c(285,435);
c(215,445);
c(285,445);
c(215,455);
c(285,455);
c(225,455);
c(275,455);
c(225,465);
c(275,465);
c(225,475);
c(275,475);
c(225,485);
c(275,485);
c(235,435);
c(265,435);
c(245,295);
c(255,295);
c(165,165);
c(335,165);
c(155,175);
c(345,175);
c(135,175);
c(365,175);
c(305,135);
c(195,135);
}
