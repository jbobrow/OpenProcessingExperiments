
///happens once
void setup(){
  ///size of canvas
  size(1100,700);
  ///closes void setup
}
///things that keep happening
void draw(){
  ///create a blackground color
  background(110,114,200);
  ///has the rect move with y but times 1.5 +250 y, so it moves faster than other rect
  rect(300, mouseY*1.5+250, 100, 200);
  ///black fill
   fill(0);
   ///makes a rectangle
  rect(500, 250, 100, 200);
  ///black fill
    fill(0);
    ///a rectangle that also moves with y location of the mouse
  rect(700, mouseY/1.5+250, 100, 200);
  ///creates a non moving ellipse
  ellipse(150, 350, 200, 200);
  ///creates a non moving ellipse
  ellipse(950, 350, 200, 200);
  ///ends drawing void
 
}


