
//certain things happen when mouse is in certain area//


void setup() {
size(400,400);
background(255,0,0);
surprise = loadImage("http://www.xcitingclub.es/files/posted_images/user_3302_thumb_posted_emoticono_gigante.gif");
}

void draw() {

rect(180,180,50,50);
fill(0,56,255);

if ((mouseX>180)&&(mouseY>180)&&(mouseX<230)&&(mouseY<230)){
fill(25,37,0);
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
