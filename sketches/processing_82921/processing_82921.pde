
void setup()
{
size(500,500);
background(255);

}

void draw()
{
//forme rose
noStroke();
fill(#ED05A8,40);
beginShape();
vertex(100,250);
vertex(200,250);
vertex(200,150);
vertex(300,150);
vertex(300,250);
vertex(300,250);
vertex(400,250);
vertex(400,350);
vertex(100,350);
endShape();

//forme transparente en contour
stroke(#0244B4,80);
noFill();
beginShape();
vertex(100,50);
vertex(400,50);
vertex(400,450);
vertex(300,450);
vertex(300,150);
vertex(200,150);
vertex(200,450);
vertex(100,450);
vertex(100,50);
endShape();
noLoop();
}


