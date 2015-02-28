
void setup(){
 size(800,800);
 background(0);
 smooth(); 
 }

void draw(){

PImage b;

b = loadImage("orange.jpg");
image(b,0,-20);
    
    if(mousePressed == true){

    stroke(0);
    strokeWeight(3);
    fill(255);
    ellipse(300,300,170,75);    
    
    float r1 = dist(mouseX,mouseY,pmouseX,pmouseY);
    float reye1 = constrain(r1,0,75);
    
    float leftEyePos1 = map(mouseX,0,width,275,325);
    fill(0);    
    noStroke();
    ellipse(leftEyePos1,300,reye1,reye1);
    
    fill(255);    
    stroke(0);
    strokeWeight(3);
    ellipse(520,300,170,75);
   
    float r2 = dist(mouseX,mouseY,pmouseX,pmouseY);
    float reye2 = constrain(r2,0,75);
    
    float rightEyePos1 = map(mouseX,0,width,475,525);
    fill(0);    
    noStroke();
    ellipse(rightEyePos1,300,reye2,reye2);

}
    
    else{
    stroke(0);
    strokeWeight(3);
    fill(255);
    ellipse(300,300,170,75);
    fill(255);
    ellipse(300,300,75,75);   
    
    float leftEyePos = map(mouseX,0,width,275,325);
    fill(0);    
    noStroke();
    ellipse(leftEyePos,300,25,25);    
    
    stroke(0);
    strokeWeight(3);
    fill(255);
    ellipse(520,300,170,75);
    fill(255);
    ellipse(500,300,75,75);    
    
    float rightEyePos = map(mouseX,0,width,475,525);
    fill(0);    
    noStroke();
    ellipse(rightEyePos,300,25,25);
    

}

}


