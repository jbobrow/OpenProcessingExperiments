
E e[] = new E[50];

void setup() {
  size(600, 600);
  for (int i=0;i<e.length;i++) {
    e[i]=new E();
  }
  noStroke();
}

void draw() {
  background(230);
  for (int i=0;i<e.length;i++) {
    e[i].render();
  }
}

class E {
  float x=0, y=0, d=0, a=0,m=0,mInc=0.01;
  color c;
  public E() {
    float randomA=random(360);
    x= width/2+((cos(radians(randomA)) )*150);
    y= height/2+((sin(radians(randomA)) )*150);

    this.d=random(10, 50);
    c = color(random(255),random(255),random(255),100);
    this.a = random(360);
    m=random(-1,1);
  }  
  void render() {
    for(int i =0;i<e.length;i++){
      
      if(dist(this.x,this.y,e[i].x,e[i].y) <d){
        stroke(0);
        strokeWeight(0.1);
         line(this.x,this.y,e[i].x,e[i].y);
      }
    }
    if(dist(mouseX,mouseY,x,y) < 3*d){
      stroke(255,30,60,map(dist(mouseX,mouseY,x,y),0,3*d,255,30));
      strokeWeight(2);
      line(this.x,this.y,mouseX,mouseY);
    }
    if(dist(mouseX,mouseY,x,y) < 3*d && mousePressed){
        x+=  map(mouseX-x,0,3*d,0,0.4);
        y+=  map(mouseY-y,0,3*d,0,0.4);
    }else{
        x += cos(radians(a+=m))*m;
        y += sin(radians(a+=m))*m;
    }
    noStroke();
    fill(c);

    ellipse(x, y, d, d);
    m+=mInc;
        
    if(m>2 || m<-2){mInc*=(-1);}

  }
}
