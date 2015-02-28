
/*
mi primer processing
 */


 
 int posx ;
 int posy ;
 
 //agregados desconocidos
 
 float x, y, ancho, altor, r, g, b, radius, xla, xlb, xlc, xld, yla, ylb, ylc, yld; 
 int timer;
PFont f;
String t;
int timer;

PImage img;

 //finagregados
 
 //movimiento satelite
float xpos;
float ypos;
float drag = 30.0;
 
 
 

void setup() {
  frameRate(30);
  size(800, 1100);// tamaño de stage
  //println("ancho de la ventana: "+width); // imprime linea
  background(#00B1F5);// color de fondo
  //smooth();// subisar lineas
  
  
img = loadImage("observador.gif");
sat = loadImage("sputnik.gif");
  
  
  ancho = textWidth(t); //Ancho del texto
  alto = 45;            //Alto del texto
  

  
}





void draw() {
  

  dibujacion();
  dibujacion2();
  dibujacion3();

  entes();
  gente();
  satelite();

  
}

void dibujacion(){
    fade();

posx = mouseX;
posy = mouseY;

  stroke(#FFEA00);//color de linea
  strokeWeight(2);


  fill(255, 0, 0, 100);
  ellipse(width/2, height/2, xpos, ypos);


  fill(#A1D7EA);
  ellipse(width/2, height/2, posx-100, posy-100);
  
      fill(#021027);
  ellipse(width/2, height/2, 150, 150);

  fill(#FF0000);
  ellipse(width/2, height/2, 55, 55);
  
    fill(#FFFFFF);
  ellipse(width/2+20, height/2-20, 55, 55);
  

  
  
  
}

void dibujacion2(){
   stroke(#FFEA00);//color de linea
     strokeWeight(1);
  line(xpos,ypos,width,height);
  
}

void dibujacion3(){
   stroke(#FFEA00);//color de linea
     strokeWeight(1);
  line(xpos,ypos,0,height);
  
}




void mousePressed() {
  stroke(0);
  fill(posy+50, posx+50, posx+50, posy+50);
  triangle(0, height, width, height, width/2,0 );
}

void keyPressed() {
  background(0);
}
void fade() {
  fill(1, 1);
  rect(0, 0, width, height);
}



void entes(){
x = frameCount % width;
if (millis() - timer >= 5000) {

    y = random(height);

    timer = millis();

  }
  r = noise(frameCount * 0.1) * 255;
  g = frameCount % 255;
  b = 255 - noise(1 + frameCount * 0.025) * 255;
  radius = noise(frameCount * 0.1) * 300;
    color c = color(g, r, b);

  fill(c);
noStroke();
  ellipse(x, y, radius, radius);
  
}

void gente(){
  
image(img, 0, 0);
  
  }

void satelite(){
  
  float dx = mouseX - xpos;
  float dy = mouseY - ypos;
  xpos = xpos + dx/drag;
  ypos = ypos + dy/drag;
  
   stroke(255,255,0,63);//color de linea
  strokeWeight(2);
  
  xla = xpos+50 - frameCount % 100;
  yla = ypos+100 + frameCount % 10;

 xlb = xpos+20 + frameCount % 100;
 ylb = ypos+90 + frameCount % 10;
  
 xlc = xpos - frameCount % 100;
 ylc = ypos + 130 + frameCount % 10;
 
  xld = xpos - 50 + frameCount % 100;
 yld = ypos + 10 + frameCount % 10;
  
line(xpos,ypos+5,xla,yla);
  
line(xpos-10,ypos+5,xlb,ylb+90);  

line(xpos-10,ypos+5,xlc,ylc);  

line(xpos-10,ypos+5,xld,yld); 
  
image(sat, xpos-75,ypos-10);
  
  }
class Animation {
  PImage[] images;
  int imageCount;
  int frame;
  
  Animation(String imagePrefix, int count) {
    imageCount = count;
    images = new PImage[imageCount];

    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into four digits
      String filename = imagePrefix + nf(i, 4) + ".gif";
      images[i] = loadImage(filename);
    }
  }

  void display(float xpos, float ypos) {
    frame = (frame+1) % imageCount;
    image(images[frame], xpos, ypos);
  }
  
  int getWidth() {
    return images[0].width;
  }
}



