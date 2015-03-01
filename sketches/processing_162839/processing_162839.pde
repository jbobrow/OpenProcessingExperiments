
/*void setup() {
size(500,375);
background(255,255,0);
 
}
 
void draw() {
 
rect(180,180,50,50);
fill(0,255,255);
 
if ((mouseX>180)&&(mouseY>180)&&(mouseX<230)&&(mouseY<230)){
fill(255,0,0);
    }
}
*/
//mousePressedDemo
PImage sad ;
PImage happy;
 
void setup() {
size(500,375);
happy = loadImage("http://media.tumblr.com/b6e516b50ff80b6da4bd562743c9c091/tumblr_inline_ncfhuuvp5p1t0f4bg.jpg");
sad = loadImage("http://media.tumblr.com/c0dac6072b2e61975c4ddfa8c17c79d7/tumblr_inline_ncfhvhd5x61t0f4bg.jpg");
}
void draw(){
if(mousePressed==true){
image(sad,0,0);
}else{
image(happy,0,0);
}
}
