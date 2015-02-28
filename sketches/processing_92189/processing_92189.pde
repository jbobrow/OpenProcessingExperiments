
void setup () {
  size (800, 800);
  background (17, 200, 49);
  

  text ("Flannel", 100, 100);
  
  
  text ("I like flannel shirts", 100, 150); 
  
   
  text ("Manly men out in the woods wear flannels", 100, 229);
  
  
  text ("Lumberjacks wear flannels to protect themselves while fighting bears", 100,255);
  text ("Scottish men wear them when they toss giant logs across a field", 100, 306);
  text ("But they wear kilts, which are pretty much skirts", 100, 335); 
  text ("Still, I wouldn't say that to one of those guys", 100, 387);
  text ("Anyone man enough to wear a skirt in public has got to be pretty tough", 100, 417);
  
   
  text ("But my roommate says that when I wear flannels", 250, 554);

  text ("That I look like a Kurt Cobain groupee from the 1990s", 250, 575);
  text ("Which is crap, because I have a beard", 250, 606); 
  text ("And girls can't grow beards", 250, 635);
  text ("Not even female lumberjacks", 570, 708); 
}

//to see where to place the text
void draw () {
  println (mouseX);
  println (mouseY);

  for (int i = 0; i < 800; i += 80)
  {
    stroke (255);
    strokeWeight (.5);
    line (0, i, 800, i);
    line (i, 0, i, 800);

}
}


