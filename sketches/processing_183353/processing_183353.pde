
void setup(){
    int w = 400;
    int h = 400;
    int units = 4;
    int unitW = w/units;
    int unitH = h/units;
    //int step = w/ (units*4);

        //var for offsetting
        int offsetAmount = 10;
        int xOffset = 0;
        int yOffset = 0;
        boolean messItup = true;
        
        smooth();
        rectMode(CENTER);
        size(w,h);
        
    for (int i=0; i < units; i++) {
        for (int j=0; j < units; j++) {
            //random fills limited by 2nd argument
            fill(random(200,0), random(50,250), random(200,255));
            //nternal rectangles
            
               /* int xpos = unitW/2 + (unitW*i);
                int ypos = unitW/2 + (unitH*j);
                rect (xpos, ypos, unitW, unitH);
                
                */
                
                

                //inner loop
                
                 if (messItup == true) {
                          xOffset = int(random(-offsetAmount,offsetAmount));
                          yOffset = int(random(-offsetAmount,offsetAmount)); 
                          println (xOffset, yOffset);
                        }
                        
              for (int k=0;k<10;k++) {
                
                      
                        int xpos = unitW/2 + (unitW*i)+ (xOffset*k);
                        int ypos = unitW/2 + (unitH*j)+ (yOffset*k);
                        int size = unitW - (k*10);
                        rect (xpos, ypos, size, size);
                
            }
            
        }
    }
    
}

void draw() {
    
}
