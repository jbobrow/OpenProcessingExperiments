
float diameter;
float multiplier;
int counter;
boolean drawMode=false;

void setup(){ 
  //size(400, 400);
 size(screen.width, screen.height); 
  noStroke(); 
  smooth(); 
  frameRate(60); 
  colorMode(HSB,100, 100,100,100);
  background (25); 
} 

void draw(){ 



  if(((abs(mouseX-pmouseX)>0) || (abs(mouseY-pmouseY)>0)) && drawMode==true){ 
    counter=frameCount%10;
    multiplier=dist(mouseX,mouseY,width/2,height/2)/(height/15);
    diameter=dist(mouseX,mouseY,pmouseX,pmouseY)*multiplier+25; 
    if(counter==9){
      fill (0,0,25,3);
      rect(0,0,width,height);
    }

    if (drawMode){ 
      fill(0,0,0,random(10,30)); 
      ellipse(mouseX+5, mouseY+5, diameter*1.1, diameter*1.1);
      fill(random(0,100), random(50,75), random(90,100), 100); 
      ellipse(mouseX, mouseY, diameter,diameter);  
    } 

  }else{
        counter=frameCount%48;
            if(counter==47){
      fill (0,0,25,3);
      rect(0,0,width,height);
    }
  }
  println(counter);
}
void mousePressed() {
  drawMode= !drawMode; 
}

void keyPressed(){
  if (key == 's' || key == 'S') {

    saveFrame("drawing#####.tif");
  }
}





