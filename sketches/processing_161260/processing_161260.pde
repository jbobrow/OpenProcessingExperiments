
void setup() {
size(400,400);
background(50,50,255);
 surprise = loadImage("http://www.xcitingclub.es/files/posted_images/user_3302_thumb_posted_emoticono_gigante.gif");
}
  
void draw() {
    rect (10,10,380,380);
    fill (10,20,50);
     
    if ((mouseX>10)&&(mouseY>10)&&(mouseX<380)&&(mouseY<380)){
    fill (255,200,10);
    }
    if (mousePressed){
    fill (0,0,170);
    }
    rect (70,70,260,260);
    fill (0,30,180);
    if ((mouseX>70)&&(mouseY>70)&&(mouseX<260)&&(mouseY<260)){
    fill (20,20,70);
    }
    rect(150,150,100,100);
fill (0,255,255);
if ((mouseX>150)&&(mouseY>150)&&(mouseX<280)&&(mouseY<280)){
fill(random (0,255));
}
if (mousePressed){
fill (0,200,50);
}  
     }

