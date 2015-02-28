
float Color1 = 255; 
float Color2 = 255;
float Color3 = 255;

void setup(){
  size(700,700);
  //COLOR FONDO
  background(182, 252, 8);
  
}
 
void draw(){
  // colores
  Color1 = random(0,255);
  Color2 = random(0,255);
  Color3 = random(0,255);

  //ellipse
  fill(Color1,Color2,Color3);
  noStroke();
    if(mousePressed){
    //cirlulo (x,y,width, heigth)
    ellipse(mouseX, mouseY, 20, 20);
    }
}



