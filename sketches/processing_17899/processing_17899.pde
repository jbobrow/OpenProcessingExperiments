
float posX, posY;
float counter=200;

void setup(){
size(250,250);
background(0);

}
 
void draw(){
for(int i=0; i<counter; i++){
posX = random(100);
posY = random(200);
 

//GREEN ELLIPSES
stroke(color(random(0),random(102), random(200)));
strokeWeight(random(2));
fill(color(random(100),random(250), random(30)));
ellipse(225,18,30,30);
ellipse(225,88,30,30);
ellipse(225,158,30,30);
ellipse(225,228,30,30);

//OTHER ELLIPSES
stroke(color(random(255),random(255), random(255)));
strokeWeight(random(5));
fill(color(random(204),random(255), random(0)));
ellipse(225,53,30,30);
ellipse(225,123,30,30);
ellipse(225,193,30,30);

//BOTTOM LINES
//line(10,250,1000,100);



//LINES
stroke(color(random(180),random(190),random(100)));

strokeWeight(0.5);
line(random(posX-100),posY,posX+100,posY);

strokeWeight(0.5);
line(posX-5,posY-5,posX+5,posY+5);

stroke(random(204),random(255),0,100);
strokeWeight(2);
line(posX,posY-10,posX,posY+10);

strokeWeight(1.5);
line(random(posX+10),random(posY-10),random(posX-30),posY+30);
}
counter++;
}


