
// Patrícia e Thais 
//Padrão
int y=10;
int x=100;

void setup()
{
size(200,200);

background(110,5,180);

}
 
void draw()
{
fill(247,228,75);
for(x=0;x<200;x=x+20)
{
ellipse(x,y,50,15);
}
y=y+25;
}
