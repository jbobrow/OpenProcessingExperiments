
    
void setup()
{
size(500, 500);
background(0);
noStroke();
}

void draw()
{
float farbe = map(mouseY, 0, 500, 0, 255);
float farbe2 = map(mouseY, 0, 500, 255, 0);
background(farbe);
rectMode(CENTER);
fill(farbe2);

float form = map(mouseX, 0, 500, 0, 25);
rect(50, 50, 50, 50, form);
rect(50, 150, 50, 50, form);
rect(50, 250, 50, 50, form);
rect(50, 350, 50, 50, form);
rect(50, 450, 50, 50, form);

rect(150, 50, 50, 50, form);
rect(150, 150, 50, 50, form);
rect(150, 250, 50, 50, form);
rect(150, 350, 50, 50, form);
rect(150, 450, 50, 50, form);

rect(250, 50, 50, 50, form);
rect(250, 150, 50, 50, form);
rect(250, 250, 50, 50, form);
rect(250, 350, 50, 50, form);
rect(250, 450, 50, 50, form);

rect(350, 50, 50, 50, form);
rect(350, 150, 50, 50, form);
rect(350, 250, 50, 50, form);
rect(350, 350, 50, 50, form);
rect(350, 450, 50, 50, form);

rect(450, 50, 50, 50, form);
rect(450, 150, 50, 50, form);
rect(450, 250, 50, 50, form);
rect(450, 350, 50, 50, form);
rect(450, 450, 50, 50, form);
}
