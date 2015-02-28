
int [] pi=new int[50];
String pival="14159265358979323846264338327950288419716939937510";

void setup(){
  size(800,300);
  background(255);
  smooth();
  for(int i=0;i<50;i++){
      pi[i]=parseInt(pival.substring(i,i+1));
  }
}

void draw(){
  background(255);
  noStroke();
  for(int i=0;i<50;i++){
    fill(0,120,0,150);
    rect(i*(width/50),height,width/50,-10*pi[i]);
    fill(0);
    textAlign(CENTER,BOTTOM);
    textSize(15);
    text(pi[i],(i*(width/50)+width/100),height-10*pi[i]);
    fill(120,0,0,100);
    ellipse(i*width/50,height-210,8*pi[i],8*pi[i]);
  }
  noFill();
  stroke(0,0,100);
  strokeWeight(2);
  beginShape();
  for(int j=0;j<50;j++){
    vertex(j*width/50,-10*pi[j]+height-75);
  }
  endShape(); 
  fill(0);
  textAlign(CENTER);
  textSize(30);
  text("PI-The irrational",width/2,40);
  fill(0);
  textAlign(CENTER);
  textSize(10);
  text("3.14.....Till 50 decimal places",width/2,height-2);
}
