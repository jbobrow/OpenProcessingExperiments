
import processing.opengl.*;
PFont font;
PImage foto;
PImage foto2;
import processing.video.*;
Capture video;


void setup() {
 frameRate (20); 
 size(800,500,P3D);
 font= loadFont("Arial-Black-48.vlw");
 textFont (font);
 foto = loadImage ("aquareal.jpg"); //fondo
 foto2 = loadImage ("yellow1.png"); //submarino
   
 video = new Capture(this,352,288,30);

}

void draw() {
  
background(41,179,227);

camera(0, -500+mouseY/2,10+mouseY*2, 00, 0, -500, 
      0,0, mouseY);
    //pushMatrix ();     
translate (0,0,-500);
imageMode (CENTER);
image (foto, 0,0,800*4,500*4);
noFill();
strokeWeight (50);
stroke (41,154,227,50);
rect (-1500,-400,800*2,600*2);//limite para mouse
fill (41,154,227);
text ("Pasar mouse por esta zona", -700,600);
if (video.available()) {
   
 video.read();

 imageMode (CENTER);
 translate (-300-mouseY/3,300-mouseX/3,mouseX);
 image(video,200,-200, 567/8+mouseX, 319/8+mouseX);
 // popMatrix (); 
 translate (-300-mouseY/3,300-mouseX/3,mouseX);
 image (foto2, 600,-620, 597+mouseX, 359+mouseX);

}
 
}


