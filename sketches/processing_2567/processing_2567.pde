
/*

  a very simple example that draws the camera img
  to the screen using the pixel[] array.

 last tested to work in Processing 0090
 
 JTNIMOY
 
 */
 
import JMyron.*;

JMyron m;//a camera object
int umbral1=50;
 
void setup(){
  size(320,240);
  m = new JMyron();//make a new instance of the object
  m.start(width,height);//start a capture at 320x240
  
  m.findGlobs(0);//disable the intelligence to speed up frame rate
  println("Myron " + m.version()); 
}

void draw(){
  m.update();
  int[] img = m.image(); 
  
  loadPixels();
  /*for (int j=0;j<width*height/2;j++){
   pixels[j]=img[j]; 
  }*/
  for(int i=/*(width*height/2)+*/width+1;i<width*height-1-width;i++){ 
      pixels[i] = filtro(i,img);//+filtro2(i,img); 
      //pixels[i]= umbral(i,img);
  }
 img=pixels;
  for(int i=width+1;i<width*height-1-width;i++){ 
      //pixels[i] = filtro(i,img); 
     // pixels[i]= umbral(i,img);
  }
  updatePixels();
}

void mousePressed(){
  m.settings();//click the window to get the settings
}

public void stop(){
  m.stop();//stop the object
  super.stop();
}

color filtro(int i,int img[]){
  float mediaroja;
  float mediaverde;
  float mediaazul;
  float mediaroja3;
  float mediaverde3;
  float mediaazul3;
  color media;
  mediaroja=red(img[i])*0+red(img[i-1])-red(img[i+1])+0*red(img[i-width])+red(img[i-1-width])-red(img[i+1-width])+0*red(img[i+width])+red(img[i-1+width])-red(img[i+1+width]);
  mediaverde=green(img[i])*0+green(img[i-1])-green(img[i+1])+0*green(img[i-width])+green(img[i-1-width])-green(img[i+1-width])+0*green(img[i+width])+green(img[i-1+width])-green(img[i+1+width]);
  mediaazul=blue(img[i])*0+blue(img[i-1])-blue(img[i+1])+blue(img[i-width])*0+blue(img[i-1-width])-blue(img[i+1-width])+0*blue(img[i+width])+blue(img[i-1+width])-blue(img[i+1+width]);
  
  media=color(mediaroja,mediaverde,mediaazul);
  
  return media;


}

color filtro2(int i,int img[]){
  float mediaroja;
  float mediaverde;
  float mediaazul;
  float mediaroja3;
  float mediaverde3;
  float mediaazul3;
  color media;
  mediaroja=red(img[i])*0-red(img[i-1])+red(img[i+1])+0*red(img[i-width])-red(img[i-1-width])+red(img[i+1-width])+0*red(img[i+width])-red(img[i-1+width])+red(img[i+1+width]);
  mediaverde=green(img[i])*0-green(img[i-1])+green(img[i+1])+0*green(img[i-width])-green(img[i-1-width])+green(img[i+1-width])+0*green(img[i+width])-green(img[i-1+width])+green(img[i+1+width]);
  mediaazul=blue(img[i])*0-blue(img[i-1])+blue(img[i+1])-0*blue(img[i-width])-blue(img[i-1-width])+blue(img[i+1-width])+0*blue(img[i+width])-blue(img[i-1+width])+blue(img[i+1+width]);
  
 //mediaroja=mediaroja+mediaroja3;
 //mediaverde=mediaverde+mediaverde3;
 //mediaazul=mediaazul+mediaazul3;
  media=color(mediaroja,mediaverde,mediaazul);
  
  return media;


}

color umbral (int i, int img[]){
  float rojo, verde,azul;
  rojo=red(img[i]);
  verde=green(img[i]);
  azul=blue(img[i]);
  if (rojo>umbral1 || verde >umbral1 || azul>umbral1)
{
 rojo=255;
 verde=255;
 azul=255;
}
else{
  rojo=0;
  verde=0;
  azul=0;
} 
return color(rojo,verde,azul);
}

