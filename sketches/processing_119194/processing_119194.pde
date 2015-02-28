
void setup()
{
size(500,500);
}

void draw()
{
background(255);
fill(114,127,252);
stroke(114,127,252);
//Zeile1 X1
ellipse(80,40,20,20);
ellipse(160,40,20,20);

ellipse(240,40,20,20);

ellipse(320,40,20,20);

ellipse(400,40,20,20);


//Zeile X2
ellipse(80,80,20,20);

ellipse(160,80,20,20);

ellipse(240,80,20,20);

ellipse(320,80,20,20);

ellipse(400,80,20,20);

//Zeile X3
ellipse(80,120,20,20);

ellipse(160,120,20,20);

ellipse(240,120,20,20);

ellipse(320,120,20,20);

ellipse(400,120,20,20);

//Zeile X4
ellipse(80,160,20,20);

ellipse(160,160,20,20);

ellipse(240,160,20,20);

ellipse(320,160,20,20);

ellipse(400,160,20,20);

// Zeile X5
ellipse(80,200,20,20);

ellipse(160,200,20,20);

ellipse(240,200,20,20);

ellipse(320,200,20,20);

ellipse(400,200,20,20);

//Zeile X6
ellipse(80,240,20,20);

ellipse(160,240,20,20);

ellipse(240,240,20,20);

ellipse(320,240,20,20);

ellipse(400,240,20,20);

//Zeile X7
ellipse(80,280,20,20);

ellipse(160,280,20,20);

ellipse(240,280,20,20);

ellipse(320,280,20,20);

ellipse(400,280,20,20);

//Zeile X8
ellipse(80,320,20,20);

ellipse(160,320,20,20);

ellipse(240,320,20,20);

ellipse(320,320,20,20);

ellipse(400,320,20,20);

//Zeile X9
ellipse(80,360,20,20);

ellipse(160,360,20,20);

ellipse(240,360,20,20);

ellipse(320,360,20,20);

ellipse(400,360,20,20);

//Zeile X10
ellipse(80,400,20,20);

ellipse(160,400,20,20);

ellipse(240,400,20,20);

ellipse(320,400,20,20);

ellipse(400,400,20,20);

//Zeile X11
ellipse(80,440,20,20);

ellipse(160,440,20,20);

ellipse(240,440,20,20);

ellipse(320,440,20,20);

ellipse(400,440,20,20);

//Zeile1 Y
pushMatrix();
translate(mouseX/25,0);
ellipse(40,40,20,20);
ellipse(40,80,20,20);
ellipse(40,120,20,20);
ellipse(40,160,20,20);
ellipse(40,200,20,20);
ellipse(40,240,20,20);
ellipse(40,280,20,20);
ellipse(40,320,20,20);
ellipse(40,360,20,20);
ellipse(40,400,20,20);
ellipse(40,440,20,20);
popMatrix();

//Zeile Y2
pushMatrix();
translate(mouseX/25,0);
ellipse(120,40,20,20);
ellipse(120,80,20,20);
ellipse(120,120,20,20);
ellipse(120,160,20,20);
ellipse(120,200,20,20);
ellipse(120,240,20,20);
ellipse(120,280,20,20);
ellipse(120,320,20,20);
ellipse(120,360,20,20);
ellipse(120,400,20,20);
ellipse(120,440,20,20);
popMatrix();

//Zeile Y3
pushMatrix();
translate(mouseX/25,0);
ellipse(200,40,20,20);
ellipse(200,80,20,20);
ellipse(200,120,20,20);
ellipse(200,160,20,20);
ellipse(200,200,20,20);
ellipse(200,240,20,20);
ellipse(200,280,20,20);
ellipse(200,320,20,20);
ellipse(200,360,20,20);
ellipse(200,400,20,20);
ellipse(200,440,20,20);
popMatrix();

//Zeile Y4
pushMatrix();
translate(mouseX/25,0);
ellipse(280,40,20,20);
ellipse(280,80,20,20);
ellipse(280,120,20,20);
ellipse(280,160,20,20);
ellipse(280,200,20,20);
ellipse(280,240,20,20);
ellipse(280,280,20,20);
ellipse(280,320,20,20);
ellipse(280,360,20,20);
ellipse(280,400,20,20);
ellipse(280,440,20,20);
popMatrix();

//Zeile Y5
pushMatrix();
translate(mouseX/25,0);
ellipse(360,40,20,20);
ellipse(360,80,20,20);
ellipse(360,120,20,20);
ellipse(360,160,20,20);
ellipse(360,200,20,20);
ellipse(360,240,20,20);
ellipse(360,280,20,20);
ellipse(360,320,20,20);
ellipse(360,360,20,20);
ellipse(360,400,20,20);
ellipse(360,440,20,20);
popMatrix();

pushMatrix();
translate(450,425);
rectMode(CENTER);
float my_angle = map(mouseX, 0, width, 0, 2*PI);
rotate(my_angle);
fill(255,191,123);
stroke(255,191,123);
rect(0,0,50,50);
popMatrix();

}
