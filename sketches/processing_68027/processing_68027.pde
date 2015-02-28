
int posx, posy;
boolean overCButton = false;
boolean overDButton = false;
PImage bg;

void setup()
{
  size(800,600);
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  background(255);  //set background white

}
void draw()
{ 

 stroke(random(255),100,255,50);
  fill(random(255),100,255,50);


}
  
void mousePressed(){
    criaQuadrado(100, 100);
}  



void criaQuadrado(largura, altura) {
 fill(255, 0, 0);
 rect(mouseX, mouseY, largura, altura);   
 

}
