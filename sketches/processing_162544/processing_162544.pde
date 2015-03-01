
PImage sad ;
PImage happy;
 
void setup() {
size(200,240);
happy = loadImage("http://avonmotophoto.com/wp-content/uploads/2013/05/before_21.jpg");
sad = loadImage("http://radjoa2.host56.com/captin2final.jpg.jpg");
}
void draw(){
if(mousePressed==true){
image(sad,0,0);
}else{
image(happy,0,0);
}
}
