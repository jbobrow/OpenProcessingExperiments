
float blue = 0; 
void setup(){
size(250,250);
background(#FFD1D1);
}
void draw(){
  strokeWeight(1);
  line(250,250,240,0);
line(250,250,230,0);
line(250,250,200,0);
line(250,250,180,0);
line(250,250,170,0);
line(250,250,140,0);
line(250,250,100,0);
line(250,250,80,0);
line(250,250,70,0);

line(250,250,0,40);
line(250,250,0,35);
line(250,250,0,60);
line(250,250,0,90);
line(250,250,0,130);
line(250,250,0,150);
line(250,250,0,170);
line(250,250,0,200);
line(250,250,0,240);
line(250,250,0,250);
line(250,250,0,230);

  stroke(#93FFF9);
  fill(blue); 
ellipse(10, 10, 50, 50);
fill(blue); 
ellipse(50, 50, 70, 70);
fill(blue); 
ellipse(110, 110, 110, 110);
fill(blue); 
ellipse(170,170,80,80);
fill(blue); 
ellipse(220,220,90,90);


} 
void mouseDragged(){
blue += 5;	
}

