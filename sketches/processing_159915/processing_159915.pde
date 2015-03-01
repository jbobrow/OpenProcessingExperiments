
float xoffset = 200;
float yoffset = 200;
void setup() {
size(800, 800);
smooth();
}
 void draw() {
background(250,249,242);
 noStroke();
 fill(245,243,232);
 int i = 0;
while (i < 20){
rect(0, 0+yoffset*i, 100, 100);
rect(200,0+yoffset*i,100,100);
rect(400,0+yoffset*i,100,100);
rect(600,0+yoffset*i,100,100);
rect(800,0+yoffset*i,100,100);
rect(100,100+yoffset*i,100,100);
rect(300,100+yoffset*i,100,100);
rect(500,100+yoffset*i,100,100);
rect(700,100+yoffset*i,100,100);
rect(25+xoffset*i,125,50,50);
rect(25+xoffset*i,325,50,50);
rect(25+xoffset*i,525,50,50);
rect(25+xoffset*i,725,50,50);
rect(125+xoffset*i,25,50,50);
rect(125+xoffset*i,225,50,50);
rect(125+xoffset*i,425,50,50);
rect(125+xoffset*i,625,50,50);
i = i + 1; 
}
textSize(32);
fill(250,249,242);
text("I",145,355); 
text("D",345,355);
text("K",545,355);

 }




