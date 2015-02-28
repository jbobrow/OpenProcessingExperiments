
PImage im;
int i=0;
int j=0;
color micolor;
color minewcolor;
float value;

void setup() {
  im = loadImage("tints_gradSunset.jpg");
  //size(im.width,im.height);
  size(300,169);
  image(im,0,0,width, height);
}

//int i = frameCount % width;
//int j = frameCount/width; 

void draw(){
  for (i=0;i<im.width;i++){
    for (j=0;j<im.height;j++){
      micolor=get(i,j);
      value = brightness(micolor);      
        //minewcolor=color(((red(micolor)+1)%256),((green(micolor)+1)%256),((blue(micolor)+1)%256));
        if (value>100) {
          minewcolor=color(255,255,255);
          set(i,j,minewcolor);
        }  
        else{  
          minewcolor=color(0,0,0);
          set(i,j,minewcolor);
        }  
    }
  }    
}



