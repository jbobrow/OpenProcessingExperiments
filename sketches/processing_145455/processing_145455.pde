
void setup() {
size (500,500)
frameRate (25)
}

void draw(){
background (255,255,255)
fill(0,0,0)
ellipse(100,100,100,100) //whole

fill(142,229,238)
ellipse (140,50,50,50) //outer eye

fill(142,229,238)
ellipse(60,50,50,50) //inner eye

fill(255,255,255)
ellipse(140,60,34,32) //outer eye 2

fill(mouseX,mouseY,255)
ellipse(mouseX,mouseY,34,32) //inner eye 2

}

