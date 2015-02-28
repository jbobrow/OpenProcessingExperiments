
void setup()
{size(400,600);

}

void draw()
{

background(0);

noStroke();
//forme1
fill(255);
beginShape();
arc(200,300, 50, 50,0,PI);
arc(175, 300, 50, 50,-PI/2,0);
arc(200, 300, 50, 50,-PI/2,0);
endShape(CLOSE);




for (int i=0;i<360;i+=5){
rotate(radians(10));
fill(255);
beginShape();
arc(200,300, 50, 50,0,PI);
arc(175, 300, 50, 50,-PI/2,0);
arc(200, 300, 50, 50,-PI/2,0);
endShape(CLOSE);}


for (int i=0;i<360;i+=5){
rotate(radians(10));
fill(255);
beginShape();
arc(300,300, 50, 50,0,PI);
arc(275, 300, 50, 50,-PI/2,0);
arc(300, 300, 50, 50,-PI/2,0);
endShape(CLOSE);}

for (int i=0;i<360;i+=5){
rotate(radians(10));
fill(255);
beginShape();
arc(100,300, 50, 50,0,PI);
arc(75, 300, 50, 50,-PI/2,0);
arc(100, 300, 50, 50,-PI/2,0);
endShape(CLOSE);}

for (int i=0;i<360;i+=5){
rotate(radians(10));
fill(255);
beginShape();
arc(400,300, 50, 50,0,PI);
arc(375, 300, 50, 50,-PI/2,0);
arc(400, 300, 50, 50,-PI/2,0);
endShape(CLOSE);}

for (int i=0;i<360;i+=5){
rotate(radians(10));
fill(255);
beginShape();
arc(500,300, 50, 50,0,PI);
arc(475, 300, 50, 50,-PI/2,0);
arc(500, 300, 50, 50,-PI/2,0);
endShape(CLOSE);}


}



