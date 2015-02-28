
///// Chaos
///// 23.08.12

void setup(){
    size(848,520); 
    smooth();
    }
    
void draw(){
    updateMe();
    }
    
void updateMe(){
  for(int x=0; x<width; x+=10)
    for(int y= 0; y<height; y+=10){ 
      beginShape();
      vertex(x+random(-20.,30.),y+random(-20.,30.)); 
      vertex(x+random(-20.,30.)+10, y+random(-20.,30.));
      vertex(x+random(-20.,30.)+10, y+random(-20.,30.)+20); 
      vertex(x+random(-20.,30.), y+random(-20.,30.)+20); 
      endShape(CLOSE);
  }
}
