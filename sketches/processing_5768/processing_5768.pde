
int i;
float chgcolor, r, g, b;
color n;
color o;

 void setup ()
 {
     size( 600, 600 );
     background (0);
     chgcolor=0;
     r = random (255);
     g = random (255);
     b = random (255);
     
     n = color (r, g, b);
     o = color (255-r, 255-g, 255-b);
 }
 
 void draw ()
 {
     smooth();
     noStroke();
     
     if (keyPressed){
     switch (key){
     case ' ': background(0);
     break;
     }
   }
     
     if (mousePressed){
     spiral( mouseX, mouseY, 10, 5, 150 );
     }
     
     else {      
     i = 0;
     
     float r = random (255);
     float g = random (255);
     float b = random (255);
     
     n = color (r, g, b);
     o = color (255-r, 255-g, 255-b);
     chgcolor=0;
   }
   
 }
 
 void spiral ( float x, float y, int turns, float inner_radius, float outer_radius  )
 {

     
     color c = lerpColor (n, o, chgcolor);
     
     fill (c);
     
     float total_degree = 360 * turns;
     
     int inc = 20;
     
     float a = radians( i );
     
     float d = map( i, 0, total_degree, inner_radius, outer_radius );
         
     ellipse ( x + cos(a)*d, y + sin(a)*d, 5+d/inc, 5+d/inc );
     
     i += inc;
     
     chgcolor += 0.005;
     
     if (chgcolor >=1){
       
       chgcolor=1;
     }
     
     }
     
    

