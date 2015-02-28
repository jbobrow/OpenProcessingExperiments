
Tline[] tlines;

void setup(){
  size(1300,1300);
  tlines = new Tline[5];
  for(int i= 0; i <tlines.length; i ++){
    tlines[i] = new Tline(random(300), random(300));
  }
 

}

void draw(){
  for(int i = 0; i<tlines.length; i++){
    tlines[i].display();
    tlines[i].move();
  }
}




class Tline {
  float x, y, a, b,radius, angle;
  
  //constructor
  Tline(float xpos, float ypos){
    x = random(1000);
    y= random(1000);
    a = width/2;
    b = height/2;
    angle = width/2;
    radius = height/2;
  }
  
  void display(){
    stroke(random(1,200));
    line(mouseX,mouseY, random(-600,600),random(-600,600));
    textSize(60);
    fill(random(0,255));
    text( "clone" ,mouseX,mouseY);
  }
  void move(){
    a += mouseX;
  b += mouseY;
  x = cos(radians(angle)) * radius ;
  y = sin(radians(angle)) * radius ;
  stroke(random(100,250));
  line(x,y,mouseX,mouseY);
  stroke(random(100,255));
  line(x,y,mouseX,mouseY);
  radius +=20;
  angle += 20;
 // fill(255,255,255,random(1,100));
 // rect(0,0,width,height);
  
  if(radius >= 5){
      stroke(random(100,255));
      line(mouseX+= 50,mouseY+= 50,a+=50,b+=50);
      a ++;
      b++;
  }
    if(radius >= 5){
      stroke(random(100,200));
      line(random(1000,1000),random(1000,1000),mouseX+= 50,mouseY+=50);
      a ++;
      b++;
  }



  }
}

  void mousePressed() {
     background(255);
     fill(random(255));
     textSize(width/4);
     
     text("CLONES",10,450);
    
  }


