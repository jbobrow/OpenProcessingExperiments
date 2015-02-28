
               
                
void setup()
{
size (400,400);
background(255);
smooth();

fill(255,0,0);
ellipse(width/2, height/2,20,20);



}

void draw()
{
if (keyPressed){
if (key == ' '){
saveFrame("line-####.jpg");
background(255);

}
}


fill(255,255,0);
line(pmouseX, pmouseY,mouseY,mouseY);

}
