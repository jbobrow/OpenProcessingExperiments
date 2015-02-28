
PImage img;

void setup()
{
  size(600, 400);
  img = loadImage("Hintergrund.jpg");
  img2 = loadImage("Rose_offen2.png");
  img3 = loadImage("Giesskanne.png");
  img4 = loadImage("Tropfen2.png");
  img5 = loadImage("Rose_zu.png");
}

void draw()
{
  //Hintergrund Bild
  background(0);
  imageMode(CORNER);
  image(img, 0, 0);
  
  //mit Tropfen malen
  //if (mousePressed == true)
  //{ 
    //imageMode(CENTER);
    //image(img4, 150, 150, 60, 102);
  //}
  //else
  //{
    //imageMode(CORNER);
    //image(img, 0, 0);
  //}
  
  //Giesskanne bewegt sich mit der Maus
  imageMode(CENTER);
  image(img3, mouseX, mouseY, 200, 200);
  
  //Giesskanne giesst bei Klick
  if (mousePressed == true)
  {
    background(0);
    imageMode(CORNER);
    image(img, 0, 0);

    image(img2, 220, 70, 300, 297);
    //image(img4, 150, 150, 60, 102);
  
    image(img4, mouseX+60, mouseY+60, 60, 102);
    translate(mouseX, mouseY);
    rotate(0.8);
    imageMode(CENTER);
    image(img3, 0, 0, 200, 200);
  }
  else
  {
    image(img5, 380, 215, 350, 350);
    imageMode(CENTER);
    image(img3, mouseX, mouseY, 200, 200);
  }
}


