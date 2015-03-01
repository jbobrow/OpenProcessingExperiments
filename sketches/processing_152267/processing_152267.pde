
int col;
int col2;
int col3;


void setup(){
size(500,500);
background(255,255,255);
col = random(1,255);
col2 = random(1,255);
col3 = random(1,255);
noStroke();

}

void draw(){





if (mousePressed == true){
col = random(1,255);
col2 = random(1,255);
col3 = random(1,255);




ellipse(mouseX, mouseY,10,10);
fill(col,col2,col3);



}

} 
