
float colorValue;

void setup(){
size (600,600);
stroke(0);
}

void draw(){
background (255);

if(dist(mouseX,mouseY,300,300)<60){ 
fill(255,0,0); //red
}
rect(150,0,600,420);
fill(255);
rect(0,0,150,150);
stroke(0);

if(dist(mouseX,mouseY,128,500)<50){
fill(34, 64, 227); //blue

rect(0,420,150,600); 

stroke(0);
}

if(dist(mouseX,mouseY,550,512)<60){
fill(255,235,10); //yellow
rect(510,510,510,510);
stroke(0);
}
line(510,420,510,510);
line(0,600,0,0);

stroke(0);
fill(0);
rect(150,0,15,600);


stroke(0);
fill(0);
rect(0,420,600,15);

stroke(0);
fill(0);
rect(0,150,150,25);


stroke(0);
fill(0);
rect(510,420,15,600);


stroke(0);
fill(0);
rect(510,510,600,15);


stroke(0);
fill(0);
rect(0,0,600,15);


stroke(0);
fill(0);
rect(0,0,15,600);


stroke(0);
fill(0);
rect(585,10,15,600);


stroke(0);
fill(0);
rect(0,585,589,15);
}







