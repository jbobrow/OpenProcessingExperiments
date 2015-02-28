
//Monday, April 21, 2014 11:30 AM
//emma Bruce-Brown-Period4 Engineering-4.9.14
//key press for night,mouse press for day
void setup ()
{  background (#5C0CEA);
  size(700,700);  
}  
void draw ()
{
fill(#000000);
text("Click for day, key press for night",12,680);

}
void keyPressed ()
{
if (focused) 
background (#0D0F36);
fill(#F8FC8F);
ellipse(45,45,45,45);
ellipse(600,45,45,45);
ellipse(45,450,45,45);
ellipse(309,56,45,45);
ellipse(230,405,45,45);
ellipse(160,300,45,45);
ellipse(230,405,45,45);
ellipse(310,350,45,45);
ellipse(608,350,45,45);
ellipse(608,200,45,45);
ellipse(550,550,45,45);
ellipse(450,255,45,45);
ellipse(160,160,45,45);
ellipse(450,400,45,45);
ellipse(350,500,45,45);

fill(#155821);
rect(0,605,700,95);
fill(#FFFFFF);
ellipse(350,170,160,160);
}

void mousePressed ()
{
if (focused)
background (#11F7F5);
fill(#23F711);
rect(0,605,700,95);
fill(#F3F711);
ellipse(350,170,160,160);

fill(#FFFFFF);
ellipse(45,45,250,56);
ellipse(750,95,250,56);
ellipse(430,450,250,56);
ellipse(100,350,250,56);
ellipse(600,350,250,56);





}


