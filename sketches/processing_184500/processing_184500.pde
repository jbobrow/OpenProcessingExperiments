
void setup(){
size(400,400);
background(173,216,230);
noStroke();

fill(139,69,19);
ellipse(200,350,200,300);
fill(173,216,230);
rect(100,200,200,100);
fill(255);
//eyes
stroke(139,75,19);
ellipse(160,330,50,40);
ellipse(240,330,50,40);
stroke(139,69,19);
fill(139,69,19);
rect(135,300,50,30);
rect(215,300,50,30);
fill(255);
stroke(160,82,45);
line(190,360,190,320);
} 
void draw(){ 
float r=random(255);
fill(0);
if(mouseY>300){
stroke(139,75,19);
ellipse(mouseX,mouseY,30,30); 
fill(139,69,19);
rect(135,300,50,30);
rect(215,300,50,30);
}
else
{

fill(255,r,120,100); 
//ellipse(mouseY,height/4,70,mouseX);
noStroke();
rect(135,300,50,30);
rect(215,300,50,30);
triangle(mouseX,mouseY,pmouseX,pmouseY,250,299);
triangle(mouseX,mouseY,pmouseX,pmouseY,150,299);
}
}
