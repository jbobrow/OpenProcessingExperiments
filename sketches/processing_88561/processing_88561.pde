
//landscape
//kanghyun huh
//homeword 1.2 part 3

void setup(){
size(500,500);
}
void draw(){
//sky
background(abs(mouseY-500)-500,abs(mouseY-500)-50,abs(mouseY-500)-50);
fill(255,50,23);

//sun
ellipse(mouseX, mouseY, 55, 55);

// sunlight
noStroke();
fill(255,182,23,200);
triangle(mouseX+(-26), mouseY+97, mouseX+(-6), mouseY+34, mouseX+(-6), mouseY+97);

fill(255,182,23,200);
triangle(mouseX+34, mouseY+94, mouseX+24, mouseY+34, mouseX+54, mouseY+84);

fill(255,182,23,200);
triangle(mouseX+44, mouseY+(-6), mouseX+99,mouseY+4, mouseX+84, mouseY+34);

//mountains

noStroke();
fill(85,255,86);
rect(0,400,500,100);
stroke(0);
fill(34,188,45);
triangle(300, 400, 400, 300, 500, 400);

stroke(0);
fill(34,188,45);
triangle(250, 400, 300, 250, 400, 400);

stroke(0);
fill(34,188,45);
triangle(130, 400, 240, 280, 300, 400);

//clouds
noStroke();
fill(255);
ellipse(60, 130, 100, 30);

noStroke();
fill(255);
ellipse(100, 110, 80, 30);

noStroke();
fill(255);
ellipse(200, 130, 100, 30);

noStroke();
fill(255);
ellipse(250, 140, 80, 30);

noStroke();
fill(255);
ellipse(400, 130, 100, 30);

}







