
PImage imgTortuga;
PImage imgAlcachofa;
PImage imgColibri;
PImage imgLink;
int umbral0;
int umbral1;
int umbral2;
int umbral3;
color colorA;
color colorOK;
color colorKO;
int deltaY=20;
int ancho=640;
int alto=190;

void setup() {  //setup function called initially, only once
umbral0 = 10;
umbral1 = 160;
umbral2 = 480;
umbral3 = 530; 
colorA = #09585f; 
colorOK = #acbd82; 
colorKO = #ff7012;
stroke(colorA);


  size(ancho, alto);
  background(255);  //set background white
  colorMode(RGB);   //set colors to Hue, Saturation, Brightness mode
 // colorA 
    strokeWeight(3);
    cursor(MOVE);
  
  String urlTortuga = "http://dimeloandando.com/blog/wp-content/uploads/2014/05/TORTUGA-300x300"; 
  String urlAlcachofa = "http://dimeloandando.com/blog/wp-content/uploads/2014/05/ALCACHOFA-300x300";
  String urlColibri = "http://dimeloandando.com/blog/wp-content/uploads/2014/05/COLIBR%C3%8D-300x300";
  String urlLink = "http://dimeloandando.com/blog/wp-content/uploads/2014/05/linkEarth";
  
  // Load image from a web server
  imgTortuga = loadImage(urlTortuga, "png");
  imgAlcachofa = loadImage(urlAlcachofa, "png");
  imgColibri = loadImage(urlColibri, "png");
  imgLink = loadImage(urlLink, "png");
  
}

void draw() {  //draw function loops 
  background(255);  //set background white
 textSize(24);
 fill(colorA);
 text("Actitud ante el aprendizaje", 10, 30); 
 textSize(12);
 text("(Mueve el cursor sobre la barra)", 10, 50); 
 image(imgLink, width-50, 0, 50,50);
  
  stroke(colorKO);
  line(umbral0,120+deltaY,umbral1,120+deltaY);
  stroke(colorA);
  line(umbral1,120+deltaY,umbral2,120+deltaY);
  stroke(colorOK);
  line(umbral2,120+deltaY,width-10,120+deltaY);
  
  if (mouseX<umbral0){
      image(imgAlcachofa, umbral0, 15+deltaY, 100,100);
      textSize(16);
      fill(colorKO);
      stroke(colorKO);
      text("Modo alcachofa\nMente cerrada", umbral0, 140+deltaY); 
      ellipse(umbral0,120+deltaY,10,10);
  }
  if (mouseX>=umbral0 && mouseX<umbral1){
      image(imgAlcachofa, mouseX, 15+deltaY, 100,100);
      textSize(16);
      fill(colorKO);
      stroke(colorKO);
      text("Modo alcachofa\nMente cerrada", mouseX, 140+deltaY);
      ellipse(mouseX,120+deltaY,10,10); 
  }
  if (mouseX>=umbral1 && mouseX<umbral2){
      image(imgTortuga, mouseX, 10+deltaY, 105,105);
      textSize(16);
      fill(colorA);
      stroke(colorA);
      text("Modo tortuga\nMente aletargada", mouseX, 140+deltaY); 
      ellipse(mouseX,120+deltaY,10,10); 
  }
  if (mouseX>=umbral2 && mouseX<umbral3){
     image(imgColibri, mouseX, 15+deltaY, 100,100);
     textSize(16);
     fill(colorOK);
     stroke(colorOK);
     text("Modo colibri\nMente abierta", mouseX, 140+deltaY);
     ellipse(mouseX,120+deltaY,10,10);  
  }
  if (mouseX>=umbral3){
     image(imgColibri, umbral3, 15+deltaY, 100,100);
     textSize(16);
     fill(colorOK);
     stroke(colorOK);
     text("Modo colibri\nMente abierta", umbral3, 140+deltaY); 
     if (mouseX>width-10){
         ellipse(width-10,120+deltaY,10,10); 
     }
     else{
         ellipse(mouseX,120+deltaY,10,10);      
     }
  }
   
  
 
}
void mousePressed() { 
    if(mouseX>width-50&&mouseY<50){
        link("http://ed.ted.com/on/UA77FlTc", "_new"); 
     }
}
void mouseMoved(){
     if(mouseX>width-50&&mouseY<50){
         cursor(HAND);
     }
     else{
         cursor(MOVE);
     }
}
