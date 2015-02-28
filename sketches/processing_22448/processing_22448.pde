
PImage flowers;

void setup(){
size(450,350);
colorMode(HSB, 360,100,100);
flowers = loadImage ("flowers.png");
photoFilter();
}
void draw(){

}

void photoFilter (){  
flowers.loadPixels();
int flowersSize = flowers.width * flowers.height;
for(int i=0; i<flowersSize; i++){
color p = flowers.pixels [i];
float h = hue(p);
float s = saturation(p);
float b = brightness(p);
if(b>35){
s+=80;
}
 if(h<65){
   h+=100;
 }
 if(h>25){
   h+=110;
}

flowers.pixels[i] = color (h,s,b);
}
flowers.updatePixels();
tint(30,15,60);
image(flowers,0,0);
}


