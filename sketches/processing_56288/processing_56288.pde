
void setup ()
{
size(450,450);
background(52,55,77);
smooth();

fill(255,0,0);
noStroke();

}


//ara definim el què farà, dibuixar amb el ratolí
void draw ()
{
background(52,55,77);
ellipse(225,450, mouseX*1.2, mouseY*1.2);
ellipse(100,320, mouseX*.7, mouseY*.7);
ellipse(120,200, mouseX*.5, mouseY*.5);
ellipse(200,120, mouseX*.3, mouseY*.3);
ellipse(275,80, mouseX*.2, mouseY*.2);
ellipse(330,60, mouseX*.13, mouseY*.13);
ellipse(370,50, mouseX*.08, mouseY*.08);
ellipse(395,45, mouseX*.05, mouseY*.05);

  
}
