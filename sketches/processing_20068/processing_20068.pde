
void setup(){
  size(600, 600);
  background(0);
  smooth();
  noStroke();
  
}

float diameter;
float speedX;
float speedY;

int scaleNum = 0;

void draw(){
  
  fill(0, 0, 0, 50);
  rect(0, 0, width, height);

  speedX = pmouseX - mouseX;
  speedY = pmouseY - mouseY;
  
  if(scaleNum > 0){
    scaleNum--;
  }
  
  for(int i=0; i < width; i += 20){
    for(int j=0; j < height; j += 20){
      
      diameter = 20 - dist(mouseX,mouseY, i,j) / 10;
      
      //stroke(i, 255-i, i/2);
      //strokeWeight(abs(diameter)/10);
      //noStroke();
      //println(abs(diameter)/20);
      
      fill(mouseX % 255, mouseY % 255, i);
      
      if(diameter < 1){
        rect(i - diameter/2, j - diameter/2, (diameter + speedX)*scaleNum/100, (diameter + speedY)*scaleNum/100);
      
      }else{
        //quad(i - diameter/2, j - diameter/2, i +diameter/4, j - diameter/4, i + diameter/2, j + diameter/2, i - diameter/4, j + diameter/4 );
        ellipse(i - diameter/2, j - diameter/2, (diameter*2 + speedX)*scaleNum/100, (diameter*2 + speedY)*scaleNum/100);
      
      }
      
      
    }
  }
}

void mouseMoved(){
  
 scaleNum += 5;
 if(scaleNum >= 100){
  scaleNum = 100; 
 }
 
}

