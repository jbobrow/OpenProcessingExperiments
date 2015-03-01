
float px=1;
void setup (){size(900,900);background(0);}
void draw() 
{ if (mousePressed)ellipse(mouseX, 450, mouseX, 450);fill(240,134,34,5);
rect(mouseX, mouseY+300, mouseX +80, mouseY-300);fill(245,69,59,10);}
