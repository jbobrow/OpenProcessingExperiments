
void setup(){
size(600,600);
smooth();
background(255);
}

void draw(){
//eyes
 ellipseMode(CORNER);
 strokeWeight(.5);
 noFill();
 stroke(0);
 ellipse(250,200,25,25);  
 ellipse(300,200,25,25);
 ellipseMode(CENTER); 
 fill(0);
 ellipse(261,211,10,10);
 ellipse(311,211,10,10);

//beak 
 strokeWeight(.2);
 stroke(255,215,0);
 fill(255,215,0);
 ellipse(286,225,11,30);
 strokeWeight(5);

//head
line(230,180,290,190);
 line(290,190,350,180);
 line(230,180,235,210);
 line(350,180,345,210);
noFill();
 arc(290,205,110,120,0,PI);
 


//wings and body
 ellipseMode(CORNER);
 fill(238,201,0,1);
 ellipse(230,260,120,150);
 fill(238,201,0,3);
 ellipse(210,270,50,120);
 ellipse(320,270,50,120);
  
//claws
 strokeWeight(.2);
 stroke(100,2,3);
 fill(100,2,3,5);
 triangle(280,410,270,420,290,420);
 triangle(300,410,290,420,310,420);

  
}

