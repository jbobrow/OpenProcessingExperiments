
int counter;
void setup ()
{
size(800,444);
background(254,132,123);
}

void draw ()
{
for (int i=30; i < 122; i=i+30)
 {
  line(50,i,mouseX,mouseY);
 }
} 
