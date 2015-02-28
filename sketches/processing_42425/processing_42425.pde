
PImage img;
PImage img2;
PImage img3;
PImage img4;

void setup(){
   size(310,379);

 img = loadImage("Monna_Lisa-leonardo.jpg");
 img2 = loadImage("Monna_Lisa-leonardo.jpg");
 img3 = loadImage("Monna_Lisa-leonardo.jpg");
 img4 = loadImage("Monna_Lisa-leonardo.jpg");
 image(img,0,0,width/2,height/2);
image(img2,width/2,0,width/2,height/2);
image(img3,0,height/2,width/2,height/2);
image(img4,width/2,height/2,width/2,height/2);}

void draw(){
//img
if((mouseX < width/2) && (mouseY < height/2)){  
tint(255,0,0);
image(img,0,0,width/2,height/2);
}else{
  noTint();
  image(img,0,0,width/2,height/2);

}
//img2
if((mouseX > width/2) && (mouseY < height/2)){  
tint(0,255,0);
image(img2,width/2,0,width/2,height/2);
}else{
  noTint();
  image(img2,width/2,0,width/2,height/2);

}

//img3
if((mouseX < width/2) && (mouseY > height/2)){  
tint(255,255,0);
image(img3,0,height/2,width/2,height/2);
}else{
  noTint();
 image(img3,0,height/2,width/2,height/2);

}

//img4
if((mouseX > width/2) && (mouseY > height/2)){  
tint(0,0,255);
image(img4,width/2,height/2,width/2,height/2);
}else{
  noTint();
 image(img4,width/2,height/2,width/2,height/2);

}
}








