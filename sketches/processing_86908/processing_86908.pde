
float plcX;
float plcY;

void setup()
{
size(600,600);//canvas
background(#999999);//grey background
}

void draw()
{
background(#999999);//background redrawn grey

    if(mousePressed)
        {
        background(#C90D0D);//pressing mouse makes background red
        }
    
fill(#D0D0D0);//light grey
rect(225,100,150,350);//large rectangle (element 1)
noStroke();//noHemorrhage
  fill(#686868);//mid grey
    rect(229,104,142,275);//top rectangle (element 2)
  fill(#808080);//light grey
    rect(233,111,134,32);//top accent rectangle (element 3)
  fill(#D0D0D0);//another light grey
    rect(236,114,65,26);//top left rectangle (element 4)
    ellipse(301,315,100,100);//large ellipse (element 5)
  fill(#383838);//dark grey
    rect(229,381,142,65);//bottom rectangle (element 6)
    rect(301,114,63,26);//top right rectangle (element 7)
  fill(#000000);//black
    ellipse(301,315,90,90);//dark circle (element 8)
    
plcX= map(mouseX, 0, width, -600, 600);//remaps mouseX from (0 - 600) to (-600 - 600)
plcY= map(mouseY, 0, height, -500, 500);//remaps mouseY from (0 - 500) to (-500 - 500)
  fill(#880000);//dark red
    ellipse(plcX/65+301, plcY/100+315,62,62);//large ellipse (element 9)
  fill(#C80000);//middle red
    ellipse(plcX/45+301, plcY/50+315,20,20);//middle ellipse (element 10)
  fill(#FFFF33);//yellow
    ellipse(plcX/35+301, plcY/40+315,7,7);//small ellipse (element 11)
  fill(255,255,255,65);//transluscent white
      ellipse(301,315,100,100);//covering ellipse (element 12)
    textSize(12);//PAL 9000 text
        fill(#D0D0D0);
        text("PAL 9000",305,132);
    
}



