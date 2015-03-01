



void setup(){
  size(600,600, P3D);
  frameRate(10);
  
  
}

void draw(){
  background (255);
  fill(255,5);
  //rect(0,0,width,height);
  //noStroke();
  scale(2);
  
  translate(width/3, height/3, 0);
  rotateY(frameCount * 0.05);
  rotateX(frameCount * 0.04);

  //sphere(20);
  //line (10, 10, 0, 250, 250, 100);

  //rotateY(frameCount * 0.01);
  //rotateX(frameCount * 0.01);  
  
  stroke(0,100);
  fill(255,0,0);
  //translate(-width/6, -height/6, 0);
  //sphereDetail(24);
  //sphere (50);
  
  //rotateY(frameCount * 0.01);
  //rotateX(frameCount * 0.01);
  //translate(-width/6, -height/6, 0);
  fill(155,0,0);
  //sphere (20);
  
  float s=0; 
  float t=0; 
  
  float lastx = 0; 
  float lasty = 0; 
  float lastz = 0;
  
  float radius = 150;
  float noiseVal = frameCount / 50.0;
  
  while (t < 80) {
      s+=15;
      t+=0.2;
      float radianS = radians(s); 
      float radianT = radians(t);
      
      // float thisradius = radius + random(-25.0, 25.0); 
      noiseVal += 0.5;
      float thisradius = radius + (noise(noiseVal) * 100.0);
      
      float thisx = 0 + (thisradius * cos(radianS) * sin(radianT)); 
      float thisy = 0 + (thisradius * sin(radianS) * sin(radianT)); 
      float thisz = 0 + (thisradius * cos(radianT));
      
       if (lastx != 0) {
        line(thisx, thisy, thisz, lastx, lasty, lastz);
        
        pushMatrix();
        translate(thisx, thisy, thisz);
        sphereDetail(12);
        stroke(50,0,0,100);
        sphere(random(10));
        popMatrix();
        
      }
      
      if (lastx != 0) {
        line(thisx, thisy, thisz, lastx, lasty, lastz);
        ;
        
      }
      
      lastx = thisx; lasty = thisy; lastz = thisz;
  } 

      
      
  } 
  
  

  
