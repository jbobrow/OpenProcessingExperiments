
void setup() {
size(400, 800);
smooth();
noStroke();
textSize(25);
}

void draw() {
float x = random (1,10);
frameRate(x);
textAlign(CENTER); 
float y = random(252.8,254.2);
background(255);
textSize(10);
fill(245);
text("peripheral", width/2, height/2 -80);
text("hae bung min", width/2, height/2 +80);
textSize(25);
fill(y);
text("that which eludes your eyes", width/2,height/2 - 40);
text("white whispers and sighs", width/2, height/2);
//text(second line) dont need a rhyme. accuracy of image "is" not a definite word
//text("your? white whispers and sighs", width/2, height/2);
}


