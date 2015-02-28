
import ddf.minim.*;
color strokeColor = color(0,10);
Minim minim;
AudioSample shipbell;





void setup(){
size (800, 600);
noFill();
background(#FAF6E1);


minim = new Minim(this);
shipbell = minim.loadSample("bell-kyoto.wav");
}

void draw(){
  
  stroke(255);
  
}
void keyPressed(){
  
  
  if (key == 'q' ){
    stroke(#AA5E5E);
  }
  if (key == 'w' ) {
    stroke(#7B9BEA);
  }
  if (key =='e'){
    stroke(#FFDE58);
  }
 if (key =='r') {
   stroke(#F5392F);
 }
if (key =='t') {
  stroke(#34AA3A);
}
if (key =='y') {
  stroke(#6F6835);
}
    
strokeWeight(random(5));
bezier ( width/2, height, width/2, 
random(height), random(width), random(height),
random(width), random(height));


  }
 
  


  void keyReleased (){
    if (key == 'd' || key == 'D') background(random(360));
    if (key == 'q' || key == 'w' || key =='e' || key =='r' || key =='t' || key =='y') 
   shipbell.trigger();
  if (key == 's') saveFrame("image.png");
  
  }


