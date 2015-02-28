
float x=0;
float y;

void setup () {
    size (600,700);
    frameRate(10);
    background (0);
    smooth();
 
}
 
 
void keyPressed(){ 
  if (key=='1'){
    noStroke();
    y = random(height); 
    x = random(width);
    fill(56,114,168,50);
    float r = random(50,100);
    ellipse(x,y,r,r); 
    println(x);
  }
  if (key==' '){  
    noStroke();
    y = random(height); 
    x = random(width);
    fill(200,0,255,500);
    float r = random(40,80);
    ellipse(x,y,r,r); 
    println(x);
  }
  
   if(key=='s'){
    saveFrame("bild###.png");
  }
}
 
void draw () {
  
    y = mouseY; 
    x = mouseX;
    noStroke();
    fill(20,25,61,50);
    ellipse (mouseX,mouseY,30,70);
 
  if (mousePressed) {
    fill(0,0,0,150);
    ellipse (mouseX,mouseY,random(120),random(90));


  }
}


