

  void setup()
  {
    size(600,600);
    background(255);
    smooth();
   
  }
  

  
  
  void draw()
  {


    
    back (width/2,height/2);
    arm (width/2+250,200);
    body (40, 100);
    kopf(width/2,180);
    mund( 140, 220 );
    augen (width/2,250);

    



  }
  
  
  
  
  
        void back (float x, float y)
  {
  
 //   for (int i=0; i<
   pushStyle();
       fill(#097929);
   background(255);
   
           rect (0,height/2,height,width);
   
   fill(200);
   strokeWeight(3);
  // stroke(random(255),random(255),random(255));
    stroke(150);
       line(mouseX, mouseY,0,height/2);
      line(mouseX, mouseY,width,height/2);
      line(mouseX, mouseY,0,height);
      line(mouseX, mouseY,width,height); 
      ellipse(mouseX,mouseY,20,40);
      ellipse (mouseX,mouseY-10,10,10);
    
    
     if (mouseButton == LEFT){
       stroke (255,0,0);
       strokeWeight(4);
       line(mouseX,mouseY,width/2+random(-15,15),height/2-50);
       strokeWeight(2);
       line(mouseX,mouseY,width/2+random(-15,15),height/2-50);
         line(mouseX,mouseY,width/2+random(-15,15),height/2-50);
  
  
popStyle();
}
  }
  


  
 
  void arm ( float x, float  y)
    { 
      noStroke();
    pushMatrix();
    
  if (mouseButton == LEFT){
    translate (x,y-20);
  } else {
    translate(x,y);
  }
    
    scale (-1,1);
    fill (0); 
    triangle (0,0,170,10,170,-40);
    triangle (0,0,20,40,40,-5);
    popMatrix();
     
    pushMatrix();
    
     if (mouseButton == LEFT){
    translate (x-450,y-20);
  } else {
    translate(x-450,y);}
     
    fill (0); 
    triangle (0,0,170,10,170,-40);
    triangle (0,0,20,40,40,-5);
    popMatrix();
     
    }
    
    
     
  

  
 
    void body (int  x, int y)
{
pushMatrix();
translate(x,y);  // neuer nullpunkt wird gesetzt
  
  
     if (mouseButton == LEFT){
    fill (222,50,0);
    }
    else {
    fill(#79096A);
    }
   
   
  
   noStroke();
    
  beginShape();
vertex( 298.0 , 7.0 );
bezierVertex( 293.0 , 7.0 , 293.34 , 6.88 , 292.0 , 7.0 );
bezierVertex( 290.65 , 7.11 , 288.75 , 7.41 , 287.0 , 8.0 );
bezierVertex( 285.24 , 8.58 , 283.65 , 9.47 , 282.0 , 10.0 );
bezierVertex( 280.34 , 10.52 , 278.62 , 10.7 , 277.0 , 11.0 );
bezierVertex( 275.37 , 11.29 , 273.85 , 11.69 , 273.0 , 12.0 );
bezierVertex( 272.14 , 12.3 , 271.94 , 12.5 , 271.0 , 13.0 );
bezierVertex( 270.05 , 13.49 , 268.35 , 14.27 , 267.0 , 15.0 );
bezierVertex( 265.64 , 15.72 , 264.64 , 16.39 , 264.0 , 17.0 );
bezierVertex( 263.35 , 17.6 , 255.53 , 20.9 , 257.0 , 20.0 );
bezierVertex( 258.46 , 19.09 , 257.8 , 19.42 , 255.0 , 21.0 );
bezierVertex( 252.19 , 22.57 , 247.26 , 25.38 , 242.0 , 29.0 );
bezierVertex( 236.73 , 32.61 , 231.13 , 37.02 , 226.0 , 41.0 );
bezierVertex( 220.86 , 44.97 , 216.17 , 48.49 , 213.0 , 51.0 );
bezierVertex( 209.82 , 53.5 , 208.15 , 54.98 , 207.0 , 56.0 );
bezierVertex( 205.84 , 57.01 , 205.21 , 57.55 , 204.0 , 59.0 );
bezierVertex( 202.78 , 60.44 , 201.0 , 62.78 , 200.0 , 64.0 );
bezierVertex( 198.99 , 65.21 , 198.77 , 65.29 , 198.0 , 66.0 );
bezierVertex( 197.22 , 66.7 , 195.88 , 68.04 , 194.0 , 70.0 );
bezierVertex( 192.11 , 71.95 , 190.23 , 73.17 , 190.0 , 74.0 );
bezierVertex( 189.76 , 74.82 , 188.43 , 76.15 , 186.0 , 78.0 );
bezierVertex( 183.56 , 79.84 , 180.03 , 82.2 , 177.0 , 85.0 );
bezierVertex( 173.96 , 87.79 , 171.43 , 91.03 , 167.0 , 96.0 );
bezierVertex( 162.56 , 100.96 , 156.23 , 107.64 , 152.0 , 112.0 );
bezierVertex( 147.76 , 116.35 , 145.62 , 118.37 , 142.0 , 123.0 );
bezierVertex( 138.37 , 127.62 , 133.26 , 134.85 , 129.0 , 142.0 );
bezierVertex( 124.73 , 149.14 , 121.32 , 156.18 , 119.0 , 161.0 );
bezierVertex( 116.67 , 165.81 , 115.44 , 168.38 , 114.0 , 172.0 );
bezierVertex( 112.55 , 175.61 , 110.88 , 180.28 , 109.0 , 186.0 );
bezierVertex( 107.11 , 191.71 , 105.92 , 189.92 , 104.0 , 202.0 );
bezierVertex( 102.07 , 214.07 , 100.74 , 222.41 , 100.0 , 227.0 );
bezierVertex( 99.25 , 231.58 , 99.1 , 232.42 , 99.0 , 240.0 );
bezierVertex( 98.89 , 247.57 , 98.84 , 261.87 , 99.0 , 269.0 );
bezierVertex( 99.15 , 276.12 , 99.5 , 276.07 , 100.0 , 281.0 );
bezierVertex( 100.49 , 285.92 , 101.11 , 295.82 , 102.0 , 303.0 );
bezierVertex( 102.88 , 310.17 , 104.03 , 314.61 , 107.0 , 325.0 );
bezierVertex( 109.96 , 335.38 , 114.74 , 351.71 , 118.0 , 361.0 );
bezierVertex( 121.25 , 370.28 , 122.97 , 372.54 , 125.0 , 376.0 );
bezierVertex( 127.02 , 379.45 , 129.36 , 384.12 , 132.0 , 390.0 );
bezierVertex( 134.63 , 395.87 , 135.16 , 393.82 , 138.0 , 396.0 );
bezierVertex( 140.83 , 398.17 , 142.83 , 400.17 , 144.0 , 402.0 );
bezierVertex( 145.16 , 403.82 , 145.48 , 405.47 , 147.0 , 407.0 );
bezierVertex( 148.51 , 408.52 , 151.22 , 409.93 , 154.0 , 412.0 );
bezierVertex( 156.77 , 414.06 , 159.62 , 416.8 , 162.0 , 419.0 );
bezierVertex( 164.37 , 421.19 , 166.28 , 422.84 , 169.0 , 425.0 );
bezierVertex( 171.71 , 427.15 , 175.24 , 429.79 , 180.0 , 433.0 );
bezierVertex( 184.75 , 436.2 , 190.75 , 439.96 , 194.0 , 442.0 );
bezierVertex( 197.24 , 444.03 , 197.74 , 444.34 , 202.0 , 446.0 );
bezierVertex( 206.25 , 447.65 , 214.25 , 450.65 , 226.0 , 455.0 );
bezierVertex( 237.74 , 459.34 , 242.27 , 460.93 , 242.0 , 461.0 );
bezierVertex( 241.72 , 461.06 , 243.06 , 461.39 , 246.0 , 462.0 );
bezierVertex( 248.93 , 462.6 , 253.48 , 463.48 , 258.0 , 464.0 );
bezierVertex( 262.51 , 464.51 , 267.0 , 464.67 , 271.0 , 465.0 );
bezierVertex( 274.99 , 465.32 , 278.48 , 465.81 , 285.0 , 466.0 );
bezierVertex( 291.51 , 466.18 , 301.05 , 466.06 , 306.0 , 466.0 );
bezierVertex( 310.94 , 465.93 , 311.3 , 465.93 , 316.0 , 466.0 );
bezierVertex( 320.69 , 466.06 , 329.73 , 466.19 , 335.0 , 466.0 );
bezierVertex( 340.26 , 465.8 , 341.75 , 465.26 , 344.0 , 465.0 );
bezierVertex( 346.24 , 464.73 , 349.24 , 464.73 , 353.0 , 465.0 );
bezierVertex( 356.75 , 465.26 , 372.38 , 458.64 , 374.0 , 458.0 );
bezierVertex( 375.61 , 457.35 , 379.27 , 455.35 , 385.0 , 452.0 );
bezierVertex( 390.72 , 448.64 , 398.5 , 443.93 , 403.0 , 441.0 );
bezierVertex( 407.49 , 438.06 , 408.71 , 436.91 , 411.0 , 435.0 );
bezierVertex( 413.28 , 433.08 , 416.62 , 430.41 , 421.0 , 426.0 );
bezierVertex( 425.37 , 421.58 , 430.77 , 415.44 , 435.0 , 410.0 );
bezierVertex( 439.22 , 404.55 , 442.26 , 399.82 , 446.0 , 393.0 );
bezierVertex( 449.73 , 386.17 , 454.17 , 377.25 , 457.0 , 367.0 );
bezierVertex( 459.82 , 356.74 , 461.05 , 345.13 , 462.0 , 337.0 );
bezierVertex( 462.94 , 328.86 , 463.61 , 324.19 , 464.0 , 323.0 );
bezierVertex( 464.38 , 321.8 , 463.7 , 295.72 , 463.0 , 290.0 );
bezierVertex( 462.29 , 284.27 , 460.62 , 278.27 , 458.0 , 272.0 );
bezierVertex( 455.37 , 265.72 , 451.79 , 259.17 , 447.0 , 251.0 );
bezierVertex( 442.2 , 242.82 , 436.19 , 233.01 , 430.0 , 224.0 );
bezierVertex( 423.8 , 214.98 , 417.4 , 206.77 , 414.0 , 203.0 );
bezierVertex( 410.59 , 199.22 , 410.16 , 199.87 , 408.0 , 198.0 );
bezierVertex( 405.83 , 196.12 , 401.93 , 191.7 , 396.0 , 186.0 );
bezierVertex( 390.06 , 180.29 , 382.1 , 173.29 , 376.0 , 168.0 );
bezierVertex( 369.89 , 162.7 , 365.63 , 159.12 , 359.0 , 154.0 );
bezierVertex( 352.36 , 148.87 , 343.36 , 142.2 , 332.0 , 134.0 );
bezierVertex( 320.63 , 125.79 , 312.81 , 119.0 , 312.0 , 117.0 );
bezierVertex( 311.18 , 114.99 , 309.85 , 113.33 , 308.0 , 112.0 );
bezierVertex( 306.14 , 110.66 , 303.77 , 109.66 , 300.0 , 104.0 );
bezierVertex( 296.22 , 98.33 , 291.05 , 87.99 , 288.0 , 82.0 );
bezierVertex( 284.94 , 76.0 , 284.01 , 74.34 , 283.0 , 72.0 );
bezierVertex( 281.98 , 69.65 , 280.87 , 66.61 , 280.0 , 63.0 );
bezierVertex( 279.12 , 59.38 , 278.49 , 55.18 , 278.0 , 53.0 );
bezierVertex( 277.5 , 50.81 , 277.13 , 50.64 , 277.0 , 50.0 );
bezierVertex( 276.86 , 49.35 , 276.95 , 48.22 , 277.0 , 47.0 );
bezierVertex( 277.04 , 45.77 , 277.04 , 44.43 , 277.0 , 43.0 );
bezierVertex( 276.95 , 41.56 , 277.04 , 37.21 , 279.0 , 33.0 );
bezierVertex( 280.95 , 28.78 , 282.28 , 25.78 , 283.0 , 24.0 );
bezierVertex( 283.71 , 22.21 , 283.8 , 21.63 , 284.0 , 21.0 );
bezierVertex( 284.19 , 20.36 , 284.49 , 19.67 , 285.0 , 19.0 );
bezierVertex( 285.5 , 18.32 , 286.22 , 17.65 , 287.0 , 17.0 );
bezierVertex( 287.77 , 16.34 , 288.6 , 15.7 , 289.0 , 15.0 );
bezierVertex( 289.39 , 14.29 , 289.34 , 13.5 , 290.0 , 13.0 );
bezierVertex( 290.65 , 12.49 , 292.02 , 12.25 , 293.0 , 12.0 );
bezierVertex( 293.97 , 11.74 , 294.54 , 11.47 , 295.0 , 11.0 );
bezierVertex( 295.45 , 10.52 , 295.78 , 9.86 , 296.0 , 9.0 );
bezierVertex( 296.21 , 8.13 , 297.08 , 8.06 , 298.0 , 8.0 );
  endShape();
    
popMatrix();
}
  
  
  
    void kopf(float x, float y)
  {
    
    //KOPF
    shapeMode(CENTER);
    noStroke();
    
    if (mouseButton == LEFT){
      
      
    
      
      
    fill (255,0,0);
    }
    else {
    fill(#860875);
    }
    
    
    ellipse(x,y,250,160);
    rect(x-30,y+50,60,50);
    

    //HUT
    fill(0);
    rotate(radians(-20));
    rect(x-200, y+20, 230,10);
    rect(x-160, y-40, 150,70);

    
  }
  
  
  
  
   void mund ( float x, float y )
    {
      pushMatrix();   // alle werte werden eingefroren
      translate(x,y);  // neuer nullpunkt wird gesetzt
      
      pushStyle();
       strokeWeight(4);
 stroke(255,0,0);
 line (80,100,140,100);
      popStyle();
      

 if (mouseButton == LEFT){


    fill(255,0,0);
      beginShape();
         vertex( 60, 60 );
         bezierVertex( 50, 120,  60, 150,  180, 60 );
      endShape( CLOSE );  


        fill(0);
      beginShape();
         vertex( 60, 60 );
         bezierVertex( 60, 120,  60, 120,  180, 60 );
      endShape( CLOSE );  





    
   fill(255);    //zähne
      triangle(60,60,70,80,80,60); 
      triangle(80,60,90,70,100,60); 
      triangle(100,60,110,75,120,60); 
      triangle(120,60,130,82,140,60); 
      triangle(140,60,150,70,160,60); 
 }
 

     
       
      popMatrix();   // alle werte werden wieder zurückgesetzt
      
      
    }
    
    
    void augen ( float x, float  y )
{
    auge(x - 20, y, 30, 30);
    auge(x + 20, y, 30, 30);
}

void auge ( float pos1, float pos2, float rad1, float rad2)
{
    pushStyle();
    pushMatrix();
    noStroke();
    ellipse( pos1, pos2, rad1, rad2);
   fill(random (100), 0, 0 );
    stroke(255, 230, 0);
  
    float a = atan2( mouseY-pos2, mouseX-pos1 );
    float d = dist( mouseX, mouseY, pos1, pos2 );
    translate( pos1, pos2 );
    rotate(a);
    translate( d / 20, 0 );
     
    ellipse( 0,0, rad1/3, rad2/3 );
    popMatrix();
    popStyle();
}
  


  

