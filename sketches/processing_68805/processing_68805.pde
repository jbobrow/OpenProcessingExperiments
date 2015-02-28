

float x2;
float y2;

int clicked =-1;

void setup()
{
 background(20,42,67);
 size(500,500); 
 smooth();
}

void draw()
{
 //background(mouseX/2, mouseY/2, mouseY/2, mouseX/2);
 // rect(0,mouseY,width,1);
 //stroke(mouseX/2, mouseY/2, random(255));
 stroke(mouseX/2, random(255), mouseY/2, 80);
//if (clicked==1)
 //{
    line( mouseX,mouseY,x2,y2);
 //}
}

void mouseClicked()
{
   x2=random(255);
   y2=random(255);
   clicked*=-1;
}

