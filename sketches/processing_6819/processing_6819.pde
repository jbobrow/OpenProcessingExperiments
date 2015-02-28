
void setup(){ 
  size(800,600); 
  background(0); 
  smooth(); 
  noStroke(); 
  noiseDetail(4); 
  noLoop(); 
} 

float noiseStep = .005;
 
/*void mousePressed(){ 
  saveFrame("night-sky-" + millis() + ".png"); 
}*/ 
void keyPressed(){ 
  background(0); 
  noiseSeed(round(random(millis()))); 
  redraw(); 
 
} 
 
void draw(){ 
 
  loadPixels(); 
 
  for(int x=0; x<width; x++){ 
    for(int y=0; y<height; y++){ 
      pixels[x+y*width] = color( sq((noise(x*noiseStep,y*noiseStep)*2-1))*64 + random(16)  ,255 ); 
    } 
  }  
  updatePixels(); 
 
  for(int x=0; x<=width; x+=10){ 
    for(int y=0; y<=height; y+=10){ 
      for(int i=0; i<    pow( ( noise(x*noiseStep,y*noiseStep)*2-1)*10  ,2)/4    ; i++){ 
        float test = random(1); 
        if(test>.1 && test<.75){ 
          star(x+random(-5,5), y+random(-5,5), random(.1,1), color(255,255, random(255))); 
        } 
        else if(test>.75 && test<.95){ 
          star(x+random(-5,5), y+random(-5,5), random(.1,2.5), color(255,255, random(255)));         
        } 
        else if(test>.95){ 
          star(x+random(-5,5), y+random(-5,5), random(.1,2.5), color(255,0,0));         
        } 
        else if(test<.1){ 
          stroke(255,255,random(100,255), random(8,16) ); 
          galaxy(x+random(-10,10), y+random(-10,10), random(.1,.2),random(.1,.2),round(random(2,4)),random(2,5)); 
          noStroke(); 
        } 
      } 
    } 
  } 
 
} 
 
void galaxy(float x, float y, float rx, float ry, int arms, float spread){ 
 
  pushMatrix(); 
  translate(x,y); 
  scale(rx,ry); 
  rotate(random(TWO_PI)); 
 
  for(int i=0; i<360; i++){  
    strokeWeight(  1000/((i+100)) ); 
    for(int c=0; c<arms; c++){ 
      point((i/10)*cos(radians(i+c*(360/arms)))+random(-spread,spread) ,  (i/10)*sin(radians(i+c*(360/arms))) +random(-spread,spread)); 
    } 
  } 
 
  popMatrix(); 
 
} 
void star(float x, float y, float r, color c){ 
  fill(c*2,random(16,64)); 
  for(int i=0; i<random(3,5); i++){ 
    streak(x,y,random(3*r,5*r),1,random(TWO_PI)); 
  } 
  fill(c,random(16,255)); 
  ellipse(x,y,r,r); 
 
} 
 
void streak(float x,float y,float w,float h, float a){ 
 
  pushMatrix(); 
 
  translate(x,y); 
  rotate(a); 
  triangle(-w/2,0, 0,h/2 , 0,-h/2); 
  triangle(w/2,0, 0,h/2 , 0,-h/2); 
 
  popMatrix(); 
 
} 
 

