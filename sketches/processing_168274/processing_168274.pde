
void setup()
{
 size(500,500);
 background(255);
 fill(0);
 line(250,0,250,500);
 line(0,250,500,250);
}

void draw()
{
 rectMode(CORNERS);
 rect(0,0,millis()/100.0,250);
 rect(250,0,500,millis()/100.0);
 rect(0,500-millis()/100.0,250,500);
 rect(500-millis()/100.0,250,500,500);
}
