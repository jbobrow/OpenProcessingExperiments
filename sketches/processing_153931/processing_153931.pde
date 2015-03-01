
size(600, 600);
background( 50, 0, 200 );
rectMode(CENTER); 
float gradi=0;
 
 for (int y=0; y<=height; y+=40)
 {
 for (int x=0; x<=width; x+=40)
 {
 gradi += 0.020;
 resetMatrix();
 translate( x,y );
 rotate( gradi );
 fill (random(2,200), random(0,200), random (0,200),100);
 triangle( 1.5,3, 10,10, 10,20);
 }
}



