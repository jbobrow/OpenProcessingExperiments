
float y = 50.0; 
float speed = 1.0; 
float radius = 15.0; 
void setup(){
size(250,250);
smooth();
noStroke();
ellipseMode(RADIUS);
}
void draw(){
fill(0, 12); 
rect(0,0,width,height);
fill(#B73BA9);
ellipse(33, y, radius, radius);
fill(255);
smooth();
triangle(10,200,55,200,32,260);
fill(#B73BA9);
smooth();
triangle(10,210,55,210,32,260);
fill(255);
smooth();
triangle(10,220,55,220,32,260);
fill(#B73BA9);
smooth();
triangle(10,230,55,230,32,260);
fill(255);
smooth();
triangle(10,240,55,240,32,260);


fill(#FF7171);
ellipse(90,y,radius,radius);
fill(255);
smooth();
triangle(67,200,112,200,90,260);
fill(#FF7171);
smooth();
triangle(67,210,112,210,90,260);
fill(255);
smooth();
triangle(67,220,112,220,90,260);
fill(#FF7171);
smooth();
triangle(67,230,112,230,90,260);
fill(255);
smooth();
triangle(67,240,112,240,90,260);


fill(#6A72FF);
ellipse(150,y,radius,radius);
fill(255);
smooth();
triangle(127,200,172,200,150,260);
fill(#6A72FF);
smooth();
triangle(127,210,172,210,150,260);
fill(255);
smooth();
triangle(127,220,172,220,150,260);
fill(#6A72FF);
smooth();
triangle(127,230,172,230,150,260);
fill(255);
smooth();
triangle(127,240,172,240,150,260);



fill(#25F2B6);
ellipse(210,y,radius,radius);
fill(255);
smooth();
triangle(188,200,233,200,210,260);
fill(#25F2B6);
smooth();
triangle(188,210,233,210,210,260);
fill(255);
smooth();
triangle(188,220,233,220,210,260);
fill(#25F2B6);
smooth();
triangle(188,230,233,230,210,260);
fill(255);
smooth();
triangle(188,240,233,240,210,260);

y += speed;
if(y>260){
  y=-50.0;
  

}
}








