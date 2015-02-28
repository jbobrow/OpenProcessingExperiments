
// 768 x 1024 at 72(ppi) minimum

PImage coll;

void setup(){
  size(480,720);
  strokeWeight(random (10));
  stroke(0,15);
  smooth();
  coll = loadImage("body_collage.gif");
  colorMode(HSB, 360,100,100,1000);
  photoFilter();
}
 
void photoFilter(){       //when void draw(){} rainbow colors when mouse move, when RGB
  coll.loadPixels();
  int collSize = coll.width * coll.height;
  for(int i = 0; i < collSize; i++){
  color cp = coll.pixels[i];
      float h = hue(cp);
      float s = saturation(cp);
      float b = brightness(cp);
      
        if (b > 70){
        b += 200;
        
    
    coll.pixels[i] = color(20,15, h-200);
    coll.pixels[i] = color(h,0,b-30);
    coll.pixels[i] = color(h+25, b, s+10);
    coll.pixels[i] = color(s,h+12+b, b);
    
        }

    
    }
  coll.updatePixels();
  image(coll,0,0);
    
    
//  if(mousePressed){
//      fill(h, s, b);
//      noStroke();
//      stroke(255);
//      strokeWeight(5);
//      ellipse(mouseX, mouseY, 5, 5);
//
//  }
    
    
    
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
//  for(int i = 0; i< 100000; i++) {
//    int x = int(random(width));
//    int y = int(random(height));
//    color cp = bodyCollage.get(x,y);
//    float b = brightness (cp);
//    if(b == 0){
//      fill(200,0,50,80);
//      rect(x,y,2,4);
//      ellipse(x, y, random(10), random(10));
//      stroke(0,0,0,50);
//      strokeWeight(.1);
//      line(x,random(1-100), random(height), random(width));
//      ellipse(x,y, random(1-12), random(1-12));
//    } 
//  }  
//}

