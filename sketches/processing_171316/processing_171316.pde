
PImage img;
void setup()
{
  size(500,500);

      //bild hochgeladen aus data.
  img = loadImage("Morandini_Hintergrund.jpg");
      //bild aufgerufen und CORNER.
  image(img,0,0);


}
  
void draw()
{
    //image einblenden um nur das netz zu bewegen.
    //image(img,0,0);
 
    //zieht farbe aus mausposition
    for (int i=0; i<img.height;i=i+1){
     color c=img.get(mouseX,mouseY);
 
    stroke (c);
    strokeWeight(2);
    fill(c);
   
}
 
  {
   //linker Rand
    line(0,50,mouseX,mouseY);
     line(0,150,mouseX,mouseY);
      line(0,200,mouseX,mouseY);
       line(0,250,mouseX,mouseY);
        line(0,300,mouseX,mouseY);
         line(0,350,mouseX,mouseY);
          line(0,400,mouseX,mouseY);
           line(0,450,mouseX,mouseY);
            line(0,500,mouseX,mouseY);
  //rechter Rand
    line(500,50,mouseX,mouseY);
     line(500,100,mouseX,mouseY);
      line(500,150,mouseX,mouseY);
       line(500,200,mouseX,mouseY);
        line(500,250,mouseX,mouseY);
         line(500,300,mouseX,mouseY);
          line(500,350,mouseX,mouseY);
           line(500,400,mouseX,mouseY);
            line(500,450,mouseX,mouseY);
             line(500,500,mouseX,mouseY);
  //oberer Rand
   line(50,0,mouseX,mouseY);
    line(100,0,mouseX,mouseY);
     line(150,0,mouseX,mouseY);
      line(200,0,mouseX,mouseY);
       line(250,0,mouseX,mouseY);
        line(300,0,mouseX,mouseY);
         line(350,0,mouseX,mouseY);
          line(400,0,mouseX,mouseY);
           line(450,0,mouseX,mouseY);
            line(500,0,mouseX,mouseY);
 //unterer Rand
  line(50,500,mouseX,mouseY);
   line(100,500,mouseX,mouseY);
    line(150,500,mouseX,mouseY);
     line(200,500,mouseX,mouseY);
      line(250,500,mouseX,mouseY);
       line(300,500,mouseX,mouseY);
        line(350,500,mouseX,mouseY);
         line(400,500,mouseX,mouseY);
          line(450,500,mouseX,mouseY);
           line(500,500,mouseX,mouseY);
  }}
