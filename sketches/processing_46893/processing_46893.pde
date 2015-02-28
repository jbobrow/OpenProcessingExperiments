
void setup() { 
 size(800,600);
 background(255);
 loadPixels();
}

void draw(){
 int width=800;
 int height=600;
 double left=-3;
 double right=1;
 double top=1.5;
 double bottom=-1.5;
 
 double x2, y2, abstand, xAchse, yAchse, xScale, yScale, x3, y3, xAux;
 int farbe;
            
        xAchse = right-left;
        yAchse = top-bottom;

        // scale function
        xScale = xAchse / width;
        yScale = yAchse / height;  
        
        for (int y = 0; y < height; y++) {

            for (int x = 0; x < width; x++) {

                // scale from coordinates to pixels            
                x2 = x * xScale + left;
                y2 = y * yScale - top;
                x3 = 0;
                y3 = 0;
                
                farbe=0;

                
                // jump until distance to origin is > 3
                for (int i = 0; i < 255; i++) {

                    xAux = x3 * x3 - y3 * y3 + x2;
                    y3 = 2 * x3 * y3 + y2;
                    x3 = xAux;
                    
                    abstand = Math.sqrt((x3 * x3) + (y3 * y3));

                    if (abstand > 3.0) {

                        // set brightness to number of iterations
                        // break the loop as soon as there is a point > 3
                        farbe = i*16;
                        break;
                    } 
                }
                
                pixels[x+y*width] = color(farbe);

            }

        } updatePixels();
        
}

