
import processing.opengl.*;

void setup(){
size(900,900,OPENGL);
}

void draw(){
background(25);

lights();
noStroke();

translate(width/2,height/2);

rotateX(mouseX / float(width) * TWO_PI - PI); // rotation around x-achse
rotateY(mouseY / float(height) * TWO_PI - PI); // rotation around y-achse

pushMatrix();

rotate(millis() * 0.0001 * TWO_PI); 

  //draw triangle one
beginShape(); // (3D= X,Y,Z) malen 
  vertex(-130,0,0);
  vertex(0,200,100);
     vertex(130,0,0);
  endShape(CLOSE); 
  
  stroke(0,0,255);
  line(0,0,0,0,200,100);
  
    //draw triangle two - Flügel 1
beginShape(); // (3D= X,Y,Z) malen 
  vertex(0,200,100);
   vertex(-100,-150,0);
     vertex(-130,0,0);
  endShape(CLOSE); 
  
      //draw triangle three - Flügel 2 
beginShape(); // (3D= X,Y,Z) malen 
  vertex(0,200,100);
   vertex(100,-150,0);
     vertex(130,0,0);
  endShape(CLOSE); 
  
   
     //draw triangle foure - body 
beginShape(); // (3D= X,Y,Z) malen 
  vertex(0,0,0);
  vertex(0,200,100);
  vertex(0,50,0);
  endShape(CLOSE); 
  
  
  

popMatrix();

}

