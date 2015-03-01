
float x,y,z;
float s,i;
float r,g,b=0;
void setup() {
 size(600,600);
 s=0.5;
 i=0.4;

} 
 
void draw() {
  x+=s;
    y+=i;
    translate(-100,-100);
  stroke(b,100);
  //stroke(r,g,b);
   if( mouseX>width/2){
    r++;
  }else{
    r-=1;
  }
  if( mouseY>height/2){
    g++;
  }else{
    g-=1;
  }
  if(mousePressed){
    b++;
  }else{
    b-=1;
  }
  r=constrain(r,0,255);
  g=constrain(g,0,255);
  b=constrain(b,0,255);
  fill  (b,r,g,150);
  beginShape();
  vertex(100+x,100+y*0.3);
  vertex(150+x,100+y);
  vertex(200+x*0.1,100+y);
  vertex(200+x,200+y);
  vertex(150+x,200+y*1.2);
  vertex(100+x,200+y);
  endShape(); 
  strokeWeight(2);
    

    if(x>=width-20 || x <=0 ){
  s*=-1;

    }
    if(y>=height-20 || y <=0 ){
 i*=-1;
    }
   if (keyPressed == true && key=='s') {
    saveFrame("yourName.png");
  } 
}
