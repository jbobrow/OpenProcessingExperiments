
int mode = 1;
color fillColor = color(255);
float x,y,angle;



void setup(){
  size(1000,600);
  smooth();
  background(80);
  x = 0;
  y = 0;
  angle = 0;
  ellipseMode(CENTER);
}
  
void draw(){
  if(mode == 1){
    for(int x = 0;x < width; x+=10){
        for(int y = 0;y < height; y+=10){
          if(mouseX > x && mouseX < x+10 && mouseY > y && mouseY < y+10){
           fill(mouseX,300,mouseY);
          } else{
           noFill();
          }
         stroke(80);
         if(mouseX > 50 && mouseY> 40){
          ellipse(x,y,10,10);
         }
          if(x%100 == 0 && y%100 ==0){
          ellipse(x,y,300,300);
        }
        }
      }
      fill(80);
      rect(0,0,40,200);
  }else if(mode == 2){ 
    fill(255);
    ellipse(20,20,20,20);
  
   fill(124,255,254);
    ellipse(20,60,20,20);
     
    fill(3,255,143);
    ellipse(20,100,20,20);
    
    fill(250,255,18);
    ellipse(20,140,20,20);
    
    fill(fillColor);

    for(int x = 0;x < width; x+=10){
        for(int y = 0;y < height; y+=10){
          if(mousePressed){
            ellipse(mouseX,mouseY,20,20);
          }else {
            noFill();
          }
          stroke(80);
          ellipse(x,y,20,20);
           
         if(x%40 == 0 && y%40 ==0){
                noFill();
              ellipse(x,y,400,200);
          }
      }
       
   }
 }else if(mode == 3){
   fill(255);
   ellipse(20,20,20,20);
    
   fill(124,255,254);
    ellipse(20,60,20,20);
     
    fill(3,255,143);
    ellipse(20,100,20,20);
    
    fill(250,255,18);
    ellipse(20,140,20,20);
    
    fill(fillColor);
 
    noStroke();
    ellipseMode(CENTER);
      
    if(mouseX > 40 && mousePressed){
        x = cos(radians(angle)) * 20 + width;
        y = sin(radians(angle)) * 20 + height/2;
        ellipse(mouseX+angle,mouseY+angle,20,20);
        angle++;
     }else{
        noFill(); 
      }    
  }else if(mode == 4){
    background(80);
  }
 
}

void keyPressed(){
  if(key == 'a'){
     mode = 1;
  }else if(key == 's'){
    mode = 2;
  }else if(key == 'd'){
     mode = 3;
  }else if(key == 'f'){
    mode = 4;
  }
  
  
}
  
  
  void mouseReleased(){
  if(dist(mouseX,mouseY,20,20) < 100){
     fillColor = color(255);
  }
  if(dist(mouseX,mouseY,20,60) < 10){
    fillColor = color(124,255,254);
  }
  if(dist(mouseX,mouseY,20,100) < 10){
    fillColor = color(3,255,143);
  }
  if(dist(mouseX,mouseY,20,140) < 10){
    fillColor = color(250,255,18);
  }
}



