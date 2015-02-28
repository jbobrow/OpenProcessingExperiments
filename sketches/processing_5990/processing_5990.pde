
import processing.opengl.*;
public boolean largeicon = false;
int pp,pp2;
PImage loadpic;
PGraphics menu,menumask;
void setup(){
 // size(352,int(208*3.5),P3D);
 size(255,255,P3D);
  loadPixels();
//drawmenu(); // optional
}
void drawmenu(){
  menu = createGraphics(352,int(208/2),P3D);
// menu = createGraphics(352,int(208/2),"hipstersinc.P5Sunflow");
menu.smooth();
menu.beginDraw();
menu.loadPixels();
menu.translate(menu.width/2,menu.height/2);
menu.noStroke();
menu.rotateY(radians(25));
menu.rotateX(radians(25));
menu.fill(random(400),random(400),random(400),125);
if ((keyPressed && (key =='l' || key == 'L')) || largeicon == true){
  
   menu.box(menu.height/8*3,menu.height/8*3,menu.height/8*3);
}
else
{
menu.box(menu.height/8,menu.height/8,menu.height/8);
}



menu.translate(30,0);
menu.sphereDetail(175);


if ((keyPressed && (key =='l' || key == 'L')) || largeicon == true){
 
  menu.sphere(5*3);
}
else
{
menu.sphere(5);
}



menu.updatePixels();
menu.endDraw();

}
void draw(){
  
  if(keyPressed && (key == 'r' || key == 'R')){
     mouseX=(int)random(0,width);
     mouseY=(int)random(0,height);
     largeicon= !largeicon;  
}
 
  pp++;
  if(pp>360) { // processing a too fast so move the image every 13 seconds
    pp2+=2; 
  
   pp=0; 
  }
  

drawmenu();
image(menu,mouseX-menu.width/2,mouseY-menu.height/2);
PImage lop,lop2;
lop= new PImage(width,height);
lop2= new PImage(width,height);

//lop=get();
arraycopy(pixels,lop.pixels); // faster than lop = get();
arraycopy(pixels,lop2.pixels); 


if (keyPressed && (key =='c' || key =='C')){
  lop2.filter(GRAY);
  lop.blend(lop2,0,0,lop.width,lop.height,0,0,lop.width,lop.height,ADD);

}

image(lop,0,0);
//updatePixels();  // optional
}





