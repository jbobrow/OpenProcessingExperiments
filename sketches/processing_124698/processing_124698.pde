
Point [] circles;

void setup(){
  size (600,480);
  smooth();
  textSize(20);
  
  String[] nameProy= {"Biblioteca","Processing","Urbanismo","Representación","Proyectos"};

  circles= new Point[0];

  for(int i=0;i< nameProy.length; i++){
    String name=nameProy[i];
    Point element= new Point(random(0+50,width-50),random(0+50,height-50),name);
    circles=(Point[]) append(circles,element);
  }
}
  


void draw(){
  fill(180,100);
  noStroke();
  rect(0,0,width,height);
  
  for(int i=0;i<circles.length;i++){
    circles[i].render();
    circles[i].title();
  }
}

class Point{
  float x, y;
  String name;
  
  
  Point (float _x,float _y, String _name){
    x= _x;
    y= _y;
    name= _name;
  }
  
  
  void render(){
    noStroke();
    fill(255,200,180);
    ellipse(x,y,50,50);
  }
  
  void title(){
    float a= dist(x,y,mouseX,mouseY);
    if(a<50){
      if(x>width-50 || y<40){
        fill(200,100,100);
        text(name,mouseX-50,mouseY+40);
      } else{
      fill(200,100,100);
      text(name,mouseX,mouseY);
      }
    }
  }
}  


