
size(500,500);
rectMode(CENTER);
void retdraw(x,y,l){
rect(x,y,l,l);
ellipse(x,y,l,l);
}
for(int i=0; i < 50; i++){
     println(i);
float x =random(0,500);
float y =random(0,500);
float l =random(10,50);
retdraw(x,y,l);
}
