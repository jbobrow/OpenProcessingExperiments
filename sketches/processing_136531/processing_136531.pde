
//Transforming the grid
//Global variables
//Setup
void setup(){
    size(640,640);
    colorMode(HSB,width,height,100);
    background(random(width),random(height),random(100));
}

//draw

void draw(){
  
    stroke(mouseX,mouseY,50);
    fill(mouseY,mouseX,75);
    rect(100,100,100,100);
    //pushMatrix,popMatrix
    pushMatrix();
    stroke(50,mouseX,mouseY);
    translate(200,200);
    scale(2.0);
    rotate(radians(15));
    rect(100,100,100,100);
    popMatrix();
    fill(mouseX,mouseY,75);
    if(keyPressed==true){
        rect(100,100,50,50);
      };
    println("mouseX is:"+mouseX);
    //Input
    //mouseX
    //mouseY
    //mousePressed
    //keyPressed
}

void mouseMoved(){
    background(random(width),random(height),random(100));
}

void mouseDragged(){
    background(random(width),random(height),random(100));
}

void mouseReleased(){
    background(random(width),random(height),random(100));
}

void keyPressed(){
    //if(key=='s' || key=='S'){
         // background(random(width),random(height),random(100));
      //}
}

void keyReleased(){
    if(key=='s' || key=='S'){
          background(random(width),random(height),random(100));
      }
}

