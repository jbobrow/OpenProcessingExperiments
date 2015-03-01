
()void setup() {
background(0,255,255);
size(400,400);
}

void draw() {
fill(255,255,51);
ellipse(200,200,200,200);
fill(0,0,0);
ellipse(175,175,10,10);
ellipse(225,175,10,10);
noFill();
arc(200,230,100,50, 0.2, PI - 0.2);
fill(127,0,255);
textSize(50);
text("Girls Byte", 90,350);
fill(255,255,255);
triangle(185,300,170,250,200,255);
triangle(215,300,230,250,200,255);
fill(216,29,29);
if(keyPressed == true){
    if(key == 's'){
        saveFrame("Girls Byte.jpg");
        }
        }
}
