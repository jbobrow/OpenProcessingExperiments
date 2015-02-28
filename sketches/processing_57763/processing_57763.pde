
float angle = 0.1;
float angle2= 0.2;
float w=5;
float p=6;
PImage img;
   
void setup(){
  
size (600,600);

img= loadImage("photo1.jpg");
background (img);

}

void draw(){
 
  if (keyPressed)
  {if (key=='r'){
    image (img,0,0,600,600);
  tint(random(255),10);
  
    for (int i = 0; i < 600; i +=23) {
  rect(i, angle, 80,i);
  fill(0,angle,angle,30);
   stroke(0,0+angle,0+angle,5);
   strokeWeight(3);
   i++;
  translate(width/2-i, height/2-100);
  rotate(angle);
   angle -= 0.00009;
  
}

strokeWeight(0.1);
strokeCap(SQUARE);
stroke(random(150,255),100);

for (int i = 3; i < 600; i +=22) {
  
  
  rect(i, i+40, 800, i+300);
  stroke(random(150,255),200);
  fill(random(150,255),150);
  strokeWeight(random(1,6));
  w=w+1;
p=p+1;
 translate(w*p, p);
  rotate(angle);
   angle += 0.000009;
   
  
}}}}

