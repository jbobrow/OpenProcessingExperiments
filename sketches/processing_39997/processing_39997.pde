
void setup (){
  size (500, 500);
}

void draw (){
  background (25);
  
  for(int x = 10; x < width;x=x+20) {
    for(int y = 10; y < height; y=y +20) {
     fill (10, y/3, random (225));
     ellipse (x, y, 30, 30);
     strokeWeight(5);
     stroke(int(random(25,50)),int(random(45,200)),int(random(9,75)),int(random(98,254)));
     
    }
  }
}

                
                
