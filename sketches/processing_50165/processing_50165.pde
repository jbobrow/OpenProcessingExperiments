

void setup()
{
size(200,200);
}

void draw()
{
background(255);

for (float w = 220; w > 0; w = w -8) {
ellipse (width/200,height/200,w,w);
ellipse (width, height/200,w,w);
ellipse (width/200,height,w,w);
ellipse (width,height,w,w);
ellipse (width/2,height/2,w,w);
fill(w + mouseX - mouseY);
}




}

