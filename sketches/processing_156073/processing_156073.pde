
/* @pjs preload="ny.JPG"; */ 

PImage base;
PImage piece;

void setup () {
  size (900, 900);
  base = loadImage ("ny.JPG");
}

void draw () {
 translate (mouseX, mouseY);
  //rotate(PI/3);
  image (base, 0, 0);
 mirror();
 write();
}

void mirror(){
  //takes a part of the image and repeat it in mirror position
  piece = get (0,0,450,450);
  pushMatrix(); 
  scale(1, -1); 
  image(piece,450,-900); 
  popMatrix ();
  
 piece = get (450,450,450,450);
  
  pushMatrix(); 
  scale(1, -1); 
  image(piece,450,-450); 
  popMatrix ();
  
  piece = get (0,450,450,450);
   
  pushMatrix(); 
  scale(-1, 1); 
  image(piece,0,-450); 
  popMatrix ();

 
}
  void write (){
      textSize(200);
      fill (255);
      text ("NYC", height/2, width/2);
  }



