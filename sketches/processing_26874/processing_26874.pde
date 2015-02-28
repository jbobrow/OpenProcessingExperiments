
void setup() {
  size(600,600);
}

void draw(){
  background(255);

 for(int i=0; i<600; i = i+20){
   for(int j=0; j<600; j=j+20){

     fill(255,i,0,i);
     rect(i,j,20,20);

     noStroke();
     textSize(36);
     fill(0,0,75,50);
     text("M",i,j);

     noStroke();
     fill(0,213,51,22);
     ellipse(i,j+30,60,50);

     noStroke();
     fill(150,100,250,60);
     ellipse(i+35,j-5,95,35);

     noStroke();
     fill(200,100,100,i);
     rect(i,j,j,i);

   }
  }
}
                
                
