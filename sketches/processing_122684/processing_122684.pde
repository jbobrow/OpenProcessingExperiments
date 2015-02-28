


void setup()
{
size (500,500);

}
void draw()
{
background(255);
if(hour()>=16)
{background(44,66,137);
}
else if(hour()>=8)
{background(118,211,255);
}
if(hour()>=0 && hour()<8)
{background(44,66,137);
}

pushMatrix();
translate(0,0);
fill(0);
rotate (radians(45));
rect(0,0,356,356);
popMatrix();
resetMatrix();
pushMatrix();
translate(500,0);
rotate(radians(45));
rect(0,0,356,356);
popMatrix();
resetMatrix();
pushMatrix();
translate(0,500);
rotate(radians(-45));
rect(0,0,356,356);
popMatrix();
resetMatrix();

noStroke();

fill(255,255,0);
ellipse(250,60,70,70);

if(hour()>=0 && hour()<8)
{fill(44,66,137);
}
else if(hour()>=16)
  {fill(44,66,137);}
else
{noFill();
}
ellipse(267,60,60,60);

fill(40,40,60);
float x= map(second(),0,59,0,235);
rect(x,x,15,15);
translate(470, 0);
fill(40,40,60);
float y=map(minute(),0,59,0,220);
rect(-y,y,30,30);
translate(-470,358);
if(hour()>=16)
{fill(40,127,31);}

else if(hour()>=8)
{fill(255,0,0);}

if(hour()>=0 && hour()<8)
{fill(40,127,31);}
float z=map(hour(),0,24,0,500);
ellipse(z,0,18,50);

}


