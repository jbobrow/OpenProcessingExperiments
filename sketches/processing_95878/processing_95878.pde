
void setup(){
size(600,500);
background(0);
rectMode(CORNERS);
smooth();
noStroke();

}

void draw(){
    //eye,left,right
fill(255);
ellipse((mouseX/20)+200,(mouseY/40)+250,250,250);
ellipse((mouseX/20)+450,(mouseY/40)+250,150,150);
 //pupil,left,right 
  fill(0,0,90);
ellipse(200,250,125,125);
ellipse(450,250,75,75);

//dark circlr
fill(255);
stroke(5);

}

void mousePressed(){
noFill();
stroke(255);
//tears
ellipse(520,340,50,50);
//mouth
rect(300,300,450,450);
}



