
void setup(){
size(500,500);
background(255);   
stroke(5);

}
void draw(){    
line(mouseX,mouseY, pmouseX,pmouseY);
if (mousePressed == true){
background(255);
}
}

//the background is updated 60 times per second so when ellipse drawn
//around the baackground it is deleted almost right away


