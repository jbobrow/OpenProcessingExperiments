
void setup(){
size(1000,600);
background(30,200,0);
}



void keyPressed(){
if(key == '1'){
fill(200,200,200);
noStroke();
smooth();
ellipse(300,300,450,265);
}

if(key == '2'){
fill(255,255,255);
noStroke();
rect(100,200,300,200);
}

if(key == '3'){
fill(200,200,200);
noStroke();
triangle(250,260,250,210,700,500);
triangle(250,360,250,430,700,100);
noFill();
stroke(0,0,235);
strokeWeight(30);
ellipse(150,240,200,100);
ellipse(200,400,100,100);
fill(0,0,0);
noStroke()
ellipse(375,310,40,40);
}}
