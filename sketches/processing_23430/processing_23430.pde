


void setup() {
  size(screen.width,screen.height);
   
  background(255);
 
   

  frameRate(30);
  smooth();

}


void draw() {
  stroke(255);
  strokeWeight(random(.5,15));

  
 if (mousePressed==true){
   stroke(0);
  
 }
strokeWeight(random(.5,15));


  line(pmouseX, pmouseY, mouseX, mouseY);
 
}


void keyPressed(){

if(key=='3'){ 
  noStroke();
  fill(255);
  if (mousePressed){
    fill(0);
  }
 triangle(mouseX, mouseY, mouseX+random(-50,75), mouseY+random(-40,50),mouseX+random(-100,50), mouseY+random(-50,50));
    }

  
 if(key=='s'){
      saveImage();
 }
      if(key=='c'){
       fill(255);
  rect(0, 0, width, height);
}
if(key=='b'){
       filter(BLUR);
}
if(key=='t'){
       filter(THRESHOLD);
}
if(key=='i'){
         filter(INVERT);
}
if(key=='e'){
       filter(ERODE);
}
if(key=='d'){
       filter(DILATE);
}
if(key=='p'){
       filter(POSTERIZE,12);
}
if(key=='o'){
       filter(OPAQUE);
}
if(key=='r'){
  background(random(255),random(255),random(255),random(255));}

}

