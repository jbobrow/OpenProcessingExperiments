
void setup () {
size (500,400)
}

void draw () {
background (0)

stroke (255,0,0) 
fill (255,0,0)
ellipse (250, 200, 400, 400)

stroke (255)
fill (255)
ellipse (250, 200, 300, 300)

stroke (255, 0, 0)
fill (255, 0, 0)
ellipse (250, 200, 200, 200)

stroke (255)
fill (255)
ellipse (250, 200, 100, 100)

stroke (123, 16, 217)
fill (123, 16, 217)
triangle (mouseX, mouseY, mouseX+50, mouseY+50, mouseX+50, mouseY-50)
}
