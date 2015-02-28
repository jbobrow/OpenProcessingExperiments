
void setup(){
 size(500,500);
 background(0);
 
}

void draw(){
 background(0);
float recht = map(mouseX, 500,0, 0, 250);
fill(255);
rect(100,100,50,50);
rect(170+recht,100,50,50);
rect(170+recht/3,170+recht/5,50,50);
rect(100,170+recht,50,50);

float kreis = map(mouseY, 500,0, 0, 280);
fill(#FF7315);
noStroke();
ellipse(400,400,50,50);
ellipse(330-kreis/7,400-kreis/6,50,50);
ellipse(330-kreis,330-kreis/4,50,50);
ellipse(400-kreis/4,330-kreis,50,50);

}
