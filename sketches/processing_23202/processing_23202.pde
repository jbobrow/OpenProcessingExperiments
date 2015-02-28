
void setup(){

size(250,250);
smooth();

frameRate(30);
}

void draw(){
  
  background(0,60,100);
  
ellipseMode(CENTER);
rectMode(CENTER);

//bob body
stroke(255);
fill(255);
rect(mouseX,mouseY,20,50);


//bob head
stroke(255);
fill(255);
ellipse(mouseX,mouseY-60,100,100);


//bobs ears
fill(234,159,159);
ellipse(mouseX-20,mouseY-125,20,50);
ellipse(mouseX+20,mouseY-125,20,50);

//bob eyes
fill(0,0,200);
stroke(0);
ellipse(mouseX-20,mouseY-30,16,16);
ellipse(mouseX+20,mouseY-30,16,16);


//bob legs
stroke(255);
line(mouseX-10,mouseY,pmouseX-10,pmouseY+60);
line(mouseX+10,mouseY,pmouseX+10,pmouseY+60);

//bobs nose
stroke(234,159,159);
fill(234,159,159);
rect(mouseX-0,mouseY-25,6,3);


//bob arms
stroke(255);
strokeWeight(3);
line(mouseX-10,mouseY,pmouseX-20,pmouseY+30);
line(mouseX+10,mouseY,pmouseX+20,pmouseY+30);


}


void mousePressed(){
 background(126,189,255);
stroke(255);

 

}

void keyPressed(){
  
  println("hop hop hop.");}
  
 

