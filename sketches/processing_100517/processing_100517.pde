
/* @pjs preload="HORIZONTES.jpg, JUSTICE_SOCIETY_OF_AMERICA_10.jpg,
KC_McCay_sm.jpg, SAW.JPG, SmokeEffect.JPG, 
Spider-Pig-spiderpig-236326_1024_768.jpg, 
The_Pirate_Bay_Wallpaper_by_herbman75.jpg, blur2.jpg, 
burnin.JPG, invisible_me.jpg, pxa_1.jpg, village_bush_lg.jpg"; 
 */

/**
<p>Prueba de interpretación de imagenes pixeladas bicolor</p>
<p>Para hacer uso de esto:</p>
<p>Mover mouse vertical: Cantidad de pixeles</p>
<p>Mover mouse horizontal: Sensibilidad de la imagen</p>
<p>Click sostenido: Muestra la imagen correspondiente</p>
<p>Soltar click: Siguiente imagen</p>
<p>Otras estupidez de    
<a href="http://laheadlabs.wordpress.com">Joel QO.</a></p> 

*/
PImage[] img = new PImage[12];
int halfImage = width/2 * height,cont=0;
boolean flag;
int step=9;
float sense=2;
void setup(){
  background(0);
  noStroke();
  size(640,360);
  img[0] = loadImage("HORIZONTES.jpg");
  img[1] = loadImage("pxa_1.jpg");
  img[2] = loadImage("KC_McCay_sm.jpg");
  img[3] = loadImage("JUSTICE_SOCIETY_OF_AMERICA_10.jpg");
  img[4] = loadImage("Spider-Pig-spiderpig-236326_1024_768.jpg");
  img[5] = loadImage("village_bush_lg.jpg");
  img[6] = loadImage("burnin.JPG");
  img[7] = loadImage("blur2.jpg");
  img[8] = loadImage("invisible_me.jpg");
  img[9] = loadImage("SAW.JPG");
  img[10] = loadImage("SmokeEffect.JPG");
  img[11]=loadImage("The_Pirate_Bay_Wallpaper_by_herbman75.jpg");
}

void draw(){
  if (img[cont].width>img[cont].height){
    img[cont].resize(width,img[cont].height*width/img[cont].width);
  } else {
    img[cont].resize(img[cont].width*height/(img[cont].height),height);
  }
  if(flag==true){
    image(img[cont],0,0);
  } else {
    double prom = 0, brillo=0;
    fill(0);
    rect(0,0,width,height);
    for(int x=0;x<img[cont].width;x=x+1){
      for(int y=0;y<img[cont].height;y=y+1){
         brillo= brightness(img[cont].get(x,y));
         prom += brillo;
      }
    }
    prom/=(img[cont].width*img[cont].height);
    print("Brillo: ");
    print(prom);
/*    if(prom<255/5){
      sense = 4.5;
    } else if(prom>=255/5&&prom;<2*255/5){
      sense = 2.2;
    } else if(prom>=2*255/5&&prom;<3*255/5){
      sense = 2;
    } else if(prom>=3*255/5&&prom;<4*255/5){
      sense = 1.8;
    } else if(prom>=4*255/5){
      sense = 1;
    }*/
    sense = map(mouseX,0,width,0,10);
    step = int(map(mouseY,0,height,128,30));
    print("; Sensibilidad: ");
    print(sense);
    int cantx=0,canty=0;
    for(int x=0;x<img[cont].width;x=x+height/step){
      for(int y=0;y<img[cont].height;y=y+height/step){
        color pix=img[cont].get(x,y);
        if (brightness(pix)>255/sense){
          fill(255,255,0);
        } else {
          fill(255,0,0);
        }
        ellipse(x,y,height/step,height/step);
        if (y>canty){
          canty=y;
        }
      }
      if (x>cantx){
        cantx=x;
      }
    }
    print("; X = ");
    print(cantx);
    print("; Y = ");
    println(canty);
  }
}
void mouseReleased(){
  cont=cont+1;
  if (cont==12){
    cont=0;
  }
  flag = false;
  redraw();
}

void mousePressed(){
  image(img[cont],0,0);
  flag=true;
  redraw();
}


