
void setup()
{
  size(550,500);
  rectMode(CENTER);
  noStroke();
}

void draw()
{
background(255);
translate(250,mouseY);
fill(0);

//Reihe1
pushMatrix();
rect(0,0,40,100);
rect(0, 110,40,100);
rect(0,220,40,100);
rect(0,330,40,100);
rect(0,440,40,100);

fill(255);
rectMode(CORNER);
rect(0,20,10,10);
rect(30,70,10,10);

rect(0,130,10,10);
rect(30,180,10,10);

rect(0,240,10,10);
rect(30,290,10,10);

rect(0,350,10,10);
rect(30,400,10,10);

rect(0,460,10,10);
rect(30,510,10,10);
  popMatrix();
  

//Reihe2
translate(-100,mouseY);
fill(0);
pushMatrix();
rect(0,0,40,100);
rect(0, 110,40,100);
rect(0,220,40,100);
rect(0,330,40,100);
rect(0,440,40,100);

fill(255);
rectMode(CORNER);
rect(0,20,10,10);
rect(30,70,10,10);

rect(0,130,10,10);
rect(30,180,10,10);

rect(0,240,10,10);
rect(30,290,10,10);

rect(0,350,10,10);
rect(30,400,10,10);

rect(0,460,10,10);
rect(30,510,10,10);
  popMatrix();


//Reihe3
  translate(200,mouseY);
fill(0);
pushMatrix();
rect(0,0,40,100);
rect(0, 110,40,100);
rect(0,220,40,100);
rect(0,330,40,100);
rect(0,440,40,100);

fill(255);
rectMode(CORNER);
rect(0,20,10,10);
rect(30,70,10,10);

rect(0,130,10,10);
rect(30,180,10,10);

rect(0,240,10,10);
rect(30,290,10,10);

rect(0,350,10,10);
rect(30,400,10,10);

rect(0,460,10,10);
rect(30,510,10,10);
  popMatrix();


//Reihe4
  translate(-300,mouseY);
fill(0);
pushMatrix();
rect(0,0,40,100);
rect(0, 110,40,100);
rect(0,220,40,100);
rect(0,330,40,100);
rect(0,440,40,100);

fill(255);
rectMode(CORNER);
rect(0,20,10,10);
rect(30,70,10,10);

rect(0,130,10,10);
rect(30,180,10,10);

rect(0,240,10,10);
rect(30,290,10,10);

rect(0,350,10,10);
rect(30,400,10,10);

rect(0,460,10,10);
rect(30,510,10,10);
  popMatrix();

  
//Reihe5 
    translate(400,mouseY);
fill(0);
pushMatrix();
rect(0,0,40,100);
rect(0, 110,40,100);
rect(0,220,40,100);
rect(0,330,40,100);
rect(0,440,40,100);

fill(255);
rectMode(CORNER);
rect(0,20,10,10);
rect(30,70,10,10);

rect(0,130,10,10);
rect(30,180,10,10);

rect(0,240,10,10);
rect(30,290,10,10);

rect(0,350,10,10);
rect(30,400,10,10);

rect(0,460,10,10);
rect(30,510,10,10);
  popMatrix();

}
