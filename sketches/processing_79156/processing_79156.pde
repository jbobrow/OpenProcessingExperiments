
int counter = 0;
void setup () {
  size(600, 600);
  smooth();
  background (0);
  
}

void draw(){

  
  strokeWeight(100);
  for (int i = 0; i<width/2 ; i++) {
    stroke(random (200, 255), 140, random(170,230));
    if(i>50)stroke(random(190, 255),i*2,120);
    if(i>135)stroke(random(160, 240),i*2,random(80));
    if(i>180)stroke(random(120, 190),i*2,random(60, 140));
    if(i>220)stroke(random(70, 130),i*2.8,random(120, 200));
    strokeWeight (1+sin(i/3.0)*0.5);
    line(2*i,mouseX,2*i,mouseY);
  
    
  }
  
    for (int j = 0; j<width/0.5 ; j++) {
    stroke(random (200, 255), 140, random(170,230));
    if(j>50)stroke(random(200, 255),j*2,100);
    if(j>135)stroke(random(170, 200),j*2,random(50));
    if(j>180)stroke(random(120, 170),j*2,random(70, 130));
    if(j>220)stroke(random(80, 120),j*2.8,random(130, 190));
    strokeWeight (1+sin(j/3.0)*0.4);
    line(mouseX,2*j,mouseY,2*j);
  
    }
 
       if (mouseButton == RIGHT){ //New canvas
       background(0); 
       }
}

  void keyPressed(){
if(key == 'j'){  
saveFrame(counter+".jpg");
counter++;
println(counter);
}
  }


