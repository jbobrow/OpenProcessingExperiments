
void setup(){
int mega;
int ObSize = 4;
smooth();
size(600,267);
translate(width/2, height);
background(1);


for(mega = 0; mega< 60; mega =mega +1){
rotate(.1);
noStroke();
fill(245,166,17,50);
ellipse(0,20,ObSize*53,67);
stroke(1);
fill(255,6,0);
rect(0,67,ObSize*13,ObSize*67);
fill(255,190);
noStroke();
ellipse(0,200,93,93);
ellipse(0,283,ObSize*26,ObSize*26);
}
}

void draw(){
}

