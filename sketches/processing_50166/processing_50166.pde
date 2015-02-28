

void setup()
{
size(200,200);
}

void draw()
{
background(255);
float h = height/2;

for (float w = 220; w > 0; w = w -8) {

rect (h,h,w,w);
rect (h,h,-w,-w);
fill(w + mouseX - mouseY);
}

for (float w = 220; w > 0; w = w -8) {
rect (h,h,-w,w);
rect (h,h,w,-w);
fill(w + mouseY - mouseX);
}
}


