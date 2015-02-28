
int counter = 0;
float p=0; 
float q=0;

void setup() {
  size(800,600);
  background(map(mouseX,0,800,255,random(0,255)));
}

void draw() {
  frameRate(map(mouseX,0,800,1,200));
  if (mouseX> 300) {
    strokeWeight(random(0,10)); 
  }  
  smooth();
  for(float x=50; x<750; x+=30) {
    p= p-map(mouseX,0,800,18,40);
    for(int y=50; y<550; y+=30) {
      q= q-18;
      fill(map(mouseX,0,800,255,random(0,255)),map(mouseX,0,800,255,random(0,255)),map(mouseX,0,800,255,random(0,255))); 
      arc(x,y,map(mouseX,0,800,30,random(0,200)),map(mouseY,0,600,30,random(0,200)),radians(0+counter+p+q),radians(180+counter+p+q));

  }
    q=0;
  }
  p=0;
  


  counter= counter + (int)map(mouseX,0,800,6,20);
  

  
}
