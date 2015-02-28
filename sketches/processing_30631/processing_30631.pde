
size (450,450);
smooth();
fill(0);
background (#FF086F);
rectMode (CENTER);
 
//quadrados do meio
for ( float y = 0 ; y < height/2 ; y = y+30)
{
  //quadrados superiores e inferiores
    float w = map( y, 0, height/2, width/20, 15 );
    //espaçamento dos quadrados
    for (float x = 0; x < width; x = x+30)
   
   {
    fill(0);
    //alinhamento dos quadrados do meio esq
    rect (x+15, y+15, w, w);
    //alinhamento dos quadrados do meio dir 
    rect (x+15, height - y+15, w, w);
   }
}

                
                
