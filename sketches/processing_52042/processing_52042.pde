


float v;

void setup()
{
  size(500,500);
  smooth();
}

void draw()
{
 background(255); 

v = 30 +(mouseX/5.0);
print(v);

float v2 = map(v,30, 150, 0,120);

/*lefteye*/
noStroke();
fill(v2);
rect(100,50, v,v*.10);
rect(200, 50, v*.10,v);
ellipse(190,70, v*.20,v*.20);

/*righteye*/
noStroke();
fill(v2);
rect(300,50, v,v*.10);
rect(300,50, v*.10,v);
ellipse(320,70, v*.20,v*.20);

/*mustachee*/
rect(80,150, 350,v*.10);
ellipse(105,150, v*.50,v*.20);
ellipse(405,150, v*.50,v*.20);

/*mouth*/
rect(200,150, v*.10,v*.80);
rect(300,150, v*.10,v*.80);
rect(200,230, v*1.1,v*.10);

/*chin*/
rect(200,400, v*1.1,v*.10);
}

