
int[] herp = {14000, 5641};
int[] colour = {#311d34,#a62945};
int a = herp[0]+herp[1];
void setup() {
  size(240,200);
  background(255);
  smooth(); 
}
void draw(){
  background(255);
    noFill();
    stroke(#333333);
    textAlign(RIGHT);
    text("PC visits ("+round(map(herp[0],0,a,1,100))+"%)",width/2,height/2-40);
    text("Mobile visits ("+round(map(herp[1],0,a,1,100))+"%)",width/2,height/2+40);
    noStroke();
    fill(colour[0]);
    ellipse(width-60,height/2-40,map(herp[0],0,a,1,100),map(herp[0],0,a,1,100)); 
    fill(colour[1]);
    ellipse(width-60,height/2+40,map(herp[1],0,a,1,100),map(herp[1],0,a,1,100)); 
    fill(#444444);
}
