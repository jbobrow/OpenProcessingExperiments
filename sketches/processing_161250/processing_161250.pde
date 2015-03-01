
void setup() {
size(400,400);
background(100,149,237);
surprise = loadImage("http://www.xcitingclub.es/files/posted_images/user_3302_thumb_posted_emoticono_gigante.gif");
}
 
void draw() {
 
rect(80,80,200,200);
fill(0,255,255);
 
if ((mouseX>80)&&(mouseY>80)&&(mouseX<280)&&(mouseY<280)){
fill(197,192,192);
    }
}
 
//mousePressedDemo
/*PImage sad ;
PImage happy;
 
void setup() {
size(400,400);
happy = loadImage("http://www.migrelief.com/wp-content/uploads/2011/05/happy-face1.jpg");
sad = loadImage("http://www.jackizehner.com/wp-content/uploads/2010/04/unhappy_face_sticker-p217427116611791537qjcl_400.jpg");
}
void draw(){
if(mousePressed==true){
image(sad,0,0);
}else{
image(happy,0,0);
}
}
*/

