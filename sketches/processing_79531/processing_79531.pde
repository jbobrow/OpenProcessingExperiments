
void setup(){
size(200,200);
}


void draw()
{
rectMode(CENTER);
fill(255,255,255);
strokeWeight(2);
stroke(0);
rect(100,100,20,100);
ellipse(100,70,60,60);
ellipse(85,70,16,32); 
ellipse(115,70,16,32); 
line(90,150,80,160);
line(110,150,120,160);
fill(48,139,206);
noStroke();
ellipse(85+(mouseX-width/2)/18,70+(mouseY-width/2)/10,7,7); 
ellipse(115+(mouseX-width/2)/18,70+(mouseY-width/2)/10,7,7); 



}




