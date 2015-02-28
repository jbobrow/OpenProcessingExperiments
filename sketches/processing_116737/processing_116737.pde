
void setup(){
  size(400,400);
}
void draw(){  
  
  
  
background(38,213,210);
//Hus
stroke(0,0,0);
fill(210,22,9);
rect(80,60,150,120);
//Tag
stroke(0,0,0);
fill(0,0,0);
triangle(80,60,230,60,160,3);
//Græs
stroke(0,0,0);
fill(36,234,14);
rect(0,180,400,400);

//sky
noStroke();
fill(255,255,255,100);
ellipse(320,50,100,50);
ellipse(370,80,100,50);

//door
stroke(0,0,0);
fill(0,0,0);
rect(120,120,40,60);

//vindue
stroke(0,0,0);
fill(255,255,255);
rect(180,80,20,20);

//sol
stroke(0,0,0);
fill(250,221,1);
ellipse(35,25,50,50);

}
