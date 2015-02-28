
int value;
float r; 
float g;
float b;
float count;

void setup () {
  size(400, 400);
  smooth();
  fill(0);

  r = random(0, 255);
  g= random(0, 255);
  b = random(0, 255);
  count = random(1,255);
  
 
}

void draw() {
 

  background (0);
  float x = map(mouseX, 0, width, 50, 350);
  float y = map (mouseY, 0, height, 50, 350);
  ellipse (x, y, 50, 50); 
 
 
    for(int i=0; i<1000; i++){


  
          if (mousePressed==true) {
            
            r=r+count;
            g= g+count;
            b= b+count;
             fill(r, g, b);
            rect(random(0,300),random(0,300),100,100);
            count+=i;
    
          }
  
    
  else {
    fill(255);
    count+=i;

  }
}




}
