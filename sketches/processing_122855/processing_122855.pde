
void setup(){
size(800,800);
}

void draw(){
background(255,255,255);
stroke(0);
fill(0,0,0);
rect(mouseX -20,mouseY +60,40,65);  //linker been
rect(mouseX +70,mouseY +60,40,65);  //rechter been
rect(mouseX -90,mouseY -50,60,30);  //linker arm
rect(mouseX +120,mouseY -50,60,30);  //rechter arm
fill(0,0,255);
ellipseMode(CENTER);
ellipse(mouseX +45,mouseY -20,200,210); //lichaam
ellipse(mouseX +45,mouseY -170,180,180); //hoofd
fill(0,0,0);
ellipse(mouseX +15 ,mouseY -175,32,64); //linker oog
fill(255,255,255);
ellipse(mouseX +15,mouseY -175,8,16); //linker pupil
fill(0,0,0);
ellipse(mouseX +80,mouseY -175,32,64); //rechter oog
fill(255,255,255);
ellipse(mouseX +80,mouseY -175,8,16); //rechter pupil

fill(0,0,0);
ellipse(mouseX +45,mouseY -115,64,32); //mond
fill(0,0,0);
ellipse(mouseX +40,mouseY -155,4,16); //rechterneusgat
ellipse(mouseX +55,mouseY -155,4,16); //linkerneusgat
}


