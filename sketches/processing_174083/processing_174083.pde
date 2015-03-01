
//Wasser

void setup()
{
 size(700,500); 
 colorMode(HSB, 360,100,100);
}

void draw()
{

 float blue = map(mouseX, 0, width, 100, 60);
 float m = map(mouseX,0, width,3,15);

background(218,39,blue);

for (int i=0; i<600; i+=150)
{
//Schiffchen
float wave = sin(millis()/100.0+i)*m;
pushMatrix();
translate(i, height/2+5);
fill(360,0,100);
noStroke();
triangle(75,100+wave,50,60+wave,150,100+wave);
triangle(75,100+wave,112,25+wave,150,100+wave);
triangle(75,100+wave,175,60+wave,150,100+wave);
popMatrix();
}


//Wellen

for (int i=0; i<=700; i+=50)
{
  float wave = sin(millis()/100.0+i)*m;
pushMatrix();
fill(224,72,69);
ellipse(i,375+wave,60,60);
strokeWeight(2);
stroke(224,72,69);
//line(i,375,i,600);
popMatrix();
}
rect(0,370,width,height);
}   

