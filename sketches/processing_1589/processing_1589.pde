
void setup(){
size(400, 400);
background(240);//arka planin gri olmasi icin kullandim
noStroke();// cizgilerin olmamasi icin kullandim
rectMode(CORNER);
}

void draw(){
stroke(0);
strokeWeight(4);// cizgilerin kalin olmasi icin kullandim
line(165, 385, 165, 15);
fill(51, 36, 224);// kutunun icinin mavi olmasi icin kullandim
rect(165, 280, 95, 95);
strokeWeight(7);// cizginin daha kalin olmasi icin kullandim
line(385, 280, 15, 280);
line(385, 240, 15, 240);
line(385, 160, 15, 160);
strokeWeight(4);// cizginin daha ince olmasi için kullandim
line(260, 300, 260, 385);
}

