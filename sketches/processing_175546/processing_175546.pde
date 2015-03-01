
//Wasser
void setup()
{
 size(700,500);
colorMode(HSB,360,100,100); 
}

void draw()
{
 float blue = map(mouseX, 0, width, 100, 60);
 float m = map(mouseX,0, width,5,15);
 
 background(218,39,blue);

 for (int i=0; i<600; i+=200)
{
//Schiffchen
float wave = sin(millis()/100.0+i)*m;
pushMatrix();
translate(i, 340);
fill(360,0,100);
textSize(70);
text("SCH",80,wave);
textSize(70);
text("I", 140, wave-60);
textSize(30);
text("FF", 160, wave-90);
popMatrix();
}


//Wellen

for (int i=0; i<=700; i+=50)
{
float wave = sin(millis()/100.0+i)*m;
pushMatrix();
fill(224,72,69);
textSize(60);
text("W", i,375+wave);
textSize(40);
text("A", i, 395+wave);
textSize(70);
text("S", i+20, 420+wave);
textSize(70);
text("S", i, 450+wave);
textSize(50);
text("E", i+30, 470+wave);
textSize(80);
text("R", i, 520+wave);
popMatrix();
}
} 

