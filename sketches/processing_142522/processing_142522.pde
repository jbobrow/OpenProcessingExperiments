
void setup()
{
size(500, 500, P3D);
noFill();
background(223,223,223);
}

void draw()
{
 background(223,223,223);
directionalLight(255, 255, 255, -1, 1, -1);
translate(width/2, height/2);
//translate(mouseX, mouseY);
//translate(second(), 255);
float winkel = map(0,mouseY, 500, 0, 2*PI);
float helligkeit = map(mouseX, 0, 500, 0, 255);
float pos = map(second(), 0,50, 0, 100);
float rot = map(second(), 0,59, 0, 360);

rotateY(winkel);
rotateZ(winkel);
//fill (225-helligkeit);

//Umgebung
pushMatrix();
stroke (helligkeit, mouseX, 80);
//translate(pos,height/2);//schrift ausserhalb
translate(pos,10);//am weiÃ�ï¿½en Viereck entlang
fill(255,0,0);
text("VERLIERE NICHT DEINE",-100,-100);
text("ORIENTIERUNG",-100,-70);
//rect(-100,-100,60,60);
rotate(pos);
popMatrix();

pushMatrix();
rectMode(CENTER);
//innere Box
noStroke();
fill(255,255,255,100);
box(mouseX, 100, 100);
//aeussere Box
noStroke();
fill(255,0,0,95);
box(200, 200, 200);
popMatrix();

//println(mouseX);

//S fÃ�Â¼r SÃ�Â¼den
//rechts vom Cubus
fill(255,255,255);
stroke(helligkeit, 70, 40);
rect(100,100,10,10);
rect(120,100,10,10);
rect(140,100,10,10);
rect(120,80,10,10);
rect(120,100,10,10);
rect(120,120,10,10);
rect(140,120,10,10);

//links und unterhalb des cubus
rect(80,120,10,10);
rect(60,120,10,10);
rect(80,140,10,10);
rect(60,140,10,10);
rect(80,160,10,10);
rect(100,160,10,10);
rect(100,180,10,10);
rect(120,180,10,10);
rect(140,180,10,10);
rect(140,200,10,10);
rect(120,200,10,10);
rect(140,220,10,10);
rect(120,220,10,10);
rect(120,240,10,10);
rect(100,240,10,10);
rect(80,240,10,10);
rect(80,220,10,10);
rect(60,220,10,10);
rect(80,200,10,10);
rect(60,200,10,10);

}
