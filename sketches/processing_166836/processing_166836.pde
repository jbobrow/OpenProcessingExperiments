
////////////////////////////////////////////
//  random walker
////////////////////////////////////////////

Walker w;
int s;
/////
void setup(){
  size(1100,660);
  colorMode(HSB);    
  w = new Walker();  
  background(0);
  s = 20;
}
/////
void draw(){
  w.step();         
  background(0);
  w.display();       
}
/////
void mousePressed() {
  w.big();
}


class Walker{
  float x;      
  float y;      
  float tx, ty; 
  float color;
  int count = 0;
  
  Walker(){
    tx = 0;
    ty = 10000;
  }
  void display(){ 
    
    smooth();
    if( s < 200){
        fill(color*100%256,255,255);  
    }else{
        fill(color*color*50%256,255,255); 
    }strokeWeight(0);
    ellipse(x, y, s, s);     
    fill(255,255,255);
    strokeWeight(0.05*s);
    if( random(100) > 1 && count == 0){
        ellipse(x+s*0.2, y-s*0.15, s*s*0.0005, s*s*0.0005);
        ellipse(x-s*0.2, y-s*0.15, s*s*0.0005, s*s*0.0005);
        count = 0;
    }else{
        count++;
        if(count > 10){
          count = 0;
        }
    }
    
    arc(x, y+s*0.15, s*0.001*s, s*0.0005*s,0,PI);
    arc(x, y+s*0.15, s*0.001*s, s*0.0001*s,0,PI);
  }
  void step(){    
    x = map(noise(tx), 0, 1, 0, width);  
    y = map(noise(ty), 0, 1, 0, height); 
    tx += 0.00015*s;
    ty += 0.00015*s;
    color += 0.005;
    if(s>=200)
    {
      s += 3;
      if(s >=1500)
      {
         s = 20;
         color = 0;
      }
    }
  }
  void big(){    
    if(s<200 && mouseX>x-(s/2) && mouseX<x+(s/2)
    && mouseY>y-(s/2) && mouseY<y+(s/2)){
      tx = random(0,5000);
      ty = random(0,5000);    
      s*=1.25;
    }
  }
}
/////
