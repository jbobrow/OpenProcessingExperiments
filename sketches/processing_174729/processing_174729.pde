
// Ein Pinguin
// 02.12.2014

/*Aufgabenstellung
Zeichne ein Tier, z.B. den ausliegenden Pinguin */
void setup(){
size(500,500);

}

void draw(){
background(0,180,20);
background(0,180,20);
noStroke()
fill(0,0,0);
ellipse(250,250,200,250);
fill(255,255,255);
ellipse(230,175,50,70);
ellipse(250,300,150,160);
ellipse(260,175,50,70);
fill(0,0,0);
ellipse(230,175,15,25);
ellipse(260,175,15,25);
fill(255,255,0);
ellipse(220,375,55,25);
ellipse(280,375,55,25);
triangle(245,230,260,195,230,195);
fill(0,0,0);
triangle(370,280,345,250,335,200);
triangle(130,280,155,250,165,200);


if(mouseX<=350 && mouseX>=150 && mouseY<=375 && mouseY>=125){
background(0,180,20);
noStroke() 
fill(0,0,0);
ellipse(250,250,200,250);
fill(255,255,255);
ellipse(230,175,50,70);
ellipse(250,300,150,160);
ellipse(260,175,50,70);
fill(255,0,0);
ellipse(230,175,20,30);
ellipse(260,175,20,30);
fill(255,255,0);
ellipse(230,375,55,25);
ellipse(270,375,55,25);
triangle(255,230,260,195,230,195);
fill(0,0,0);
triangle(370,250,345,250,335,210);
triangle(130,250,155,250,165,210);

}}

