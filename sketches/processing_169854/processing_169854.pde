
void setup()
{
 size(500,500);
background(255);
}

void draw()
{
 translate(width/2, height/2);
 background(255);
 stroke(0);
 strokeWeight(1);
 ellipse(0, 0, 400, 400);
 
 pushMatrix();                      //Ziffernstiche
 for (int i=0; i<12; i++)
 {
   line(0,-200, 0,-180);
   rotate(PI/6);
 }
 popMatrix();
 




pushMatrix();                      //STUNDENZEIGER

float stunde = map(hour(), 0, (23,75), 0, 4*PI);
rotate(stunde);
stroke(0,255,0);
strokeWeight(10);
line(0,0,0,-80);
popMatrix();


pushMatrix();                      //MINUTENZEIGER

float minuten = map(minute(), 0, 60, 0, 2*PI);

rotate(minuten);
stroke(255, 0, 0);
strokeWeight(4); 
line(0,0, 0, -150);
popMatrix();

pushMatrix();                       //SEKUNDENZEIGER


float sekunde = map(second(), 0, 60, 0, 2*PI);

rotate(sekunde);
stroke(0,0,255);
strokeWeight(1);
line(0,0, 0, -180);           
popMatrix();
}


