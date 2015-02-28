
//December 16th 2009
//Ellipses

// '+' to increase size
// '-' to increase size

float p=5;  //ellipse diameter

void setup(){
  size(300,300,JAVA2D);
  smooth(); 
  strokeWeight(2);
  ellipseMode(CENTER);
  mouseX=width/2;
    mouseY=height/2;
}


void keyPressed(){
 if (key=='+'){
  p++;
 }

if (key=='-'){
  p--;
 }  
 
 if (p<3){
  p=3; 
 }
  
 
}

void draw(){
  background(1);
  translate(p/2-1,-p/2);

  for(float y=0;y<height;y+=p){
    translate(0,y);

    for (float z=0;z<width;z+=p){
      fill(233,23,23,123);
      stroke(1); 
      translate(z,p);
      if ( (z>mouseX-(width/p) && z<mouseX+(width/p) ) || (y>mouseY-(height/p) && y<mouseY+(height/p)) ){
        fill(255); 
      }
      
      
      ellipse(0,0,p,p);
      translate(-z,-p);    

    }
    translate(0,-y);
  }



}







