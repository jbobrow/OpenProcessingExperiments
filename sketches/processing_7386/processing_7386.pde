
class Building{
  float x, y;
  boolean on = false; 
  boolean b;
  color c;
  float stature;
  
  void start(float xpos,float ypos,boolean bar){
    if(bar==true){
      c = color(0,174,239);
    }
    else{
      c=color(236,0,140);
    }
    x = xpos;
    y = ypos;
    b=bar;
    on = true;
    stature = 1;

  }

  void grow(){
    if (on == true & stature < 40){
      stature += 5;
    }
  }

  void display(){
    if(on==true){
      fill(c);
      strokeWeight(1);
      stroke(c);
      rectMode(CENTER);
      rect(x, y, stature, stature);
    }
  }
}






















