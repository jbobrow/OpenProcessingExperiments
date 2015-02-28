
void setup () {
size (400,500);
}

void draw (){
  background(255);
//outline of ghost  
bezier (80,400,180,100,200,5,350,400);
bezier (80,400,110,410,205,430,350,400);
fill(255);
//eyes outter
ellipse (180,200,30,30);
ellipse (230,200,30,30);
fill(255);
//mouth
ellipse (205,270,20,50);
fill(255);

if(mousePressed){
 fill(0);
}

//eyes inner
float xpos= constrain(mouseX,170,190); 
float ypos= constrain(mouseY,190,210);


ellipse(xpos,ypos,10,10);

float xposition= constrain(mouseX,220,240); 
float yposition= constrain(mouseY,190,210);

ellipse(xposition,yposition,10,10);



}
