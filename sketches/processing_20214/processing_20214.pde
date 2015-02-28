
void setup(){
size(250,250);
background(255);
  
}
  
void draw() {
  
strokeWeight(1);
stroke(0);

// big "gradient" circle  
fill(0);
ellipse(110,100,110,100);
fill(20);
ellipse(110,100,100,90);
fill(50);
ellipse(110,100,90,80);
fill(80);
ellipse(110,100,80,70);
fill(110);
ellipse(110,100,70,60);
fill(140);
ellipse(110,100,60,50);
fill(170);
ellipse(110,100,50,40);
fill(200);
ellipse(110,100,40,30);
fill(230);
ellipse(110,100,30,20);
fill(255);
ellipse(110,100,20,10);

// smaller circles cluster
fill(0);
ellipse(20,100,3,3);
ellipse(45,110,3,3);
ellipse(30,130,3,3);
ellipse(30,120,3,3);
ellipse(50,120,3,3);

// capture frame
if(keyPressed){
if(key==' '){
saveFrame("rhythattractemerge.png");
}
}
  
}

