
int x,y,counter=100;

void setup()
{
size (500,500);
}

void draw()
{
background(20,150,210);
fill(78,189,28);
textSize(20);
text("Click until the counter hits 0", width/2, 20);
textAlign(CENTER,TOP);
fill(189,78,28);
textSize(50);
text(counter, mouseX, mouseY); 
win();
stayAtZero();
}

void mouseClicked()
{
counter -= 1;
}

void win()
{
if (counter == 0)
{
fill(189,78,28);
textSize(50);
text("YOU WIN!!!!!!", width/2, height/2);
textAlign(CENTER,CENTER);
}
}

void stayAtZero()
{
if (counter < 0)
{
counter = 0;
win();
}
}


