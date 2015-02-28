
void setup(){
  size(600, 600);
  smooth();
  background(255);
  rectMode(CENTER);
  frameRate(30);

}
void draw(){
    for(int x=0; x<width; x+=10){
    for(int y=0; y<height; y+=10){
      
      if (x%20==0 && y%20==0){
              println();
              strokeWeight(2);
              rect(x,y,10,10);
              
              //stroke(random(255),random(100),random(100), 50);
              //strokeWeight(.5);
              //line(x,y,mouseX, mouseY);
        }
        if(dist(mouseX,mouseY,x,y)<15){
          rect(x,y,10,10);
        }
      else{
              noStroke();
              fill(100,100,100);
              ellipse (x, y, 6, 6);
              
     
     
      }

      
     // line (x,y,mouseX,mouseY);
      /*if(x<width){
        stroke(random(255),random(100),random(100), 50);
      }*/
     
}}
}




