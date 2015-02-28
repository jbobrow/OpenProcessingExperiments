
void setup()
{
// taille
size(700,700);
}

void draw()
{

// Toujours centrer
// translate(width/2, height/2);

if (mousePressed) {
// option de tourné sur sois meme la forme

pushMatrix();
strokeWeight(1.0);
noFill();
stroke(1);
translate(mouseX,mouseY);
rotate(3);
quad(0, 0, 10, 30, 40, 35, 55, 60);

popMatrix();

}
}
