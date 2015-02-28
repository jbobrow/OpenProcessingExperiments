

void setup()
{
size (400,400);
background (255);
smooth();
stroke(120,2);
}

void draw ()
{
  
  
// vertikale linien  
for ( float i = 0; i <= width; i = i + width/4 )
{
    line( i, 0, i, height );
}


// erste spalte
for (float i=0; i <= height; i= i+height/4)
{
line (0,i,100,i);
}


// zweite spalte
for (float i=0; i <= height; i= i+height/8.0)
{
line (100,i,200,i);
}

// dritte spalte
for (float i=0; i <= height; i= i+height/16.0)
{
line (200,i,300,i);
}

// vierte spalte
for (float i=0; i <= height; i= i+height/32.0)
{
line (300,i,400,i);
}



}




