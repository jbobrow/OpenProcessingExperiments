
int counter;
int colour = 0;

void setup() {  //setup function called initially, only once
    size (400,400);
    smooth();
    fill(colour);
    noStroke();
    background (190);
    noLoop();
}

void draw() {  //draw function loops 
 for ( float y = 0 ; y < height/2 ; y = y+25)
{
    float w = map( y, 0, height/2, width/16, 12 );
    
    for (float x = 0; x < width; x = x+40)
   {
   
    fill(colour);
    ellipse (x+15, y+15, w, w);
    ellipse (x+15, height - y+15, w, w);
    
   }
    colour +=20;
}


}

//decode pattern from Carina Schweitzer 2010
  

  
  

