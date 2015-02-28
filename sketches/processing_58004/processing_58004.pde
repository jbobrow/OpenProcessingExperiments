
float[] x = new float[40];
String buff = "";
int val = 0;


void setup(){

   size( 1200, 160);
   noStroke();
   smooth();
   fill( 255, 200 );
        for( int i= 8; i<x.length; i++ ){
         x[i] = random( -2000, 600);
     

        }
        

        
}


void draw(){
      
         ellipse(1000,120,300,300);
        background(0);

        for( int i=0; i< x.length; i++ ){
                x[i] += .7;
                float y = i*.9;
                arc( x[i], y, 22, 22, .42, 5.96 );
                fill(#F70000);
       
       
ellipse(1200,40,300,300);
fill(255);

text("Kill it!",mouseX,mouseY);

}

}




