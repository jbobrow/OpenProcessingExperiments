

//String file = "http://www.openprocessing.org/images/homepage/visual2614.jpg";
//String file = "http://www.google.com/images/firefox/sprite2.png";
//String file = "http://www.google.com/intl/en_ALL/images/logo.gif";
//String file = "http://www.openprocessing.org/images/processingLogo.jpg";
//String file = "http://www.processing.org/shop/imgs/beauty-crop1.jpg";
//String file = "http://www.processing.org/img/learning/greenberg-book.jpg";
//String file = "http://processing.org/img/processing.gif";
String file = "processing.gif";


PImage a,b;
color [] op,op2;
float mover;

PGraphics popa,popb,popc;

void setup(){

a = loadImage(file);
b = loadImage(file);


int aw = a.width;
int ah= a.height;
//a.resize(aw*2,ah*2);
//b.resize(aw*2,ah*2);
size(500,50,P3D);
//size(a.width,a.height,P3D);
popa = createGraphics(width,height,P2D);
popb = createGraphics(width,height,P2D);
popc = createGraphics(width,height,P2D);
popa.image(a,0,0,width,height);
popb.image(a,0,0,width,height);
popc.image(a,0,0,width,height);
popa.filter(INVERT);
a.filter(INVERT);
noSmooth();
hint(DISABLE_OPENGL_2X_SMOOTH);
popa.noSmooth();
popa.hint(DISABLE_OPENGL_2X_SMOOTH);
popc.noSmooth();
popb.noSmooth();
popb.hint(DISABLE_OPENGL_2X_SMOOTH);

popc.hint(DISABLE_OPENGL_2X_SMOOTH);
//smooth();
if (width>=height){
lefttoright=true;
}
if (height>width){
 toptobottom = true;   
}


op = new color[a.width*a.height];
op2 = new color[a.width*a.height];
arraycopy (a.pixels,op);
arraycopy (a.pixels,op2);
 
  
}

public boolean  lefttoright = false;
public boolean  toptobottom = false;

void draw(){
  mover+=10;

    

  
  background(255);
  popc.background(255);
  popc.image(popb,0,0);
  image(b,0,0);
  int p=0;
  color k = 0;
  color k2 = 0;
 for (int x=0; x <width;x++){
  for (int y=0; y <height;y++){

    
    noStroke();
    color c = color(a.get(x,y));
    float rr = red   (c);
    float gg = green (c);
    float bb = blue  (c);
    
    
    color d = color(popa.get(x,y));
     float rr2 = red   (d);
    float gg2 = green (d);
    float bb2 = blue  (d);
    
   
    if (width>height)
      {
         k = color(rr,gg,bb,mouseX/2);
                    k2 = color(rr2,gg2,bb2,mouseX/2);
      }
      else
      {
          k = color(rr,gg,bb,mouseY/2);
                    k2 = color(rr2,gg2,bb2,mouseY/2);
      }
    
    fill(k);
    rect(x,y,1,1);
 
    popc.fill(k2);
    popc.rect(x,y,1,1);
 

  }
 } 
 noStroke();
 popc.noStroke();

 ellipse(mouseX,mouseY,115,115);
 // popc.ellipse(mouseX,mouseY,115,115);
    
    if (mousePressed){
     image(popc,0,0); 
    }
    

}

//void keyPressed(){
//  
// if (key =='s'){
//  save("robot.png");
// } 
//}

