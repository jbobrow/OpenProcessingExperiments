
HashSet squiggles = new HashSet();

Squiggle currentSquiggle;

void setup(){
  size(500,500);

//  smooth();
}
float r = 1.1;
float rs = -.0001;
void draw(){
    background(0); 
  Iterator i = squiggles.iterator();
  while(i.hasNext()){
    Squiggle s = (Squiggle)i.next();
    if(s != null){
    s.update();
    s.draw(); 
    }
  }
  if(currentSquiggle != null){
    currentSquiggle.add();
    currentSquiggle.update();
    currentSquiggle.draw();
      
}
  
  r += rs;
  if(r < .98) { r = .98; rs = abs(rs);}
  if(r > 1.02) { r = 1.02; rs = -abs(rs);}
  
}

void keyPressed(){
   if(key == ' '){
       squiggles = new HashSet();

//Squiggle currentSquiggle;

   } 
}


void mousePressed(){
   currentSquiggle = new Squiggle(); 
}
void mouseReleased(){
  if(currentSquiggle == null){return;}
  squiggles.add(currentSquiggle); 
   currentSquiggle = null;
}

class Squiggle{

  ArrayList dots = new ArrayList(); 
  Dot startDot;
  color c ;
//float r = random(.98,1.02);
 
  Squiggle(){
    startDot = new Dot(mouseX,mouseY);
    c = color(random(50,255),random(50,255),random(50,255));
  }
  void add(){
     dots.add(new Dot(mouseX,mouseY)); 
  }

  void update(){
    updateDot(startDot);
    Iterator i = dots.iterator();
    while(i.hasNext()){
      updateDot((Dot)i.next());
     
    }
  }

   void  updateDot(Dot d){
       float CENTERX = mouseX; float CENTERY = mouseY;// = 250;
      float dx = d.x - CENTERX; 
      float dy = d.y - CENTERY; 
      dx *= r;// 1.01;
      dy *= r; //1.01;
      d.x = CENTERX + dx;
      d.y = CENTERY + dy;
   }


  void draw(){
    strokeWeight(3);

    stroke(c);

    Dot lastDot = startDot;
    Iterator i = dots.iterator();
    while(i.hasNext()){
      Dot d = (Dot)i.next();
      line(lastDot.x,lastDot.y,d.x,d.y);
      lastDot = d; 
    }




  }

  void addSeg(){
    dots.add(new Dot(mouseX,mouseY));
  }

}

class Dot{
  Dot(float a,float b){
    x = a;
    y = b; 
  }
  float x, y; 
}



