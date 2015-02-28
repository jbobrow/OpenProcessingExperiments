
void setup(){
size(250,250);
}
void draw(){
smooth();
background(#5FC3FF);
noStroke();

//transparent yellow circles
fill(#EDFF03, 100);
ellipse(125, mouseY, 100, 100);

fill(#DCFF00, 100);
ellipse(125, mouseY, 85, 85);

//transparent orange circles
fill(#FFCD00, 100);
ellipse(125, mouseY, 70, 70);

fill(#FF8D00, 100);
ellipse(125, mouseY, 50, 50);

fill(#FF0011, 100);
ellipse(125, mouseY, 10, 10);

fill(#FF1A00, 100);
ellipse(125, mouseY, 30, 30);


//clouds
fill(255, 150);
ellipse(mouseX, 125, 60, 30);

fill(255, 150);
ellipse(mouseX + 10, 135, 80, 50);

fill(255, 150);
ellipse(mouseX + 30, 150, 100, 70);

fill(255, 150);
ellipse(mouseX + 90, 160, 60, 30);

fill(255, 150);
ellipse(mouseX + 70, 140, 80, 50);

}
   
   

