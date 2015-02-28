
PImage btrico , b2 ,bg, gg,gg2;
public int x1,y1,oo,kk;
PGraphics layer;

void setup(){
  hint(DISABLE_OPENGL_2X_SMOOTH);
  smooth();
  btrico = loadImage("btrico.PNG"); 
  b2 = loadImage("test5.PNG"); 
  btrico.blend(b2,0,0,b2.width,b2.height,0,0,b2.width,b2.height,2);
 
  layer = createGraphics(btrico.width/4,btrico.height/4,P3D);
// b2.blend(btrico,0,0,b2.width,b2.height,0,0,b2.width,b2.height,2); 
 bg = loadImage("ss28.JPG");
 gg = new PImage(btrico.width,btrico.height);
 gg2 = new PImage(btrico.width,btrico.height);
 //size(btrico.width,btrico.height);
 size(bg.width,bg.height);
 loadPixels();
}
void draw(){
  if (!mousePressed){
image(bg,0,0);
  }
bg.updatePixels();
 gg.updatePixels();
 gg2.updatePixels();
 
  gg.loadPixels();
  gg2.loadPixels();
 
     oo = 0;
     x1=0;
     y1= 0;
     kk=0;
    for (int y = mouseY; y<gg.height+mouseY; y++){     
  for (int x = mouseX; x<mouseX+btrico.width; x++){

      
      if (oo <=btrico.pixels.length && x1<= btrico.width && y1 <= gg.height ){
       gg.pixels[oo]= bg.get(x1,y1);
 
        if (color(btrico.pixels[oo])==-1){
                 gg2.pixels[oo] = bg.get(x,y);
        }
        else
{         
          gg2.pixels[oo] = btrico.pixels[oo];        
        }
     
     }
       y1++;
     
     oo++;     
    }
    if (x1<btrico.width){
    x1++;
    }

       y1 = 0;      

  }
  if (keyPressed ){
image(gg2,mouseX+20,mouseY-20);
image(gg2,mouseX+10,mouseY-10);
  }
    image(gg2,mouseX,mouseY);
    layer.beginDraw();
    layer.loadPixels();
    layer.image(gg2,0,0,layer.width,layer.height);
    layer.updatePixels();
    layer.endDraw();
    image(layer,0,mouseY);

}

