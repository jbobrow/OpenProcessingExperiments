


color [] bunt; 

void setup ()
{
  size ( 600, 900);
  background(255);
  smooth();
  frameRate (50);
  bunt = new color []{
  color (255, 0, 0), 
  color(#CB0E74),
  color (#840898) 
  
}; 

}

////////////////////////////////////////////////////////////

void draw ()
{ background(255);  
 translate (width/2,height/2);


  
pushMatrix ();
   kopf(width/2,120);
popMatrix();  

pushMatrix (); 
   auge(width/4, height/4, 30, 30);
   auge(width/2, height/4, 30, 30);
popMatrix ();



pushMatrix ();
   arm (250,-100); 
popMatrix ();    

fuesse(-80,50);


  
    pushMatrix ();
  fill(bla(bunt)); 
  psychoBauch( 10, -20, 250+(random(-30,30)), 300+(random(-10, 30)));  
  popMatrix ();
}


////////////////////////////////////////////////////////////////////////



void kopf(float x, float y)
  {
    
    //KOPF
    shapeMode(CENTER);
    noStroke();
    fill(100);
    ellipse(x-300,y-400,250,160);
    rect(-20,-210,60,50);
    

    //HUT
    fill(0);
    rotate(radians(-20));
    rect(x-350, y-450, 230,10);  // SCGHIRM
    rect(x-310, y-510, 150,70);  // DECKEL

    mund(40,-250);
    

    
  }

///////////////////////////////////////////////////////////////////

void auge (int x1, int y1, int x2, int y2)

{
  noStroke();
  fill(0);
  ellipse( x1-200, y1-500, x2, y2);
  fill(random (100), 0, 0 );
  stroke(255, 230, 0);
  
  // version 1
  //ellipse(pos1 + map(mouseX,0,width, -rad1/3, rad1/3), pos2 + map(mouseY,0,height, -rad2/3, rad2/3), rad1/3, rad2/3);

  // version 2
  float a = atan2( mouseY-y1, mouseX-x1 );
  float d = dist( mouseX, mouseY, x1, y1 );
  pushMatrix();
    translate( x1-200, y1-500);
    rotate(a);
    translate( d / 20, 0 );
    ellipse( 0,0, x2/3, y2/3 );
  popMatrix();
}


////////////////////////////////////////////////////////////

void psychoBauch(float x1, float y1, float i, float k)
{
  
 
ellipse(x1, y1, i, k);  
}


color bla (color [] frb)
{
  
int f = int (random(0, frb.length)); 
return frb [f]; 


}



////////////////////////////////////////////////////////////

void mund(int x,int y){
  for(int i =0; i < 100; i++) {
    strokeWeight(1);
    smooth();
    fill(255,0,0);   
         
      pushMatrix();
      beginShape();
        translate(x,y);
        vertex( 57.0 , 8.0 );
        bezierVertex( 57.0 , 8.0 , 49.0 , 22.0 , 29.0 , 18.0 );
        bezierVertex( 29.0 , 18.0 , 58.0 , 102.0 , 103.0 , 20.0 );
        bezierVertex( 103.0 , 20.0 , 77.0 , 19.0 , 75.0 , 7.0 );
        bezierVertex( 75.0 , 7.0 , 63.0 , 23.0 , 56.0 , 8.0 );
      endShape();
          
      beginShape();
        noFill();
        vertex( 19.0 , 31.0 );
        vertex( 29.0 , 18.0 );
        bezierVertex( 30.0 , 15.0 , 55.0 , 57.0 , 103.0 , 18.0 );
        vertex( 110.0 , 31.0 );
      endShape();
    popMatrix();
    
if (mousePressed == true) {
      
    background(255);
    fill(255,0,0);
     
     pushMatrix();
      beginShape();
        translate(x,y);
        vertex( 57.0 , 8.0 );
        bezierVertex( 57.0 , 8.0 , 49.0 , 22.0 , 39.0 , 22.0 );
        bezierVertex( 39.0 , 22.0 , 58.0 , 102.0 , 93.0 , 22.0 );
        bezierVertex( 93.0 , 22.0 , 77.0 , 19.0 , 75.0 , 7.0 );
        bezierVertex( 75.0 , 7.0 , 63.0 , 23.0 , 56.0 , 8.0 );
      endShape();
          
      beginShape();
        noFill();
        vertex( 35.0 , 31.0 );
        vertex( 39.0 , 22.0 );
        bezierVertex( 30.0 , 15.0 , 55.0 , 57.0 , 93.0 , 22.0 );
        vertex( 96.0 , 31.0 );
      endShape();
     
      beginShape();
       fill(0);
       vertex( 38.0 , 21.0 );
       bezierVertex( 47.0 , 24.0 , 50.0 , 29.0 , 57.0 , 24.0 );
       bezierVertex( 57.0 , 24.0 , 64.0 , 15.0 , 65.0 , 30.0 );
       bezierVertex( 65.0 , 30.0 , 68.0 , 13.0 , 74.0 , 25.0 );
       bezierVertex( 74.0 , 25.0 , 78.0 , 31.0 , 92.0 , 22.0 );
       bezierVertex( 92.0 , 22.0 , 77.0 , 34.0 , 75.0 , 39.0 );
       bezierVertex( 75.0 , 39.0 , 62.0 , 51.0 , 52.0 , 37.0 );
       vertex( 39.0 , 23.0 );
      endShape();

   popMatrix();
  } 

    
  }
}


////////////////////////////////////////////////////////////


void arm ( float x, float y)
    {  
    pushMatrix();
    translate(x,y);
    scale (-1,1);
    fill (0);  
    triangle (0,0,170,10,170,-40);
    triangle (0,0,20,40,40,-5);
    popMatrix();
    
    pushMatrix();
    translate(x-450,y);
    
    fill (0);  
    triangle (0,0,170,10,170,-40);
    triangle (0,0,20,40,40,-5);
    popMatrix();
    
    }
    
////////////////////////////////////////////////////////////  



 void fuesse (int x, int y){
pushMatrix();
 translate(x,y);
 smooth();
 pushStyle();
 colorMode(HSB);
 fill(180,200,200);
   
  beginShape();
    vertex( 65.0 , 67.0 );
    vertex( 65.0 , 79.0 );
    bezierVertex( 65.0 , 79.0 , 42.0 , 93.0 , 25.0 , 83.0 );
    bezierVertex( 25.0 , 83.0 , 32.0 , 98.0 , 24.0 , 91.0 );
    bezierVertex( 24.0 , 91.0 , 23.0 , 92.0 , 22.0 , 83.0 );
    bezierVertex( 22.0 , 83.0 , 15.0 , 88.0 , 13.0 , 86.0 );
    bezierVertex( 13.0 , 86.0 , 14.0 , 86.0 , 19.0 , 81.0 );
    bezierVertex( 19.0 , 81.0 , 9.0 , 53.0 , -6.0 , 66.0 );
    bezierVertex( -6.0 , 66.0 , -33.0 , 86.0 , -10.0 , 97.0 );
    bezierVertex( -10.0 , 97.0 , 1.0 , 108.0 , 26.0 , 104.0 );
    bezierVertex( 26.0 , 104.0 , 57.0 , 103.0 , 62.0 , 103.0 );
    bezierVertex( 62.0 , 103.0 , 103.0 , 113.0 , 94.0 , 97.0 );
    bezierVertex( 94.0 , 97.0 , 81.0 , 72.0 , 93.0 , 65.0 );
    bezierVertex( 93.0 , 65.0 , 79.0 , 75.0 , 64.0 , 67.0 );
  endShape();
 
  pushMatrix();
    translate( 200, 0 );
    scale( -1, 1 );
      beginShape();
        vertex( 65.0 , 67.0 );
        vertex( 65.0 , 79.0 );
        bezierVertex( 65.0 , 79.0 , 42.0 , 93.0 , 25.0 , 83.0 );
        bezierVertex( 25.0 , 83.0 , 32.0 , 98.0 , 24.0 , 91.0 );
        bezierVertex( 24.0 , 91.0 , 23.0 , 92.0 , 22.0 , 83.0 );
        bezierVertex( 22.0 , 83.0 , 15.0 , 88.0 , 13.0 , 86.0 );
        bezierVertex( 13.0 , 86.0 , 14.0 , 86.0 , 19.0 , 81.0 );
        bezierVertex( 19.0 , 81.0 , 9.0 , 53.0 , -6.0 , 66.0 );
        bezierVertex( -6.0 , 66.0 , -33.0 , 86.0 , -10.0 , 97.0 );
        bezierVertex( -10.0 , 97.0 , 1.0 , 108.0 , 26.0 , 104.0 );
        bezierVertex( 26.0 , 104.0 , 57.0 , 103.0 , 62.0 , 103.0 );
        bezierVertex( 62.0 , 103.0 , 103.0 , 113.0 , 94.0 , 97.0 );
        bezierVertex( 94.0 , 97.0 , 81.0 , 72.0 , 93.0 , 65.0 );
        bezierVertex( 93.0 , 65.0 , 79.0 , 75.0 , 64.0 , 67.0 );
      endShape();
  popMatrix();
 
if (mouseButton == RIGHT){
 
  pushStyle();
       fill(0);
       ellipse(-1,61,2,2);
        ellipse(-5,62,2,2);
  popStyle();
 
pushMatrix();
    fill(220,220,220);
  
       beginShape();
        vertex( 0.0 , 71.0 );
        bezierVertex( 0.0 , 71.0 , -8.0 , 68.0 , -8.0 , 73.0 );
        bezierVertex( -8.0 , 73.0 , -6.0 , 76.0 , -4.0 , 75.0 );
        bezierVertex( -4.0 , 75.0 , 2.0 , 75.0 , -2.0 , 78.0 );
        bezierVertex( -2.0 , 78.0 , 2.0 , 78.0 , 2.0 , 75.0 );
        bezierVertex( 2.0 , 75.0 , 8.0 , 71.0 , 8.0 , 74.0 );
        bezierVertex( 8.0 , 74.0 , 7.0 , 69.0 , 5.0 , 69.0 );
        bezierVertex( 5.0 , 69.0 , 0.0 , 65.0 , 3.0 , 61.0 );
        vertex( 2.0 , 57.0 );
        bezierVertex( 2.0 , 57.0 , 4.0 , 63.0 , 1.0 , 64.0 );
        bezierVertex( 1.0 , 64.0 , -7.0 , 65.0 , -7.0 , 64.0 );
        bezierVertex( -7.0 , 64.0 , -9.0 , 60.0 , -7.0 , 59.0 );
        bezierVertex( -7.0 , 59.0 , 0.0 , 58.0 , 1.0 , 57.0 );
        bezierVertex( 1.0 , 57.0 , -9.0 , 52.0 , -13.0 , 57.0 );
        bezierVertex( -13.0 , 57.0 , -9.0 , 68.0 , -6.0 , 68.0 );
        bezierVertex( -6.0 , 68.0 , -2.0 , 72.0 , -3.0 , 72.0 );
       endShape();
popMatrix();
}
popStyle();
popMatrix();
}


