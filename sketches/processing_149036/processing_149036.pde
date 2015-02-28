
 float x=0;
void setup()
{
size(300,300);
}
void draw(){
     if (mouseX > width/2) {
        if (mouseY > height/2) {
        fill(255);
        rect(width/2,height/2,width/2,height/2);
        }
        }
}

//x = constrain (x,0,100);
