
PImage Popart;
noStroke();
string url= "http://processing.org/img/processing_cover";
Popart=loadImage(url, "jpg");
size(Popart.width, Popart.height);
image(Popart, 0, 0);
for(int x=0; x<width; x+=5)
  for(int y=0; y<height; y+=5) {
   float m=brightness(get(x,y))/95;
    color MyPixel=get(x,y);
    int r = int(red(MyPixel));
    int g = int(green(MyPixel));
    int b = int(blue(MyPixel));
    if (r>200 && g>200 && b>200){
      r=255;
      g=255;
      b=255;}
      else if((r==255) || (g==0 && b==0)){
        r=255;
        g=0;
        b=0;} 
        else if ((g==255) || (r==0 && b==0)){
          r=0;
          g=255;
          b=0;}
          else if ((b==255) || (r==0 && g==0)){
            r=0;
            g=0;
            b=255;}
            else if (r==g && b!=255){
              r=255;
              g=255;
              b=0;}
              else if ((b>r && g==0) || (b==255 && g!=255)){
                r=127;
                g=0;
                b=255;}
                else if (g==b && r<255){
                  r=0;
                  g=255;
                  b=255;}
                  else{
                    r= r;
                    g= g;
                    b= b;}
    fill(255);
    rect(x,y,5,5);
    fill(color(r,g,b));
    ellipse(x,y,5-m,5-m);}
//save("pic.jpg");

