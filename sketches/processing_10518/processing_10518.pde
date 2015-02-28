
size( 600, 600);
//background(#BADECB);
stroke(255);

// aus der mitte zeichnen
int w2=width/2, h2=height/2; 
 
for (int m = 0; m < w2; m = m + 5)
{

stroke(m);
  //line ( m, h2, w2, h2 + m);
line (w2, height - m, w2 - m, h2);
  
  line ( w2, m, h2 - m, w2); 
  
 // line ( w2, h2 + m, width - m, h2);
   line (w2, height- m, w2 + m, h2);
 //line ( w2, h2, w2, height);
  
  line ( w2 + m, h2, w2, m);
  
  
}


int w;    
for ( w = 0; w < width; w = w + 10)
{

stroke(255-w);
  line ( 0, w, w, height);


line (width, height-w, width-w, 0);


line (width, w, width-w, height);

line ( 0, height-w, w, 0);

}



