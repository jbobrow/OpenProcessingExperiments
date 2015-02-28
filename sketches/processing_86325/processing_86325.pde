
void setup()
{    size( 400, 400 );
   }

void draw()
{
    background(#D83737,213);
    smooth();

   
    noStroke();
        for ( int posx = 25; posx<=400; posx = posx+50)
    for (int posy = 25;posy<=400;posy = posy+50 ) 
    { fill(255);
       ellipse(posx,posy,50,50);
       fill(#D83737,213);
        rect(posx,posy,25,25);
        fill(0);
               
    }
}


