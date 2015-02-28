
//Derek King, Rotating Cube, CP1 mods 14-15
//http://dereklucca.webs.com/Rotating Cube.html

void setup()
{  
size(400, 400, P3D);
}

void draw()
{
background(0);
camera(3*mouseX-400,3*mouseY-400,200,0,0,0,0,1,0);
stroke(random(256));
fill(random(256),random(250),random(256));
box(120);
sphere(random(600));

}
