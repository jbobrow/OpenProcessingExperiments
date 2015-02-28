
void setup (){
size (200,200);
}
void draw()
{
background(98,250,122);
strokeWeight (2);
stroke (14,95,27);
for (int mouseX=1; mouseX <300; mouseX=mouseX+45) 
for (int mouseY= 1; mouseY <300; mouseY= mouseY+45)
line(1,1, mouseX, mouseY);
}
