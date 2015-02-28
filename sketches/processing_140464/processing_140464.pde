
/*Laiane Merino Vignoto
Arquitetura e Urbanismo (s53)
Psycho
fev/2014*/

/*Este trabalho estÃ¡ licenciado sob uma LicenÃ§a Creative Commons AtribuiÃ§Ã£o  4.0 Internacional. Para ver uma cÃ³pia desta licenÃ§a, visite http://creativecommons.org/licenses/by/4.0/deed.pt.*/

float gira;

color[] palette=
{
  #ffffff, #000000, #DBD74B, #4BDB4C, #A34BDB, #F2368E
};
color[] palettex= 
{
#98255B,#4D1AC6,#60FADF,#FAD660,#FA7A60,#ffffff,#000000
};


void setup() 
{
  size(600, 600);
  background(241, 245, 77);
}

void draw() 
{ 
  fill(0, 5);
  float r = random(1, 6);
  noStroke();
  fill(palette[int(r)], 14);


  rect(0, 0, width, height);
  if (mouseX!=0)
    stroke(palette[int(r)]);
  psycho(mouseX, mouseY); 

  gira+= 0.03;
}

void psycho(int x, int y)


{ 

  float r = random(1, 6);
  pushMatrix();

  translate(mouseX, mouseY);
  for (int i = 0; i < 200; i += 2)
  {
    rotate(radians(45+gira)); 
    fill(palettex[i%7],20);   
    bezier(0, 0, x, i, i, y, 0, 0);
  }
  popMatrix();
}

