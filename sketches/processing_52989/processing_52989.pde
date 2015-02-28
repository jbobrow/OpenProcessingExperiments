
float n   = 7;
float t = 0;
int vr=9;

void setup()
        {
            size(400, 400,P2D);
            background( 0 );
            colorMode( HSB, vr, 1, 1,1 );
        }
void draw()
        {
          //frameRate(90);// : )
            if(mousePressed){
           saveFrame();   
              //background( 0 );
            }
            fill(0,0.008);
            rect(0,0,400,400);
            rect(0,0,400,400);
    noFill();        
            curve(1.4);
            curve(1);
            
        }
        
void curve(float d){
 stroke( t, 1, 0.75,0.6 );
           fill( 0, 0.016 );
           
            strokeWeight(random(0,1.4));
            beginShape();
            curveVertex( -100, 0 );
            for( int i=0; i<=n; i++ ) {
                float xx = i * height / n;
                //noiseDetail(16);
                noiseSeed(0);
                float yy = noise( i * 0.4, t*d ) * 400 ;
                curveVertex(xx, yy );
            }
            curveVertex( height+100, 0 );
            endShape();         
            //<-- como el rango de color que le dimos al rojo va hasta 2 debemos "actualizar" cada 2
            //se cambio a 9 y se definio como variable            
            t=t>vr?0:t+0.005; 
}
        
                    
