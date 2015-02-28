
void setup(){
size(500,500);

}

void draw(){
strokeWeight(2);
background(255,255,255);
stroke(0);
ellipseMode(CENTER);

//hoofd
fill(28,24,255);
ellipse (mouseX+105, mouseY+20, 80, 80);

//buik
fill (67,192,247);
rect(mouseX+40,mouseY+60,130,130);

//voeten
fill (0,145,252);
rect(mouseX+40,mouseY+190,30,30);
rect(mouseX+140,mouseY+190,30,30);

//armen, mond en navel
line (mouseX-50,mouseY+60,mouseX+280,mouseY+60);
line (mouseX-50,mouseY+60,mouseX-50,mouseY+10);
line (mouseX+280,mouseY+60,mouseX+280,mouseY+100);
fill(22,0,175);
ellipse (mouseX+105,mouseY+145,10,10);
strokeWeight(3);
line(mouseX+71, mouseY+40, mouseX+139, mouseY+40);

// ogen
fill (3,255,21);
strokeWeight(2);
ellipse (mouseX+123,mouseY+10,16,32);
ellipse (mouseX+88,mouseY+10,16,32);

}
