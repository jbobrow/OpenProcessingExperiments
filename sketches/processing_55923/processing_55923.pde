
    // Ellipsen 
    // Michael Reichenbach
    
    float rad_min = 50;
    float rad_max = 100;
    float radx = 1;
    float rady = 1;
    float col_col = 255;
    float col_hue = 255;
    float col_sat = 255;
    float posx = 200;
    float posy = 200;
    float posx1 = 200;
    float posy1 = 200;
    float speed = 0;
    float vectorx = 0;
    float vectory = 0;
    float speedfactor = 5;
    float anziehung = 0.08;
    float winkel = 0;
    float winkel_delta = random(0.5);
    float winkel2 = 0;
    float winkel2_delta = random(0.5);
    float small_radius = random(200);
    float big_radius = random(200);
    
        
     void setup() {
       size(400, 400);
       stroke(1,1,1,0);
       colorMode(HSB, 100,100,100);
       background(192, 64, 0);
       frameRate (30);
   
     }

     void draw() {
       col_col=(100*winkel)%100;
       // col_hue=(200*winkel)%100;
       // col_sat=(300*winkel)%100;
       
       fill (col_col,col_hue,col_sat);
       stroke (col_col,col_hue,col_sat);
       
       winkel=(winkel + winkel_delta)%6.28;
       winkel2=(winkel2 + winkel2_delta)%6.28;
       
       posx = cos  (winkel)*small_radius + 200;
       posy = sin  (winkel)*small_radius + 200;
       posx1 = cos  (winkel2)*big_radius + 200;
       posy1 = sin  (winkel2)*big_radius + 200;
       
       // radx=random(rad_min,rad_max);
       // rady=random(rad_min,rad_max);
       
       // speed = random (6.28);
       //vectorx = speedfactor * sin (speed) - anziehung * (posx - mouseX) ;
       //vectory = speedfactor * cos (speed) - anziehung * (posy - mouseY);
       //posx = posx + vectorx;
       //posy = posy + vectory;
     
       // ellipse(radx, rady, mouseX, mouseY);
       // ellipse(posx,posy,radx, rady);
       line(200,200,posx,posy);
       line(posx,posy,posx1,posy1);
     }
     
     void mousePressed() {
       background(192, 64, 0);
       posx=mouseX;
       posy=mouseY;
     }

