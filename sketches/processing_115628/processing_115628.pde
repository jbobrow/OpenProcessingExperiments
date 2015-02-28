

int d=10;
PVector init;
PVector next = new PVector(0,0);
float midX;
 float midY;
 int count=0;
 color c1;

void setup()
{
  background(255);
  noSmooth();
  size (800,800);
  translate(width/2,height/2);

  
  midX=width/2;
 // midY=height;
   midY=0;
  
  init=new PVector(midX,midY);
  stroke(255);
  smooth();



}

void draw()
{
  
  
 // strokeWeight(1);
  //point(init.x,init.y);
 
  float limbSize= random(100);
 
  
 
 // if(init.x>width || init.y>height)
 //delay(10);
  next.x=init.x+random(-limbSize,limbSize);
  next.y=init.y+random(-limbSize,limbSize);
 
 float radius=random(10);
  
  
  line(init.x,init.y,next.x,next.y);
  ellipse(next.x,next.y,radius,radius);
  fill(0);
  
  
  init.x= next.x;
  init.y= next.y;
  
  // quando a posição sair do ecra, reiniciar no centro
  
  if(init.x>width||init.x<0||init.y>height||init.y<0){
    init.x=midX;
    init.y=midY;
    c1 = color(random(255), random(255), random(255), random(150));
    stroke(c1);
    strokeWeight(random(2,50));
  }
  
  count ++;
  
  if(count % 10==0){
  
   // save("jpg/frame"+count+".jpg");
  }

}

void mousePressed() {
  println("mouse pressed!");
  //salvar frame sempre que necessário
  save("jpg/frame"+count+".jpg");
}


