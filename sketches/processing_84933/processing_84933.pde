

void setup() {
size(400, 400);
background(255);


} 

void draw() {
background(255);  
strokeWeight(5);
line(10, 0, 10, 400);
line(80, 0, 80, 400);
line(180, 0, 180, 400);
line(190, 0, 190, 400);
line(170, 0, 170, 400);
line(100, 0, 100, 400);
line(380, 0, 380, 400);
line(310, 0, 310, 400);
line(170, 360, 310, 360);
line(0, 170, 400, 170);
line(0, 70, 400, 70);
line(0, 290, 400, 290);
line(170, 320, 310, 320);
line(0, 185, 400, 185);
line(0, 207, 400, 207);

if(mousePressed){
fill(255, 255, 0); }
else{
fill(255, 0, 0);}
rect(190, 320, 120, 40);

if(mousePressed){
fill(255, 0, 0); }
else{
fill(0, 0, 255);}
rect(10, 0, 70, 70);

if(mousePressed){
fill(0, 0, 255); }
else{
fill(255, 255, 0);}
rect(310, 0, 70, 10);

textSize(24);
fill(255, 0, 0);
text("Click anywhere!", 105, 120);
}

//Mondrian Art!



