
void setup()
{
size(750,530);
background(16,131,189);
}

void draw()
{
scale(0.7);
noStroke();

smooth();



fill(170,37,11);
ellipse(850,80,276,276);
fill(16,131,189);
ellipse(840,60,276,276);

fill(244,141,4);
ellipse(800,20,251,251);
fill(16,131,189);
ellipse(800,0,251,251);

fill(7,17,23,150);
ellipse(815,770,348,348);
fill(16,131,189);
ellipse(815,820,375,375);




fill(10,15,13);
ellipse(250,350,320,320);

fill(19,71,85);
ellipse(250,350,300,300);

fill(21,24,55);
ellipse(250,350,130,130);

fill(15,8,1,100);
triangle(110,120,410,120,255,350);         // dreieck zeigt von oben in kreis

fill(29,32,54,175);
triangle(255,350,170,720,340,720);

fill(246,147,9);
rect(60,10,200,40);                         //rechteck oben links

fill(243,161,10);
triangle(800,420,855,420,800,460);         //kleines oranges dreieck oben

fill(166,31,5);
triangle(800,460,840,460,800,480);         //kleines oranges dreieck unten

fill(11,6,0);                                      
triangle(460,350,400,470,530,470);          //dreieck oben
triangle(460,470,410,580,510,580);          //dreieck mitte
triangle(460,580,420,690,500,690);          //dreieck unten

fill(165,30,4);
triangle(800,10,540,480,800,480);          //großes dreieck

fill(231,81,6,150);
triangle(640,500,1015,500,825,695);     // dreieck nach unten zeigend

fill(165,32,3);
triangle(800,280,955,280,955,370);             // dreieck orange aus kasten

fill(5,12,3);
triangle(800,280,800,370,955,370);

fill(255,255,255);
rect(800,390,200,22);

fill(8,4,1);
triangle(875,425,960,425,915,500);

fill(180,30,5);
  quad(600,95,665,125,635,190,570,160);     //schräges rechteck
  


}

