
//OHREN
PShape ohr_r;
PShape ohr_l;

void ohren (int x1, int y1, int abstand) {
  shapeMode(CORNERS);
  pushMatrix();
    rotate(0.4/random(5,6));
  scale(0.5);
  shape(ohr_l, x1, y1);
  popMatrix();
  
  pushMatrix();
  rotate(0.4/random(5,6));
  scale(0.5);
  shape(ohr_r, x1+abstand, y1);
  popMatrix();
}

//AUGEN

 void rellipse_left_right ( float x , float y)
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
           ellipse( x1_left, y1_left, x2_left + 20, y2_left + 20 );
          ellipse( x1_right, y1_right, x2_right + 20, y2_right + 20 ); 
                  frameRate(5); //  velocity of pupil movement
                  popMatrix();
    }
    
  void kopf (float x, float y)
  {
    
    //KOPF
    shapeMode(CENTER);
    noStroke();
    fill(0);
    ellipse(x,y,250,160);
    rect(x-30,y+50,60,50);
    
    
    //HUT
    pushMatrix();
    fill(255, 0, 0);
    translate(x+30,y-110);
    rotate(radians(-20));
    rect(-200, 20, 230,10);
    rect(-160, -40, 150,70);
    popMatrix();
  }
  
  //BAUCHGURMMELN
float noiseScale=0.002;
     void torso(float x1,float y1)

    {
    noiseScale = noiseScale + .1;
    float n = noise(noiseScale);
    float f = cos(n)*40;
    float e = sin(n)*40;
    float d = f/2;
    float g = e/2;
    
    translate(x1,y1);
    fill(240-f,205+e,140);
//becken
pushMatrix();
stroke(1);
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
    
    
       void mund ( float x, float y )
    {
      pushMatrix();   // alle werte werden eingefroren
      translate(x,y);  // neuer nullpunkt wird gesetzt
      



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
   

