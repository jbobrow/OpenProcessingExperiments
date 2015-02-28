

PImage img;
PImage img2;
int mode = 0;


void setup(){
  img = loadImage("flowers.png");
  img2=new PImage(img.width, img.height);
  size(1280,480);
}


void draw(){
  image(img,0,0);
  
  for(int x=0; x < img.width; x++){
    for(int y=0; y < img.height; y++){
      color c = img.get(x,y);
      float r = red(c);
      float g = green(c);
      float b = blue(c);
      
      //Number One
      if (mode==0) img2.set(x,y,color(r+90,g+90,b+90));  //This is making the image noticeably brighter
      //-----------------
      
      //Number One
      if (mode==1) img2.set(x,y,color(r-90,g-90,b-90));  //This is making the image noticeably darker
      //-----------------
      
      //Number Two
      if (mode==2) img2.set(x,y,color((255*(r-50)/205),(255*(g-50)/205),(255*(b-50)/205)));  //This is increasing the contrast
      //-----------------
      
      //Number Three
      if (mode==3) img2.set(x,y,color(255-r,22-g,255-b));  //This is inverting the colors
      //-----------------
      
      //Numer Four
      if (mode==4){
        if(((int)(r+g+b)/3)>180){  //Reduces the bit depth to one, limiting the image to 2 colors, aka 'black and white'
            img2.set(x,y,color(200,200,200)); 
            
        }    
        else{
                img2.set(x,y,color(50,50,50)); 
        }
      }
      //-----------------
      
      //Number Five
      if (mode==5) img2.set(x,y,color((int)(r+g+b)/3)); //Grayscales the image
      //-----------------
      
      //Number Six
      if (mode==6) img2.set(x,y,color(g,r,b));  //I swapped red with green so now all the leaves will appear red and the metal will look green
      //-----------------
      
      //Number Seven
      if (mode==7){
        if(x>0 && (img.get(x,y)>img.get(x-1,y-1))){  //I attempted to outline the borders of the objects in this image in order to make them stand out more
            img2.set(x,y,color(0,0,0)); 
            
        }    
        else{
                img2.set(x,y,color(r,g,b)); 
        }
      }
      //-----------------
    }
  }
  image(img2,img.width,0);
}

void mouseClicked(){
  mode = (mode+1)%8;
  println("Mode: " + mode);
}


