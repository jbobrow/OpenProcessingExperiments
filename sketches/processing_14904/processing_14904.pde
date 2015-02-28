
color monkey = color(50,180,30);
color monkey2 = color(170,20,190);
int nbcouleurs = 0;


void setup(){
  size(200,200);
  background(170,20,190);
}

void draw() {

  fill(monkey);
  noStroke();
  ellipse(100,100,50,50);
  fill(255);
  noStroke();
  ellipse(90,95,23,23);
  ellipse(110,95,23,23);
  ellipse(100,110,28,28);
  fill(255);
  stroke(monkey);
  ellipse(90,95,12,12);
  ellipse(110,95,12,12);
  ellipse(100,110,20,20);
  fill(monkey);
  line(90,110,110,110);
  ellipse(91,92,4,4);
  ellipse(111,92,4,4);
  noStroke();
  ellipse(125,100,9,9);
  ellipse(75,100,9,9);
  fill(255);
  noStroke();
  rect(20,140,30,10);
  rect(20,140,10,30);
  rect(20,160,30,10);
  rect(60,140,10,30);
  rect(60,160,20,10);
  rect(90,140,10,30);
  rect(110,140,30,10);
  rect(110,140,10,30);
  rect(110,160,30,10);
  rect(150,140,10,30);
  rect(150,150,20,10);
  rect(170,140,10,10);
  rect(170,160,10,10);
  
}

void mouseClicked() {
  nbcouleurs = nbcouleurs + 1;
  if(nbcouleurs == 1) {
  background(50,180,30);
  monkey = color(170,20,190);
  }else{
    nbcouleurs = 0;
  background(170,20,190);
  monkey = color(50,180,30);
  
  }
  

}

                
                
