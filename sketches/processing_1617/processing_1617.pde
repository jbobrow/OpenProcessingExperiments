
class Clr {
  color[] index;
  color[] indexA;
  color[] indexB;
  PImage img;
  PImage img2;
  String imgname;
  String imgname2;
  int numcols;
  int flip = 0;
  float[] h;
  float[] s; 
  float[] b;
  int next;
  
  Clr(int tempNumcols, String tempImgname){
    numcols = tempNumcols;
    imgname = tempImgname;
    imgname2 = tempImgname;
    img = loadImage(imgname);
    img2 = loadImage(imgname2);
    indexA = new color[numcols];
    indexB = new color[numcols];
    index = new color[numcols];
        h = new float[numcols];
        s = new float[numcols];
        b = new float[numcols];
    colorMode(RGB);
  }
  
    Clr(int tempNumcols, String tempImgname, String tempImgname2){
    numcols = tempNumcols;
    imgname = tempImgname;
    imgname2 = tempImgname2;
    img = loadImage(imgname);
    img2 = loadImage(imgname2);
    indexA = new color[numcols];
    indexB = new color[numcols];
    index = new color[numcols];
        h = new float[numcols];
        s = new float[numcols];
        b = new float[numcols];
    colorMode(RGB);
  }
  
  void loadColors(){
    for (int i = 0; i < numcols; i++){
      indexA[i]=color(img.get(int(img.width/numcols*(i+1)-0.5*img.width/numcols), int(img.height/2)));
      indexB[i]=color(img2.get(int(img2.width/numcols*(i+1)-0.5*img2.width/numcols), int(img2.height/2)));      

      h[i] = red(indexA[i]);
      s[i] = green(indexA[i]);
      b[i] = blue(indexA[i]);

    index[i] = color(h[i], s[i], b[i]);  
    }
    //arrayCopy(indexA, index);
}

void switchColorsB(){
    
   for(int i = 0; i < numcols; i++){

   if (h[i] > red(indexB[i])){
   h[i] = h[i]-9;}
   if (s[i] > green(indexB[i])){
   s[i] = s[i]-9;}
   if (b[i] > blue(indexB[i])){
   b[i] = b[i]-9;}
   
   if (h[i] < red(indexB[i])){
   h[i] = h[i]+9;}
   if (s[i] < green(indexB[i])){
   s[i] = s[i]+9;}
   if (b[i] < blue(indexB[i])){
   b[i] = b[i]+9;}
   
   index[i] = color(h[i], s[i], b[i]);
  }


}



void switchColorsA(){
    
   for(int i = 0; i < numcols; i++){

   if (h[i] > red(indexA[i])){
   h[i] = h[i]-9;}
   if (s[i] > green(indexA[i])){
   s[i] = s[i]-9;}
   if (b[i] > blue(indexA[i])){
   b[i] = b[i]-9;}
   
   if (h[i] < red(indexA[i])){
   h[i] = h[i]+9;}
   if (s[i] < green(indexA[i])){
   s[i] = s[i]+9;}
   if (b[i] < blue(indexA[i])){
   b[i] = b[i]+9;}
   
   index[i] = color(h[i], s[i], b[i]);
  }


}




}

