
void setup(){
size(200,230);
}

void draw(){
background(255,199,153);
smooth();

ellipseMode(CENTER);
rectMode(CENTER);

//face
noStroke();
fill(70,119,169);
ellipse(100,100,110,110);

if(mouseX<=128){
  ellipse(98,120,128,70);
} else if(mouseX>128 && mouseX<145){ 
ellipse(98,120,mouseX,70);}
else{
ellipse(98,120,145,70);
}



noStroke();
fill(200,50,50,mouseX);
ellipse(40,115,29,16);
ellipse(150,115,30,17);


//mouse//
stroke(80,54,48);
line(110,135,130,138);

//eyes//
fill(255,169,103);
noStroke();
ellipse(73,90,20,36);
ellipse(113,90,26,42);
fill(80,54,48);
noStroke();
ellipse(75,92,16,20);
ellipse(115,92,21,25);
fill(70,119,169);
noStroke();
rect(97,75,70,30);


}

