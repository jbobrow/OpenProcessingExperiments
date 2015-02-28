
float rot = 0;
float rot_inc = 0.05;

void setup ()              
{
  size(screen.width, screen.height);      
  smooth();    
  noFill();
  strokeWeight( 0.4);  
}


void draw ()                
{
     int grid_size  = width/5; 
     background(255 );                                            
    
     rot = 0;

     translate( width/2, height/2);                 
     scale(5);
     
     for ( float iy = 0.2; iy <= (2*PI); iy= iy+0.05 )             
     {
            pushMatrix();                                

               stroke(sin(4*iy)*255, cos(3*iy)*255, 0);
               rotate(rot);
               
               float x = map(mouseX, 0, width, 0, 1)*(grid_size/3);
               float y = sqrt((iy*iy)*map(mouseY, 0, height, 0, grid_size));  
               
               ellipse(0, 0, x, y );
               ellipse(0, 0, y, x );
               
               rot += rot_inc;
                
            popMatrix();                              
     }                              
}

void mousePressed ()   
{
    rot_inc = random(1);            // set new rotation 
}


