
float xmag, ymag = 0;
float newXmag, newYmag = 0; 
 
void setup()  { 
  size(640, 640, P3D); 
  //noStroke(); 
  colorMode(RGB, 1);
  shapeMode(CENTER); 
}

    void cube()
{
     
  float[] firstX = {-1,-0.333333,-0.333333,-1};
  float[] firstY = {1,1,0.333333,0.333333};
  float[] tileX = {0,0.666667,1.333333};
  float[] tileY = {0,-0.666667,-1.333333};
  int X,Y;
  scale(100,100,100);
  beginShape(QUADS);

  fill(1, 0, 0);   //red
for(X=0;X<=2;X++)
    for(Y=0;Y<=2;Y++){
      vertex(firstX[0] + tileX[X],firstY[0]+tileY[Y],1);
      vertex(firstX[1] + tileX[X],firstY[1]+tileY[Y],1);
      vertex(firstX[2] + tileX[X],firstY[2]+tileY[Y],1);
      vertex(firstX[3] + tileX[X],firstY[3]+tileY[Y],1);
      
    }
  fill(0, 1, 0);  //green
 for(X=0;X<=2;X++)
    for(Y=0;Y<=2;Y++){
      vertex(-1,firstX[0] + tileX[X],firstY[0]+tileY[Y]);
      vertex(-1,firstX[1] + tileX[X],firstY[1]+tileY[Y]);
      vertex(-1,firstX[2] + tileX[X],firstY[2]+tileY[Y]);
      vertex(-1,firstX[3] + tileX[X],firstY[3]+tileY[Y]);
    }
  
  fill(1, 0.5 , 0);  //orange
  for(X=0;X<=2;X++)
    for(Y=0;Y<=2;Y++){
      vertex(firstX[0] + tileX[X],firstY[0]+tileY[Y],-1);
      vertex(firstX[1] + tileX[X],firstY[1]+tileY[Y],-1);
      vertex(firstX[2] + tileX[X],firstY[2]+tileY[Y],-1);
      vertex(firstX[3] + tileX[X],firstY[3]+tileY[Y],-1);
    }
    
      
  fill(0 , 0, 1); //blue 
  for(X=0;X<=2;X++)
    for(Y=0;Y<=2;Y++){
      vertex(1,firstX[0] + tileX[X],firstY[0]+tileY[Y]);
      vertex(1,firstX[1] + tileX[X],firstY[1]+tileY[Y]);
      vertex(1,firstX[2] + tileX[X],firstY[2]+tileY[Y]);
      vertex(1,firstX[3] + tileX[X],firstY[3]+tileY[Y]);
    }
    
    
      

  fill(1, 1, 0); //yellow 
  for(X=0;X<=2;X++)
    for(Y=0;Y<=2;Y++){
      
      vertex(firstX[0] + tileX[X],1,firstY[0]+tileY[Y]);
      vertex(firstX[1] + tileX[X],1,firstY[1]+tileY[Y]);
      vertex(firstX[2] + tileX[X],1,firstY[2]+tileY[Y]);
      vertex(firstX[3] + tileX[X],1,firstY[3]+tileY[Y]);
    }

  fill(1, 1, 1); //white
  
  for(X=0;X<=2;X++)
    for(Y=0;Y<=2;Y++){
      vertex(firstX[0] + tileX[X],-1,firstY[0]+tileY[Y]);
      vertex(firstX[1] + tileX[X],-1,firstY[1]+tileY[Y]);
      vertex(firstX[2] + tileX[X],-1,firstY[2]+tileY[Y]);
      vertex(firstX[3] + tileX[X],-1,firstY[3]+tileY[Y]);
    }
  endShape();
 
 
} 



void draw()  {

  background(0.5);
  strokeWeight(.1);
  pushMatrix(); 
  translate(width/2 , height/2, 0); 
  
  newXmag = mouseX/float(width) * TWO_PI;
  newYmag = mouseY/float(height) * TWO_PI;
  
  float diff = xmag-newXmag;
  if (abs(diff) >  0.01) { 
    xmag -= diff/2.0; 
  }
  
  diff = ymag-newYmag;
  if (abs(diff) >  0.01) { 
    ymag -= diff/4.0; 
  }
  
  rotateX(-ymag); 
  rotateY(-xmag); 
  
 
  cube(); 
  
  popMatrix(); 
} 


