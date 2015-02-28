
float counter = 0;

void setup()
{
size(500, 500);
colorMode(HSB, 360, 100, 100);
}

void draw()

{
  

  
//Hintergrund
pushMatrix();
float b = map(hour(), 0, 24, 100, 0); //0->100 versch helligkeit
background(0, 0, b); 
counter += 0.01;
popMatrix();

//Sekundenzeiger
pushMatrix();
translate(width/2, height/1.7);
float s = map(second(), 0, 60, 0, 2*PI);
rotate(s);
translate(0, -200);
fill(0, 230);
noStroke();
ellipse(0, 0, 60, 60);
popMatrix();

//Minutenzeiger
pushMatrix();
translate(width/2, height/1.8);
float t = map(minute(), 0, 60, 0, 2*PI);
rotate(t);
translate(0, -200);
fill(0, 180);
noStroke();
ellipse(0, 0, 100, 100);
popMatrix();

//Stundenzeiger Körper
pushMatrix();
translate(width/2, height/2);
float u = map(hour(), 0, 12, 0, 2*PI);
rotate(u);
translate(0, -200);
fill(250,80,200);
noStroke();
rect(0, 0, 5, 50);
popMatrix();

//Stundenzeiger Kopf
pushMatrix();
translate(width/2, height/2);
float v = map(hour(), 0, 12, 0, 2*PI);
rotate(v);
translate(0, -200);
fill(250,80,200);
noStroke();
ellipse(0, 0, 25, 25);
popMatrix();
 
//Planet
fill(0, 200);  
ellipse(250, 250, 300, 300);







}



