
PFont myFont;
int count=0;

void setup() {
  size(500,500);
  background(255);
  myFont = createFont("Helvetica-48.vlw", 24);
  textFont(myFont,42);
}

void draw(){
  if(mousePressed){
    
    for(int i=300;i<800;i=i+1)
    {
      if(count%2==0)
      {
        text(".",random(abs(i-250)+1),random(abs(i-250)+i));
        fill(0,0,0,255);
        rotate((PI/3.0)+i);
      }else
      {
        text(".",random(abs(i-250)+1),random(abs(i-250)+i));
        fill(200,10,20);
        rotate((PI/3.0)+i);
      }
    }
    count++;
  }
}

