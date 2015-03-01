
void setup(){
    int w = 400;
    int h = 400;
    int units = 4;
    int unitW = w/units;
    int unitH = h/units;
    smooth();
    rectMode(CENTER);
    size(w,h);

       /*    //var for offsetting
        int offsetAmount = 15;
        int xOffset = 0;
        int yOffset = 0;
        boolean messItup = true;
        
       */
        
        
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
              for (int k=0;k<10;k++) {
                        int xpos = unitW/2 + (unitW*i)+ (-10*k);
                        int ypos = unitW/2 + (unitH*j)+ ( 10*k);
                        int size = unitW - (k*10);
                        rect (xpos, ypos, size, size);
                
            }
            
        }
    }
    
}

void draw() {
    
}
