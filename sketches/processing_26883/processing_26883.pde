
void setup() {
  size(450,450);
}

void draw(){
  background(255);

 for(int i=0; i<600; i = i+10){
   for(int j=0; j<600; j=j+10){
     
     noStroke();
     fill(mouseX,random(255),100,50);
     ellipse(i+10,j-10,95,35);
     
     noStroke();
     fill(200,100,100,i);
     rect(i,j,j,i);
     
     fill(255,random(255),0,i);
     rect(i,j,20,20);
     
     noStroke();
     textSize(35);
     fill(0);
     text("A",i+20,j);
     
   }
  }
}

