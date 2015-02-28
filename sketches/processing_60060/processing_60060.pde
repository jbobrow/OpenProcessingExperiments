
void setup() {size(400,400);
background(0);
noStroke();
noCursor();
}

void draw() {
  
  background(0);
 
//Auge1
fill(255);
ellipse(40,50,50,50);
fill(0);
ellipse(40,50,25,25);
noFill();
//Auge2
fill(255);
ellipse(360,50,50,50);
fill(0);
ellipse(360,50,25,25);
noFill();
//Kopp
fill(5,160,10);
ellipse(200,150,400,300);
//Mund
stroke(0);
strokeWeight(3);
fill(255);
ellipse(200,180,400,220);
fill(5,160,10);
ellipse(200,230,400,220);
//Nase
noStroke();
fill(0);
ellipse(170,40,25,20);
fill(5,160,10);
ellipse(170,50,25,20);
fill(0);
ellipse(230,40,25,20);
fill(5,160,10);
ellipse(230,50,25,20);
rect(150,300,100,100);
 

  if(mousePressed) {
    
    //aufreißen//Auge1
fill(255);
ellipse(40,50,70,70);
fill(150);
ellipse(40,50,40,40);
fill(0);
ellipse(40,50,30,30);
noFill();
//Auge2
fill(255);
ellipse(360,50,70,70);
fill(150);
ellipse(360,50,40,40);
fill(0);
ellipse(360,50,30,30);
noFill();
  }
  //Kopp
fill(5,160,10);
ellipse(200,150,400,300);
//Mund
stroke(0);
strokeWeight(3);
fill(255);
ellipse(200,180,400,220);
fill(5,160,10);
ellipse(200,230,400,220);
//Nase
noStroke();
fill(0);
ellipse(170,40,25,20);
fill(5,160,10);
ellipse(170,50,25,20);
fill(0);
ellipse(230,40,25,20);
fill(5,160,10);
ellipse(230,50,25,20);
rect(150,300,100,100);

fill(255,0,0,100);
ellipse(mouseX,mouseY,20,20);
fill(255,0,0);
ellipse(mouseX,mouseY,5,5);

stroke(255,0,0,100);
strokeWeight(2);
line(30,400,mouseX,mouseY);
noStroke();

}

