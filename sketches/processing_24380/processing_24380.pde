

int x;
int y;

void setup(){
  size(500,500);
}

void draw() {
  background(255);
  smooth();
  x=mouseX;
  y=mouseY-40;

//city

if ((mouseX>200)) {
  
  rect(350, 100, 100, 300); //larger building
  rect(300, 200, 100, 200); //smaller building
      
  if (mousePressed) { 
    fill(255, 0, 0);
  } else {
    fill(255);
   }
  
  for (int i=358; i<445; i+=15) {
    for (int j=110; j<200; j+=15) {
      fill(255, 255, 0);
      rect(i, j, 10, 10); //repetition of large building window
    }
  }
  
  for (int i=403; i<445; i+=15) {
    for (int j=200; j<395; j+=15) {
      fill(255, 255, 0);
      rect(i, j, 10, 10);
    }
  }

  for (int k=308; k<395; k+=32) {
    for (int l=208; l<400; l+=32) {
      fill(255, 255, 0);
      rect(k, l, 20, 20);
    }
  }

  line(400, 60, 400, 100);
}


//start of dragon

fill(255,0,0);  
triangle(x-10,y,x-10,y+20,x-60,y+20);//tail
triangle(x,y-40,x+5,y-25,x-5,y-25);//spikeone
triangle(x-20,y-35,x-5,y-25,x-15,y-15);//spiketwo
triangle(x-35,y-20,x-15,y-15,x-20,y-5);//spikethree
triangle(x-20,y-5,x-45,y,x-20,y+5);//spikefour
ellipse(x+5,y+5,10,10);//nose

fill(0);
ellipse(x-5, y+25, 20, 10);
ellipse(x+10, y+25, 20, 10); //feet

fill(255);
ellipse(x,y,50,50);//head

arc(x,y, 10, 5, PI/2, 0.63);

fill(255,0,0);
ellipse(x+5,y+5,10,10);//nose

fill(255);
ellipse(x,y-5,10,20);//lefteye
ellipse(x+10,y-5,10,20);//righteye

point(x,y-5);
point(x+10,y-5);
triangle(x,y+20,x+10,y+20,x+5,y+13);
//end of dragon


//FLAMES x=65 y=50
if (mousePressed) {
  fill(255,0,0);
beginShape();
vertex(x+3,y+17);
vertex(x+40,y-21);
vertex(x+25,y+12);
vertex(x+98,y+12);
vertex(x+28,y+27);
vertex(x+36,y+50);
vertex(x+3,y+17);
endShape();
}



}





