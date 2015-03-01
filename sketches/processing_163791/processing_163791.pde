
 //PShader blur;
void setup()
{
size(1000,1000);
frameRate(10);
//blur = loadShader("blur.glsl");
}

void draw()
{
stroke(255);
strokeWeight(3);
background(0);
for(int i=0; i<1000; i+=20)
{
float x = random(width);
float y = random(height);
float size = random(20,30);
line(x,y,x,y+size);

}
if(mousePressed)
{
fill(0,0,0,150);
ellipse(mouseX,mouseY, 300,300);
}

}
