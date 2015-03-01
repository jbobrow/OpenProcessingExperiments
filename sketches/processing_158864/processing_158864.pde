

void setup() {
  size(1000,700);
  background(0); 
}

void draw(){
background(0); 
//make flashlight highlight 
noStroke(); 
for(int i=200; i>5; i-=10){
  fill(255, 255-i); 
  ellipse(mouseX, mouseY, i,i); 
}

//draw all circles 
for(int i=10;i< 1000; i+=12){
   for(int j=10; j<700; j+=12){
     if(dist(mouseX,mouseY, i,j)< 100){
       fill(0); 
     }
     else {
      fill(random(50,200),random(50,100),200 ); 
     }
     ellipse( i,j, 10,10); 
   }
}

}



