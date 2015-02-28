
void setup()
{
size(500,500);//canvas
background(#FFFFFF);//white background
}
 
void draw()
{
background(#FFFFFF);//white background
fill(#D0D0D0);//light grey
rect(mouseX,mouseY,50,90);//large rectangle (element 1)
 
noStroke();//noHemorrhage
  fill(#686868);//mid grey
    rect(mouseX+2,mouseY+2,47,66);//top rectangle (element 2)
  fill(#808080);//light grey
    rect(mouseX+4,mouseY+5,44,8);//top accent rectangle (element 3)
  fill(#D0D0D0);//another light grey
    rect(mouseX+5,mouseY+6,20,6);//top left rectangle (element 4)
    ellipse(mouseX+25,mouseY+46,39,39);//large ellipse (element 5)
  fill(#383838);//dark grey
    rect(mouseX+2,mouseY+69,47,20);//bottom rectangle (element 6)
    rect(mouseX+26,mouseY+6,20,6);//top right rectangle (element 7)
    ellipse(mouseX+25,mouseY+46,35,35);//dark circle (element 8)
  fill(#880000);//dark red
    ellipse(mouseX+25,mouseY+47,23,23);//large ellipse (element 9)
  fill(#C80000);//middle red
    ellipse(mouseX+25,mouseY+47,11,11);//middle ellipse (element 10)
  fill(#FFFF33);//light red
    ellipse(mouseX+25,mouseY+47,3,3);//small ellipse (element 11)
  stroke(#FFFFFF);//white stroke
  strokeWeight(2);//hefty weight of 2
    line(mouseX+20,mouseY+34,mouseX+29,mouseY+34);//top specular accent (element 12)
    line(mouseX+14,mouseY+40,mouseX+17,mouseY+38);//left specular accent (element 13)
    line(mouseX+32,mouseY+38,mouseX+35,mouseY+40);//right specular accent (element 14)
}


