
void setup()
{size(500,500);

}

void draw()
{
noStroke();
background(0);
fill(255);
//3e ligne
//forme 2 en haut à gauche
stroke(255);
strokeCap(ROUND);
strokeWeight(1);
noFill();
arc(160,250,40,40,PI,PI/2+PI);
arc(160,250,40,40,PI/2,PI);
arc(180,250,40,40,PI,PI/2+PI);
arc(160,250,40,40,0,PI/2);


arc(220,250,40,40,PI,PI/2+PI);
arc(200,250,40,40,0,PI/2);
arc(240,250,40,40,PI,PI/2+PI);
arc(220,250,40,40,0,PI/2);

//forme5
arc(280,250,40,40,PI,PI/2+PI);
arc(280,270,40,40,PI,PI/2+PI);
arc(280,230,40,40,0,PI/2);
arc(300,250,40,40,PI/2,PI);
//forme6
arc(340,250,40,40,PI,PI/2+PI);
arc(340,270,40,40,PI,PI/2+PI);
arc(360,250,40,40,PI,PI/2+PI);
arc(360,250,40,40,PI/2,PI);

}



