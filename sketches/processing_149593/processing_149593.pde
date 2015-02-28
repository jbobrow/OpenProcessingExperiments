

void setup(){
 size(400,300);
 img = loadImage("mama.jpg");
  
}


void draw(){
  //tint(c);
  //get (x,y)
  
  image(img, 0, 0);

  println(c);
  
  
  for(int i = 0; i < height; i++){
    c = img.get(mouseX, i);
    stroke(c);
    line(0,i, mouseX,i);
  }
}
