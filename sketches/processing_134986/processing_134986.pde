
     float h=100;
     float s=100;
     float b=100; 
     int y;
     
 void setup(){
     background(0);
     size(600, 600);
     strokeWeight(80);
    }
 
 void draw(){
     colorMode(HSB,100);
     stroke(226, 204, 0);
     line(0, y, width, y);
  
 if(mousePressed){
    stroke(h,s,b);  
    line(mouseX,mouseY,pmouseX,pmouseY);
    h+=.09;
    if(h>=100){h=0;}
    }
 }
