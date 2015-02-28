
Hoja[] hojas;

PImage fondo;
void setup()
{
  size (192,157);
  //inicio el arreglo (Hoja en may porque es la clase)
  hojas=new Hoja[5];
  //instancio cada uno de los objetos del arreglo hoja
  for (int i=0; i<hojas.length;i++)
  // carga la imagen inciando las variables
    hojas[i] = new Hoja("hoja.png",0,random (height/4,height*3/4));
 
 fondo = loadImage("otoño.jpg");
}
void draw() 
{
  image(fondo,0,0);
  for (int i=0; i<hojas.length;i++)
  {
  hojas[i].display();
  hojas[i].move();
  }
}


