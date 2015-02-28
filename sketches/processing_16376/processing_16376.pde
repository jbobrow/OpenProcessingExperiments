
color bg=color(0);
float r=0.0;
int card=0;
int btnx=20,btny=20,btnw=100,btnh=50;

void setup(){
size(600,600);
smooth();
background(bg);
}

void draw(){
background(bg);
rotate(radians(r+=0.5));
resetMatrix();



drawlighter(3);

}

void drawlighter(int s){
    translate(width/2,height/2);
  
    stroke(128);
    fill(128);
    strokeWeight(10);
    strokeJoin(ROUND);
    rectMode(CENTER);
    ellipseMode(CENTER);
    rect(0,0,110,100);
    
    if(s==0){
    rect(0,-90,110,50);
    } else {
    stroke(80);
    fill(80);  
    
    
    
    strokeWeight(7);
    stroke(128);
    ellipse(-33,-85,20,20);
    noStroke();
    triangle(-36,-85,-12,-105,-12,-65);
    
    stroke(80);
    rect(-33,-67,2,2);
    
    strokeWeight(10);
   
    fill(80); 
    rect(0,-60,105,1);
    rect(0,-80,40,40);
    
    noStroke();
    fill(bg);
    ellipse(-15,-75,7,7);
    ellipse(0,-75,7,7);
    ellipse(15,-75,7,7);
    
    ellipse(-8,-85,7,7);
    ellipse(8,-85,7,7);
    
    ellipse(-15,-95,7,7);
    ellipse(0,-95,7,7);
    ellipse(15,-95,7,7);
    
    if(s==2){
          if(second()%2==0) {
          generateParticleburst(-33,-70);
          }
    }
    if(s==3){
      generateFlame(0, -110, color(255,255,0), 80, 50);
      generateFlame(0, -110, color(255,20,0), 40, 30);
    }
    
    strokeWeight(10);
    translate(35,-140);
    rotate(radians(120));
    stroke(128);
    fill(128);
    rect(0,-90,110,50);
    resetMatrix();
    }
    
    resetMatrix();
}


void generateParticleburst(int x,int y){
    fill(255);
    stroke(255);
    strokeWeight(1);
    line(x,y,random(x,x+30),random(y,y+30)); 
    line(x,y,random(x-30,x),random(y-30,y)); 
    line(x,y,random(x,x+30),random(y-30,y)); 
    line(x,y,random(x-30,x),random(y,y+30)); 
}

void generateFlame(int x, int y, color c, int h, int w){
    noStroke();
    fill(c);
    beginShape();
    vertex(x, y);
    bezierVertex(random(x,x+w), random(y-h/2,y), random(x,x+w/2), random(y-h,y-h/2), x, random(y-h,y-10));
    bezierVertex(random(x-w/2,x), random(y-h/2,y), random(x-w,x), random(y-h,y-h/2), x, y);
    endShape();
}





