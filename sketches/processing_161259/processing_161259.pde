

PImage sad ;
PImage happy;
 
void setup() {
size(335,284);
happy = loadImage("http://38.media.tumblr.com/a361f11889cbf160ef74c0dbda74dcd3/tumblr_nc1xv4nFn11tlzwuxo1_400.jpg");
sad = loadImage("http://s3.amazonaws.com/assets.prod.vetstreet.com/d4/95/f28436cc46868aaaa1304e1996f7/grumpycat335aa053113.jpg.jpg");
}
void draw(){
if(mousePressed==true){
image(sad,0,0);
}else{
image(happy,0,0);
}
}


