
int x=3;
int inc=0;

void setup(){
  size(500,400);
  frameRate(10);
  background(23,119,232);
}

//para declarar variable de tipo de letra
void draw(){
  PFont texto1; //declarar texto
  
  texto1=loadFont("Serif-48.vlw"); //tipo de letra
  fill(237,29,154);
  textFont(texto1);
  textSize(60);
  rect(0,0,width,height);
  fill(0);

  


text("D",x,300);
text("o",x+inc,300);
text("d",x+inc*2,300);
text("o",x+inc*3,300);

inc=+inc+5;

if (x+inc*3>=width-50){
  noLoop();
  background(23,119,232);
  text("D",random (500), random(400));
  text("o",random(500),random(400));
  text("d",random(500),random(400));
  text("o",random(500),random(400));
  
 

}


}
