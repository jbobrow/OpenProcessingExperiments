
float counter = 0;
float amplitude = map(sin(counter),-1,1,1,10);

void setup()
{
size(500,500);
background(255);
}

void draw()
{
background(255);

pushMatrix();
translate(width/2+110,height/2);
stroke(0);
ellipse(0,0,200,200);
fill(amplitude,100,200);
popMatrix();

pushMatrix();

translate(width/2+110,height/2);
ellipse(0,0,25+sin(mouseY)*100,25+sin(mouseY)*100);
println(sin(counter));
fill(255);
counter += 0.01;
stroke(0);
popMatrix();

pushMatrix();
translate(width/2-110,height/2);
stroke(0);
ellipse(0,0,200,200);
fill(amplitude,100,200);
popMatrix();

pushMatrix();

translate(width/2-110,height/2);
ellipse(0,0,25+sin(mouseY)*100,25+sin(mouseY)*100);
println(sin(counter));
fill(255);
counter += 0.01;
stroke(0);
popMatrix();


}

