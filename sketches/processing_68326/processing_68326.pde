
void setup() {
  size(600,600);
  smooth();
}

void draw() {
  background(0); 
  
  for(int i = 0; i <=30; i = i + 1) {
  
      if(i < 10) {
      fill(255,0,0);
      }
      else if(i >=10 && i <=20) {
        fill(255,255,0);
      }
      else {
        fill(255,0,0);
      }
      ellipse(i * 20,600,20,20);
      ellipse(i * 20,580,20,20);
      ellipse(i * 20,560,20,20);
      ellipse(i * 20,540,20,20);
      ellipse(i * 20,520,20,20);
      ellipse(i * 20,500,20,20);
      ellipse(i * 20,480,20,20);
      ellipse(i * 20,460,20,20);
      ellipse(i * 20,440,20,20);
      ellipse(i * 20,420,20,20);
      ellipse(i * 20,400,20,20);
      ellipse(i * 20,380,20,20);
      ellipse(i * 20,360,20,20);
      ellipse(i * 20,340,20,20);
      ellipse(i * 20,320,20,20);
      ellipse(i * 20,300,20,20);
      ellipse(i * 20,280,20,20);
      ellipse(i * 20,260,20,20);
      ellipse(i * 20,240,20,20);
      ellipse(i * 20,220,20,20);
      ellipse(i * 20,200,20,20);
      ellipse(i * 20,180,20,20);
      ellipse(i * 20,160,20,20);
      ellipse(i * 20,140,20,20);
      ellipse(i * 20,120,20,20);
      ellipse(i * 20,100,20,20);
      ellipse(i * 20,80,20,20);
      ellipse(i * 20,60,20,20);
      ellipse(i * 20,40,20,20);
      ellipse(i * 20,20,20,20);
      ellipse(i * 20,0,20,20);
  }
}

