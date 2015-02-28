
void setup()
{
size(500, 500);
}

void draw()
{

// zeile1
background(255);
textSize(28);
fill(0, 102, 153);
text("mit der Maus von links nach rechts", 10, 30); 

fill(255);
stroke(0);
translate(4,90);

int sz = 20, os = 30;
for (int col = 0; col < 16; col++)
    for (int row = 0; row < 10; row++) {
        rect(10 + col * os, 10 + row * os, sz, sz);
    }

fill(0);
stroke(0);
//Zeile 2
pushMatrix();
translate(mouseX/16,0);
rect(160,40,20,20);
rect(220,40,20,20);
popMatrix();

//Zeile 3
rect(190,70,20,20);
rect(250,70,20,20);

//Zeile 4
pushMatrix();
translate(-mouseX/16,0);
rect(220,100,20,20);
rect(280,100,20,20);
popMatrix();

//Zeile 6
pushMatrix();
translate(mouseX/16,0);
rect(100,160,20,20);
popMatrix();

//Zeile 7
rect(160,190,20,20);

//Zeile 8
rect(190,220,20,20);
rect(220,220,20,20);
pushMatrix();
translate(0,-mouseX/16.5);
rect(250,250,20,20);
popMatrix();

//Zeile9
rect(280,190,20,20);

//Zeile 10
rect(310,160,20,20);
}
