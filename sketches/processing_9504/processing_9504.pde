
void setup()
{
  size( 800, 600, P3D );
  //  background(#BADA55);
  background(0);
//  stroke(0);
//    line(width/2, 0, width/2, height);  

}
  
void draw()
{

  stroke(255);
//  noStroke();
  int i, j;
  float r = 0.0;
  smooth();
  
  float riza;
  float x = width;
  float y = height;
  translate(width/2, height/2); 
  float angle = 1.004;


  r = 10.0;


  for(i = 40; i >= 0; i-=8){ //24
    for(j = 1; j <= 16; j+=4){  //17
      for(int k = i; k <= j; k++){        //kanonika xwris k

        rotate(2*PI/19.0);
        fill(#BADA55, (j-k)*angle/frameCount);
  //      fill((int)i*r, (int)j*r, k*(int)(i-j), (int)(i+j+k)/2); 
        strokeWeight(1.91);
        stroke((int)i*r*frameCount, 
        (int)j*r, frameCount*i*(int)(i-j), (int)(i+j+k)/2 ); 
        triangle( i*r, j*r, r, r , -r, -r);
        line( i*r, j*r, k*r, k*r , -r*j, -r*i);
        beginShape(TRIANGLE_STRIP);// TRIANGLES
        rotateX(noise(frameCount/(sin(frameCount/130.78)+10)/50.3+i)*10.0);
        rotateZ(angle);
        vertex( i*r, j*r, k*r );
        vertex( -k*r, -r*i, j/r );
        vertex( i*r, -j*r, k*r );
        endShape();
      }
      rotate(PI/17.0);
    }

  }


}

  

