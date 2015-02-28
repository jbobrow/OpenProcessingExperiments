
    // Ellipsen 
    // Michael Reichenbach
    
    float rad_min = 120;
    float rad_max = 30;
    float rad_variable = 0;
    float radx = 1;
    float rady = 1;
    float col_hue = 0;
    float col_sat = 0;
    float posx = 200;
    float posy = 200;
    float speed = 0;
    float vectorx = 0;
    float vectory = 0;
    float speedfactor = 5;
    float anziehung = 0.08;
    float winkel = 0;
    float big_radius = 100;
    
        
     void setup() {
       size(400, 400);
       stroke(1,1,1,15);
       colorMode(HSB, 100);
       background(192, 64, 0);
       frameRate (30);
   
     }

     void draw() {
       col_hue=(col_hue + random(10))%133;
       col_sat=(col_sat + random(10))%255;
       fill (col_hue,166,col_sat,15);
       
       winkel=(winkel + random(6.28))%6.28;
       posx = sin (winkel)*big_radius + 200;
       posy = cos (winkel)*big_radius + 200;
       
       radx = rad_min + sin (rad_variable)*rad_max;
       rady = rad_min + cos (rad_variable)*rad_max;
       
       // radx=random(rad_min,rad_max);
       // rady=random(rad_min,rad_max);
       rad_variable=rad_variable+0.1;
       
       // speed = random (6.28);
       //vectorx = speedfactor * sin (speed) - anziehung * (posx - mouseX) ;
       //vectory = speedfactor * cos (speed) - anziehung * (posy - mouseY);
       //posx = posx + vectorx;
       //posy = posy + vectory;
     
       // ellipse(radx, rady, mouseX, mouseY);
       ellipse(posx,posy,radx, rady);
       
       /* if (frameCount > 300 ) {
         background(192, 64, 0);
         frameCount = 0; 
       }
       */
     }
     
     void mousePressed() {
       background(192, 64, 0);
       posx=mouseX;
       posy=mouseY;
     }

