
PImage img;
PImage img1;
PImage img2;
PImage img3;
PImage img4;
void setup()

{ size(400,510);
  
  img= loadImage("MD1_Foto_Stumpf_Blende_0044klein.jpg");
  img1= loadImage("DSC00434.gif");
  img2= loadImage("DSC00436.gif");
  img3= loadImage("Unbenannt-1.png");
  img4= loadImage("Daniela_Mappe_0433_Kopie2.jpg");
}

void draw()
{background (0);
 imageMode (CORNER);
 image(img,0,0);
 
 imageMode(CENTER);
 image(img1, mouseX, mouseY,330,210);
 
 if (mouseX<300 && mouseX>260 && mouseY<150 && mouseY>100)
 { background (0);
   imageMode (CORNER);
   image(img,0,0);
 
   imageMode(CENTER);
   image(img2,mouseX,mouseY, 330,210);
   
   imageMode(CENTER);
   image (img3, 200,170, 50,50);
   
 }
 else 
 {background (0);
 imageMode (CORNER);
 image(img,0,0);
 
 imageMode(CENTER);
 image(img1, mouseX, mouseY,330,210);
}

if(mousePressed==true)
{
  imageMode(CORNER);
  image(img4,0,0);
}
}


