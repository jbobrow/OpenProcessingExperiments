
PImage Apart;
PImage Together;
  
void setup() {
size(400,400);
Apart = loadImage("http://i942.photobucket.com/albums/ad268/acef5961/1st_zps17629408.jpg");
Together = loadImage("http://i942.photobucket.com/albums/ad268/acef5961/2nd_zpsa127e120.jpg");
//inlove.resize(400, 400);
 
}
void draw(){
if(mousePressed==true){
image(Apart,0,0,400,400);
}else{
image(Together,0,0,400,400);
}
if(mousePressed==false){
textSize(15);
text("Make Them Dance", 200, 25);
fill((40,255));
}
}

