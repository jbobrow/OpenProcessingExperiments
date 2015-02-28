
int counter;



size(200,200);background(255); for( int x=0; x<10; x++ ) {   for( int y=0; y<10; y++ ) {     if( (x+y)%2 == 0 ) {       fill(0);     } else {       fill(255);     }     ellipse(10+20*x, 10+20*y, 10, 10);   } }

