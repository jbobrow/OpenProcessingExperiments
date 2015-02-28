
class Neko  {   
  PImage nekoimage; // define la variable para la imagen
  float x,y;   // Variables para la ubicación de la imagen
  float rot;   // Variable para rotar/girar la imagen

  Neko(String file, float x_, float y_) { 
    // carga la imagen y empiezan las variables 
    nekoimage = loadImage(file);
    x = x_;
    y = y_;
    rot = 0.0;
  }   

  void display()  {   
    // traslación y rotación
    translate(x,y);
    rotate(rot);

    // animar la imagen como cualquier forma regular usando variables asi como el translate() y el rotate()
    image(nekoimage,0,0,nekoimage.width*3/4,nekoimage.height*3/4); 

  }   

  void move()  {   
    // ajusta las variables de la animación
    x += 1.0;
    rot += 0.03;
    if (x > width+nekoimage.width) {
      x = -nekoimage.width;
    }

  }   
}


