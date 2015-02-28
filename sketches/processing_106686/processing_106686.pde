
int x=20;
int y=20;

void setup () {

    size(500,500)

}

void draw () {
 fill(100,255, 0)
 ellipse(x,y, 20, 20);
 x= x+1
 y= y+1
  fill (100,0,255);
    ellipse(mouseX, mouseY, 20, 20);
    
}
