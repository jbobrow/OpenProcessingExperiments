
PImage myimage;
PFont myfont;
int counter = 0;

void setup(){
  size(450,600);
  background(200,200,2,30);
  
  myimage = loadImage( "nature.jpg");
  myfont = loadFont("Baskerville-Italic-48.vlw");
  
}

void draw(){
  
  image(myimage, random(20), random(20));
  tint(random(100,255),random(100,255),random(0,100),random(100));
  ellipse(250,300,random(300,800),random(300,800));
  fill(199,216,15,0);
  stroke(199,216,15,30);
  
  {fill(0,0,0,50);
  textFont(myfont, 54);
  text("RocksRocks.Rocks.Rocks", random(600), random(600));
}
}

void mousePressed(){
  save("Image_sketch_Rachael_Rendely"+counter+".jpg");
  counter = counter + 1;
}
  

  


