

                
                void setup(){
 size(450,450); 

background(0);

  smooth();
}


void draw(){
fill(0,20);
noStroke();
float speed = dist(pmouseX,pmouseY, mouseX,mouseY);

fill(random(0,255), random(0,255), random(0,255),100);

ellipse (mouseX,mouseY, speed+10, speed+10);

  //println(speed);
}
