


void setup () {
  
size (500,600);
background (0);


}


void draw () {
  
frameRate (30);


if (mousePressed) {

fill(255,0,0,100);
ellipse (mouseX,mouseY,10,10);
//}  

line (mouseX,mouseY,pmouseX,pmouseY);

//if (mousePressed) {

fill(200,0,255,100);
ellipse (mouseX,mouseY,random(50),random(100)); 
}


if (mousePressed) {
noStroke();
fill(random(255),0,random(255),25);
ellipse (random(0,500),random(0,500),random(60,200),random(60,200));
}



}

