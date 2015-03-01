
//mousePressedDemo
PImage inlove;
PImage chilling;
 
void setup() {
size(400,400);
chilling = loadImage("https://imagizer.imageshack.us/v2/897x937q50/538/RbfPkr.jpg");
inlove = loadImage("https://imagizer.imageshack.us/v2/897x937q90/661/fpQF18.jpg");
//inlove.resize(400, 400);

}
void draw(){
if(mousePressed==true){
image(inlove,0,0,400,400);
}else{
image(chilling,0,0,400,400);
}
if(mousePressed==false){
textSize(15);
text("Click Here", 200, 25);
fill(random(0,255));
}
}

