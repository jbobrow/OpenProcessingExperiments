
void setup()
{
size(600,600);
background(0);
smooth();
stroke(255);
line(0,250,600,250);
}


void draw()
{
  
background(0);

//Variablen
float sek = map(second(),0,60,0,2*PI);
println(sek);
float min = map(minute(),0,60,0,2*PI);
println(min);
float stun = map(hour(),0,12,0,2*PI);
println(stun);

//Sekunden
noStroke();
rectMode(CENTER);
rect(width/2-150,height/2,50+second(),50+second());
fill(120,63,56);


//Minuten
noStroke();
rectMode(CENTER);
rect(width/2,height/2,50+minute(),50+minute());
fill(130,23,56);


//Stunden
noStroke();
rectMode(CENTER);
rect(width/2+150,height/2,50+hour(),50+hour());
fill(180,10,90);
}
