
//certain things happen when mouse is in certain area//
 
/*


 
 

 
if ((mouseX>180)&&(mouseY>180)&&(mouseX<230)&&(mouseY<230)){
fill(255,0,0);
    }
}
*/
//mousePressedDemo
PImage original ;
PImage retouch;
int xSize = 500;
int ySize = 800;

 
void setup() {
size(xSize, ySize);
original = loadImage("https://38.media.tumblr.com/acc95630107474b4ce52d0318290e318/tumblr_ncn4lrOYRs1r83h4ro1_500.jpg");
retouch = loadImage("https://38.media.tumblr.com/aeb8fe4e9054e5b8d058d1dd914119cf/tumblr_ncn4l6FglD1r83h4ro1_1280.jpg");
}
void draw(){
if(mousePressed==true){
image(original, 0, 0,xSize,ySize);
}else{
image(retouch, 0, 0,xSize,ySize);
}
}

