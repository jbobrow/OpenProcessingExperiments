
void setup() {
size(500, 500);
}
 
void draw() {
background(0, 0, 0);




float disX = 25;

for (int x = 0; x<=20; x++)
{

  stroke (17, 209, 169);
  line(x * disX, 0, mouseX, mouseY);
  line (x* disX, 500, mouseX, mouseY);
}

}          
                
