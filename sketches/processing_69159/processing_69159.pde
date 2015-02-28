
int x=0;
int y=0;
void setup(){

size(1000,354);


//noFill();

   frameRate(40);

}

void draw(){

  

  smooth();

  strokeWeight(8);
  background(255);
  stroke(random(0,255),random(0,255),random(0,255),random(0,255));

beginShape(); 

//MONTAÑA
fill(7, 18, 33);
vertex(0,200);
vertex(80,100);
vertex(225, 180);
vertex(700, 150);
vertex(900, 70);
vertex(1000, 140);
vertex(1000, 200);
vertex(0,200);

endShape(); 


beginShape();
fill(180, 146,9);
//pasto
vertex(0,354);
vertex(0,250);
vertex(250,250);
vertex(250,254);
vertex(700, 220);
vertex(900, 230);
vertex(1000,210);
vertex(1000,354);
endShape();
}

