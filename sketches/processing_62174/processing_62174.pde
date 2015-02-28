
PImage img;
PImage img2;
PImage img3;
PImage img4;
PGraphics pg;


void setup(){

 img = loadImage("bild.jpeg");
 img2 = loadImage("bild2.png");
 img3 = loadImage("bild3.jpeg");
 img4 = loadImage("bild4.jpg");
 
 pg = createGraphics(img.width,img.height,P2D);
 
 size(img.width, img.height); 
 
}

void draw(){

  float i = mouseY;
   
  if(mousePressed){
    color c = img.get(mouseX, mouseY);
    tint(c);
    
    image(img3, 0, 0);}
    
    else{
      noTint();
      image(img4, 0, 0);
       
      pg.beginDraw();
      pg.background(0, 0);
      pg.strokeWeight (0.5);
      pg.ellipse(mouseX, mouseY, 150, 150);
      pg.fill(255);
      pg.endDraw();
      
      img.mask(pg);
      image(img, 0, 0);
      
      image(img2, mouseX, 400);
    }
    
    
    
    
   
  
}

