
size(500,500);
rectMode(CENTER);
    void retdraw(x,y,l){
    rect(x,y,l,l);
    ellipse(x,y,l,l);
}
for (int i=0; i < 10; i++){
 x=random(0,500)
 y=random(0,500)
 l=random(10,100)
 retdraw(x,y,l);
 }
