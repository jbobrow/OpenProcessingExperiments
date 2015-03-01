
//certain things happen when mouse is in certain area//


void setup() {
size(400,400);
background(25,0,255);

}

void draw() {

rect(180,180,50,50);
fill(0,55,255);

if ((mouseX>180)&&(mouseY>180)&&(mouseX<230)&&(mouseY<230)){
fill(255,50,050);
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
