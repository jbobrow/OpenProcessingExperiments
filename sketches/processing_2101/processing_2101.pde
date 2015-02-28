
/*
Written by : Owaun Scantlebury
May 18th 2009
Move the mouse up and down to filter between any two images (preferably color and grayscale)

Press 'f' to flip between the two images

Press the mouse to enable split view.

*/

public boolean skip= false;
public boolean flip = false;
PImage t,t2,t3,t4;
PGraphics tx;
public int w= 700;
public int h= 500;
//public String pic1oloc ="http://fc09.deviantart.com/fs20/f/2007/254/c/e/Car_Colour_01_by_Omar_Dogan.jpg";
//public String pic2oloc ="http://fc05.deviantart.com/fs21/f/2007/251/b/3/Car_Lines_01_by_Omar_Dogan.jpg";
//public String pic3oloc ="http://fc02.deviantart.com/fs19/f/2007/251/e/4/Car_Sketch_01_by_Omar_Dogan.jpg";

//public String pic1oloc="http://fc05.deviantart.com/fs24/f/2008/010/c/a/Country_Charger_by_Omar_Dogan.jpg";
//public String pic2oloc ="http://fc01.deviantart.com/fs22/f/2008/014/2/7/Country_Charger_Colour_by_Omar_Dogan.jpg";

//public String pic1oloc="http://fc07.deviantart.com/fs44/f/2009/111/9/9/99c7909b88290133dead1874d961cf82.jpg";
//public String pic2oloc="http://fc01.deviantart.com/fs44/f/2009/109/7/3/73a913eacdc95e2a58c0fc90d627b835.jpg";

//public String pic1oloc="http://fc04.deviantart.com/fs18/f/2007/176/b/a/Udon_Sketchbook_2007_Colour_by_Omar_Dogan.jpg";
//public String pic2oloc="http://fc03.deviantart.com/fs17/f/2007/165/1/b/2007_Udon_Sketchbook_BW_by_Omar_Dogan.jpg";

//public String pic1oloc="http://fc06.deviantart.com/fs17/f/2007/169/4/7/Colored_Velvet_by_physicdesigns.jpg";
//public String pic2oloc="http://fc04.deviantart.com/fs18/f/2007/169/7/4/Velvet_pencil_and_ink_by_physicdesigns.jpg";

//public String pic1oloc="http://fc01.deviantart.com/fs13/f/2007/079/9/f/Ghost_in_the_Shell_Trads_by_physicdesigns.jpg";
//public String pic2oloc="http://fc06.deviantart.com/fs13/f/2007/079/0/8/Ghost_in_the_Shell_color_by_physicdesigns.jpg";

public String pic1oloc="http://fc04.deviantart.com/fs11/i/2006/235/f/d/Lost_Days_Nine_by_physicdesigns.jpg";
public String pic2oloc="http://fc02.deviantart.com/fs11/i/2006/235/f/8/Nine_Days_Lost_by_physicdesigns.jpg";

public String pic1o = "car.jpg";//street
public String pic2o = "carc.jpg";

public String pic1 = pic1o;
public String pic2 = pic2o;
PGraphics t1;
public int my;
void setup(){
  
 t= loadImage(pic1); 

  

 t1 = createGraphics(w,h,P3D);
  tx = createGraphics(w,h,P3D);
  t4 = new PImage(w,h);
    t3 = new PImage(w,h);
      t2 = new PImage(w,h);
 t1.beginDraw();
 t1.image(loadImage(pic2),0,0,w,h);  
 t1.endDraw();
 
 tx.beginDraw();
 tx.image(t,0,0,w,h);  
 tx.endDraw();
 t4.pixels= tx.pixels;
 t3.pixels = t4.pixels;
 t2.pixels = t3.pixels;
 //t3= loadImage(pic1); 
 // t2= loadImage(pic1); 
  
 size(w,h);
 t1.mask(t4);
 skip = true;
}

void draw(){
loadPixels();

if (flip){
  pic1 = pic2o;
  pic2= pic1o;

}
else
{
  pic1 = pic1o;
  pic2= pic2o;  
}
  
  background(t1);
  tint(255, mouseY); //transparency up and down 
   stroke(1);


  for (int x =0; x <width; x++){
 
          my = mouseY;
    
     for (int y = 0; y <my;y++){

     
        if (skip){
           if (y > 1 && y <height-1 ){ 
       pixels[x+y*width]=t3.pixels[x+y*width];
           }
        }
    
     }
    
       

     for (int z = my; z <height;z++){
          if (skip){
            if (!mousePressed && z < height -1 && z > 1 ){
         pixels[x+z*width]=t2.pixels[x+z*width];
            }
       }
      }
   } 

 updatePixels();  
     image(t1,0,0);
//     if (mousePressed){
//       line(0,my,width,my);
//     }
  

}


void keyPressed()
{

 
 if (key == 'f'){
  flip = !flip; 
   setup();
 }
 
 
}

