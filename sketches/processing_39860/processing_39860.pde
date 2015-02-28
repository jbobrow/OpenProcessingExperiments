
void setup () {  
size(600,500);  
smooth(); 
background(0); }

//define line
void draw (){
float centerA = width/2;
float centerB = height/3;

line(mouseX,mouseY,centerA,centerB); 
stroke(255);}



