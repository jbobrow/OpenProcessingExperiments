
int tamx = 20;
void setup()
{
    size(200 , 200);
    background(255);
}
void draw()
{
    
}

void keyPressed()
{
    switch ( key )
    {
    case 'a':
    tamx = 20;
    background(255);
    fill(0);
    ellipse( 100 , 100 , tamx , tamx );
    break;
    case 'b':
    tamx +=10;
    ellipse( 100 , 100 , tamx , tamx );
    break;
    case 'c':
    ellipse( 100 , 100 , tamx , tamx );
    fill(random(255) , random(255) , random(255));
    break;
    }
} 
