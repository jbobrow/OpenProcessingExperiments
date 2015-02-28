
    // Ellipsen 
    // Michael Reichenbach
    
    // float rad_min = 50;
    // float rad_max = 100;
    float active = 1;
    float radx = 1;
    float rady = 1;
    float col_col = 255;
    float col_hue = 255;
    float col_sat = 255;
    float posx = 200;
    float posy = 200;
    float posx1 = 200;
    float posy1 = 200;
    // float speed = 0;
    // float vectorx = 0;
    // float vectory = 0;
    float speedfactor = 5;
    float anziehung = 0.08;
    float winkel = 0;
    float winkel_delta = random(0.5);
    float winkel2 = 0;
    float winkel2_delta = random(0.5);
    float small_radius = random(200);
    float big_radius = random(200);
    float col_factor = random(1,100);
    
        
     void setup() {
       size(400, 400);
       stroke(1,1,1,0);
       colorMode(HSB, 100,100,100);
       background(192, 64, 0);
       // frameRate (30);
   
     }

     void draw() {
       winkel=(winkel + active*winkel_delta*mouseX/200)%6.28;
       winkel2=(winkel2 + active*winkel2_delta*mouseY/200)%6.28;
       
       col_col=(col_factor*winkel)%100;
       stroke (col_col,col_hue,col_sat);
       posx = cos  (winkel)*small_radius + 200;
       posy = sin  (winkel)*small_radius + 200;
       line(200,200,posx,posy);
       
       col_col=(col_factor*winkel2)%100;
       stroke (col_col,col_hue,col_sat);
       posx1 = cos  (winkel2)*big_radius + 200;
       posy1 = sin  (winkel2)*big_radius + 200;
       line(posx,posy,posx1,posy1);
           
       
     }
     
     void mousePressed() {
       // background(192, 64, 0);
       if ( active == 1) { active = 0 ;}
       else { background(random(255), 64, 10); active = 1;};
       posx=mouseX;
       posy=mouseY;
     }

