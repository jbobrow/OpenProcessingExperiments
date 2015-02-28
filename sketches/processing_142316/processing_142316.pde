
// Thema 8, Grafik Java Applet
// Schulinformatik
// Roland Richter
// Implementiert in Processing (http://processing.org)

void setup() 
{
    size(400, 400);
}


void draw()
{
    background(255);
    
    for (int i = 0; i < 20; ++i) {
        line(0, 400 - 20*i, 20*i, 0);
        line(0, 20*i, 20*i, 400);
        line(20*i, 0, 400, 20*i);
        line(20*i, 400, 400, 400 - 20*i);
    }
}



