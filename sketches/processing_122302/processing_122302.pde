
int pes;
int alsada;
String s="Hola consola";
String llistat[];
PrintWriter output;

void setup()
{
  size(600,600);
  smooth();
  llistat=loadStrings("C:\\Users\\futzet\\Documents\\dades.txt");
  output=createWriter("C:\\Users\\futzet\\Documents\\positions.txt"); 
  pes=int(llistat[0]);
  alsada=int(llistat[1]);
  println(pes);
  println(alsada);

}

void draw()
{
  background(255);
  ellipse(300,300, pes,pes);
  output.println("("+mouseX+", "+mouseY+")"); 
}
