
MyCircle [] c = new MyCircle[10];

void setup()
{
 size(500,500); 
 
for (int i = 0; i < 10; i++)
{
   PVector center = new PVector(random(500),random(500),0);
 c [i]= new MyCircle(center, 15, 154, 154, 154);
}
}

void draw()
{
 background(255);
//c.Move(mouseX, mouseY);
for (int i = 0; i < 10; i++)
{
 c[i].Update(2.0);
 int col = (int) c[i].center.y*255/500;
 c[i].ChangeColor(col,255-col,128-col);
 c[i].ChangeThickness(random(0,10));
 c[i].Grow(2);
 c[i].Draw();

}
}

