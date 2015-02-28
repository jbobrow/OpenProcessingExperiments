
    float rad_var=1;
    float rad_div = 20;
    float radx = 1;
    float rady = 1;
    float col_hue = 0;
    float col_sat = 0;
    
        
    void setup() {
       size(400, 400);
       stroke(1);
       colorMode(HSB, 100);
       background(192, 64, 0);
    }

		  
     void draw() {
       col_hue=random(128);
       col_sat=random(128);
       fill (col_hue,col_sat,80);
       radx=random(rad_div);
       rady=random(rad_div);
     
       // ellipse(radx, rady, mouseX, mouseY);
       ellipse(mouseX,mouseY,radx, rady);
     }
     
     void mousePressed() {
       background(192, 64, 0);
       radx=1;
       rady=1;
     }

