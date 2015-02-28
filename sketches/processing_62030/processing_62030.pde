
PImage img;
PImage img2;
PImage img3;
PImage img4;

void setup(){
  smooth();
  
  img = loadImage("InkFull0008_1_S.jpg");
  img2 = loadImage("26_1.png");
  img3 = loadImage("schwalbe.png");
  img4 = loadImage("tree.png");
    size(img.width,img.height);

}

void draw(){
  
image(img,0,0);
  
if(mousePressed){
image(img2,0,-40);
}else{
 image(img3,mouseX,mouseY);
 image(img4,100,0);
}


  
}

