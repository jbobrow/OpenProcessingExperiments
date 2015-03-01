
void setup (){
size(600,600);
}
void draw(){

if (mouseX <= width/2){
background (0,255,0);
fill(0,0,255);
ellipse(random(0,width/2),random(0,height),50,50);
}else{
background(0,0,255)
fill(0,255,0);
rectMode(CENTER)
rect(random(width/2,width),random(0,height),50,50);
}

}
