
size (400,400);
background (255);
strokeWeight(2);

for ( float i = 0; i < height; i = i + width/4 )
{
    rect( 0, i, width/4, height/4 );
}

for ( float i = 0; i < height; i = i + width/8 )
{
    rect( width/4, i, width/4, height/8 );
}

for ( float i = 0; i < height; i = i + width/16 )
{
    rect( width/2, i, width/4, height/16 );
}

for ( float i = 0; i < height; i = i + width/32.0 )
{
    rect( (width/4.0)*3, i, width/4.0, height/32.0 );
}


