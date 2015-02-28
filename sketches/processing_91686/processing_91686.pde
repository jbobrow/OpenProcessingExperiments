
/*
MONZ COLOUR PALLETE
https://kuler.adobe.com/
*/

int colors = 5;
int scaler = 80;

Powertheme test;
color[] pall = new color[ colors ];

void setup()
{
size(400,400); 
smooth();
test = new Powertheme();

    pall[0] = test.shade1;
    pall[1] = test.shade2;
    pall[2] = test.shade3;
    pall[3] = test.shade4;
    pall[4] = test.shade5;

}


void draw()
{
for( int i = 0; i < 5; i++ ){
    fill( pall[i] ); 
    noStroke();
    rect( 0, i * scaler, width, scaler ); 
}
}



class Powertheme
{
    color shade1; 
    color shade2; 
    color shade3; 
    color shade4; 
    color shade5;

Powertheme()
{
    shade1 = color( 232, 84, 36 ); 
    shade2 = color( 255, 200, 98 ); 
    shade3 = color( 255, 52, 181 ); 
    shade4 = color( 112, 36, 232 ); 
    shade5 = color( 39, 127, 255 ); 
} 
}
