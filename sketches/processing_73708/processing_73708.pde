
void setup (){
  size (800, 600);
  background(222);
  
  PImage img;
  img = loadImage ("http://www.google.com.br/imgres?hl=pt-BR&sa=X&rls=com.microsoft:pt-BR:{referrer:source?}&qscrl=1&biw=1366&bih=667&tbm=isch&prmd=imvns&tbnid=Y471exTbGQ6aIM:&imgrefurl=http://www.freefoto.com/preview/15-01-33/Tree-Black-and-White&docid=3pcOl1b2EsaVMM&imgurl=http://www.freefoto.com/images/15/01/15_01_33---Tree-Black-and-White_web.jpg&w=600&h=400&ei=0ZFwULKKLYmN0QGUz4C4Dw&zoom=1&iact=rc&dur=785&sig=100806079848907701223&page=1&tbnh=141&tbnw=176&start=0&ndsp=19&ved=1t:429,r:1,s:0,i:140&tx=133&ty=131");
  //image(img, 0, 0, width, height);
  
  println (img.width+""+ img.height);
  
 // int[] imgPixels = img.pixels;
  println(img.pixels.length);
  
  for (int i=0; i<img.pixels.length; i++){
      if((red(img.pixels[i])<20) && (green(img.pixels[i])<20) && (blue(img.pixels[i])<20)){
 //println(red(img.pixels[i])+""+green(img.pixels[i])+""+blue(img.pixels[i]));
  img.pixels[i] = color(255,0,0);
  }
}
image(img, 0, 0);
}
