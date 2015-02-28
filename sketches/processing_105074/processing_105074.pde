
void setup(){

  size(500,500);
}
void draw(){
background(255);
if(mouseX<=250 && mouseY<=250){
noStroke();
fill(240,222,37);
rectMode(CENTER);
rect(width/2,height/2,100,100);
}
else if(mouseX>=250 && mouseY<=250){
noStroke();
fill(17,152,137);
rectMode(CENTER);
rect(width/2,height/2,100,100);
}
else if(mouseX<=250 && mouseY>=250){
noStroke();
fill(167,12,17);
rectMode(CENTER);
rect(width/2,height/2,100,100);
}
else if(mouseX>=250 && mouseY>=250){
noStroke();
fill(7,152,172);
rectMode(CENTER);
rect(width/2,height/2,100,100);
}
}
