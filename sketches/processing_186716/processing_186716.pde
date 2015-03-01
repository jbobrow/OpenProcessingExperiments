

void setup (){
  size (400,400);
  background (255,255,255);
frameRate(2);
}
  
  
  int pet=8;
 float angolo = (360/pet);
  int e= 0;
  void draw (){
    smooth(2);
    translate(200,200);
    ellipse( 0,0,20,20);
    for (e=0; e<pet; e++ ){
    rotate(radians(angolo));
     fill (random (255),random(250),random(155));
    ellipse(20,-20,50,80);
    }
      
  }


