
size(500,500);
rectMode(CENTER);
void retdraw(x, y,l){
    rect(x,y,20,20);
    ellipse(x,y,20,20);
    triangle(x,y-12,x-9,y+7,x+9,y+7);
}
retdraw(200,200);
retdraw(400,100);
