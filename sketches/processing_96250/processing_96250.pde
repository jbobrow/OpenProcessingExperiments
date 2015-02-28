
void setup(){
size(450,450);
background(190,0,50);
noCursor();
}
void draw(){

fill(0,8);
rect(0,0,450,450);
stroke(380,200,10); 
fill(100,12,30);
rect(mouseX,mouseY+10,10,35); 

stroke(380,200,10); 
fill(360,12,30);
rect(mouseX,mouseY+10,20,35); 
strokeWeight(3); 
stroke(380,200,10);
fill(120,30,10);
rect(mouseX,mouseY+10,20,25); 
stroke(380,200,10);
fill(200,10,10);
rect(mouseX,mouseY+10,10,25);

stroke(380,200,10);
fill(290,10,15);
rect(mouseX,mouseY+10,10,15);

stroke(380,200,10);
fill(390,100,50);
rect(mouseX,mouseY+10,10,7.5); 


}


