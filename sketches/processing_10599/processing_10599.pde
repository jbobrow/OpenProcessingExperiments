
/*
*    jeha!
*
*    
*/



    void setup ()
    {
        size( 600, 900 );
        background(255);
        smooth();
    }
    
    
    void draw ()
    {    
        background(255);
        kopf(400,120);
        mund( 300, 70 );
        augen(415,115);
        arm(10,280);
       
         beine(30,260);
        torso(340,190);
     
        
      
        
    }
    float noiseScale=0.002;
    float ypos = 80; 
    float speed1 = 1.1; 
    float speed2 = 2.1;
    int yposdown = 80; 
    boolean checkup = true; 
    PShape fuss_links;
    PShape fuss_rechts;
   
    
    // eine "eigene" funktion
    // nimmt 4 float-werte an
    // gibt nichts zurück ("void")
    
    void mund ( float x, float y )
    {
      pushMatrix();   // alle werte werden eingefroren
      translate(x,y);  // neuer nullpunkt wird gesetzt
      stroke(0);



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
     
       
       
      popMatrix();   // alle werte werden wieder zurückgesetzt
      
      

  
    }
    
    
    





  /* KOPF */
  
  void kopf (float xkopf, float ykopf)
  {
    
    //KOPF 2
    shapeMode(CENTER);
    noStroke();
    fill(100);
    ellipse(xkopf,ykopf,250,160);
    rect(xkopf-30,ykopf+50,60,50);
    
    
    //HUT
    pushMatrix();
    fill(0);
    translate(xkopf+30,ykopf-110);
    rotate(radians(-20));
    rect(-200, 20, 230,10);
    rect(-160, -40, 150,70);
    popMatrix();
    
    
  }
  
    
    void augen ( float x , float y)
    {
      
       float x1_left = x - 20;
       float y1_left = y - 20;
       float x1_right = x + 20;
       float y1_right = y - 20;
       float x2_left = 10, y2_left = 10;
       float x2_right = 10, y2_right = 10;
       float x2_eye_size = 20, y2_eye_size = 40;
      
      pushMatrix();
      fill(255);
          ellipse(x1_left, y1_left, x2_left+x2_eye_size, y2_left+y2_eye_size);
          ellipse(x1_right, y1_right, x2_right+x2_eye_size, y2_right+y2_eye_size);
          
      fill(0);  
        translate(random((-x2_left + (1/1.6)), (y2_left - (1/1.6))), random((-x2_right + (1/1.6)), (y2_right - (1/1.6))));
          ellipse( x1_left, y1_left, x2_left, y2_left );
          ellipse( x1_right, y1_right, x2_right, y2_right ); 
      popMatrix();
    }
    

  
  
  
 void torso(float x1,float y1)
    {
      pushMatrix();
     strokeWeight(1);
        stroke(0);
   
      noiseScale = noiseScale + .01;
    float n = noise(noiseScale);
    float f = cos(n)*40;
    float e = sin(n)*40;
    float d = f/2;
    float g = e/2;
    
    translate(x1,y1);
    fill(240-f,205+e,140);
//becken
 beginShape();
vertex( 13.0 , 176.0 );
bezierVertex( 2.0 , 195.0 , -10.0 , 218.0 , 3.0 , 236.0 );
bezierVertex( 3.0 , 236.0 , 26.0 , 257.0 , 63.0 , 242.0 );
bezierVertex( 63.0 , 242.0 , 109.0 , 253.0 , 125.0 , 233.0 );
bezierVertex( 125.0 , 233.0 , 144.0 , 205.0 , 111.0 , 173.0 );
endShape();
//torso
 beginShape();
vertex( 18.0 , 30.0 );
bezierVertex( 47.0 , 4.0 , 70.0 , 4.0 , 101.0 , 30.0 );
bezierVertex( 101.0 , 30.0 , 115.0 , 39.0 , 110.0 , 66.0 );
bezierVertex( 110.0+d , 66.0+g , 166.0+d , 108.0+g , 145.0+d , 159.0+g );
bezierVertex( 145.0+d , 159.0+g , 134.0+d , 192.0+g , 111.0+d , 206.0+g );
bezierVertex( 111.0+d , 206.0+g , 64.0+d, 235.0+g , 18.0+d , 207.0+g );
bezierVertex( 18.0-d , 207.0-g , -16.0-d , 179.0-g , -20.0-d , 157.0-g );
bezierVertex( -20.0-d , 157.0-g , -32.0-d , 93.0-g , 13.0 , 69.0 );
bezierVertex( 13.0 , 69.0 , -1.0 , 35.0 , 19.0 , 31.0 );
endShape();
 //nabel
 bezier( 59.0 , 135.0 , 52.0 , 145.0 , 70.0 , 146.0 , 60.0 , 134.0 );
      popMatrix();
    }



  void arm(float xArm, float yArm)
    {
pushMatrix();      
    noStroke();
    fill(#FFB79B);
    //bewegung 
    if (ypos > 10 && checkup == true) 
    {
    ypos = ypos - speed2;
      if (ypos < 11) 
      { ypos = 10; checkup = false; } 
    }
    if (ypos < yposdown && checkup == false ) 
    { ypos = ypos + speed1;
      if (ypos > yposdown) 
      { ypos = 80; checkup = true; }  
    } 
    translate(xArm,yArm);
//oberarm
beginShape();
vertex( 272.0 , -2.0 );
bezierVertex( 235.0 , 14.0-ypos/3 , 212.0-ypos/3 , 53.0 , 213.0 , 129.0 );
bezierVertex( 213.0 , 129.0 , 213.0 , 168.0 , 260.0 , 138.0 );
bezierVertex( 260.0 , 138.0 , 323.0+ypos/8 , 83.0 , 314.0 , 14.0 );
bezierVertex( 314.0 , 14.0 , 310.0 , 1.0 , 273.0 , -3.0 );
endShape();
 stroke(0);
 strokeWeight(3);
 //anker
 pushMatrix();
 translate(-10-ypos/7,0);
 line( 266.0 , 43.0 , 284.0 , 52.0 );
 bezier( 260.0 , 52.0 , 253.0 , 67.0 , 268.0 , 78.0 , 287.0 , 68.0 );
 bezier( 278.0 , 39.0 , 278.0 , 39.0 , 273.0 , 57.0 , 265.0 , 69.0 );      
 popMatrix();
 //hinteres gewicht
 noStroke();
 beginShape();
 translate(230,130);
 rotate(radians(ypos));
 pushStyle();
  fill(0);
  beginShape();
vertex( -171.0 , 30.0 );
bezierVertex( -166.0 , 9.0 , -157.0 , -7.0 , -122.0 , -5.0 );
bezierVertex( -122.0 , -5.0 , -89.0 , 6.0 , -95.0 , 43.0 );
bezierVertex( -95.0 , 43.0 , -108.0 , 92.0 , -143.0 , 79.0 );
bezierVertex( -143.0 , 79.0 , -178.0 , 65.0 , -170.0 , 30.0 );
endShape();
popStyle();
  //unterarm
  beginShape();
vertex( -8.0 , -17.0 );
bezierVertex( -35.0 , -14.0 , -67.0 , 19.0 , -97.0 , 45.0 );
bezierVertex( -97.0 , 45.0 , -114.0 , 34.0 , -126.0 , 42.0 );
bezierVertex( -126.0 , 42.0 , -142.0 , 40.0 , -145.0 , 55.0 );
bezierVertex( -145.0 , 55.0 , -153.0 , 68.0 , -138.0 , 62.0 );
bezierVertex( -138.0 , 62.0 , -141.0 , 74.0 , -129.0 , 68.0 );
bezierVertex( -129.0 , 68.0 , -135.0 , 85.0 , -123.0 , 77.0 );
bezierVertex( -123.0 , 77.0 , -125.0 , 88.0 , -115.0 , 82.0 );
bezierVertex( -115.0 , 82.0 , -90.0 , 74.0 , -89.0 , 63.0 );
bezierVertex( -89.0 , 63.0 , -2.0 , 30.0 , 12.0 , 13.0 );
bezierVertex( 12.0 , 13.0 , 56.0 , 17.0 , 30.0 , -18.0 );
bezierVertex( 30.0 , -18.0 , 19.0 , -30.0 , -4.0 , -18.0 );
endShape();
 //vorderes gewicht
 pushStyle();
fill(0);
 beginShape();
vertex( -113.0 , 44.0 );
bezierVertex( -113.0 , 44.0 , -100.0 , 33.0 , -73.0 , 55.0 );
bezierVertex( -73.0 , 55.0 , -49.0 , 80.0 , -91.0 , 113.0 );
bezierVertex( -91.0 , 113.0 , -116.0 , 123.0 , -134.0 , 89.0 );
bezierVertex( -134.0 , 89.0 , -158.0 , 51.0 , -113.0 , 43.0 );
endShape();
popStyle();
popMatrix(); 
 
 }
 
 
 void beine (float xbeine, float ybeine) 
{
pushMatrix();
translate(xbeine,ybeine);

 fuss_links = loadShape( "fuss_l.svg" );
    fuss_rechts = loadShape ("fuss_r.svg");
///////////////FORM BEWEGEN

int position_fuss = int(random(250,280));

for (int i=0; i<20; i++)
{
shape (fuss_links, 300, position_fuss);
shape (fuss_rechts, 450, position_fuss);

}
popMatrix();
}


