
float Top = 0;
float Top2 = 0; 
float Color1 = 0; 
float Color2 =255;
float Color3 = 255;
float Color4 = 255;

void setup()
{
  size(700,700);
  //COLOR FONDO
  background(182, 252, 8);
  //recta parte superior
  rect(Top, Top2, 700, 20);
}
 
void draw(){
  // colores
  Color1 = mouseX;
  Color2 = Color2 + random(-4,20);
  Color3 =  Color3 + random(-4,20);
  Color4 = Color4 + random(-3,20);
  if(Color4 > 220 && Color3 > 220 && Color2 > 220){
    Color4 =10;
    Color3 =10;
    Color2 =10;
  }
   //ellipse
   fill(Color2,Color3,Color4);
   noStroke();
    if(mousePressed){
    //cirlulo (x,y,width, heigth)
    ellipse(mouseX-20, mouseY-20, 20, 20);
    ellipse(width-mouseX-20, width-mouseY-20, 20, 20);
}
  //top 10
  if(mouseY <10){
    fill(Color1, Color2, Color3);
    rect(0,20,width,height);
    text("cambiar el color de fondo", 150,20);
  }
}



