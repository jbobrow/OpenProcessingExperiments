
//certain things happen when mouse is in certain area//
float speed = 2.0;
float move; 
 
void setup() {
size(400,400);
background(255,255,0);
surprise = loadImage("http://www.xcitingclub.es/files/posted_images/user_3302_thumb_posted_emoticono_gigante.gif");
noStroke();
}
 
void draw() {
 
move=move+speed;
    if (move > 400) {
  move=0;
 }
ellipse(180,180,move,move,50,50);
fill(255,255,0);
 
if ((mouseX>160)&&(mouseY>158)&&(mouseX<210)&&(mouseY<210)){
fill(0,255,random(0,255));
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
