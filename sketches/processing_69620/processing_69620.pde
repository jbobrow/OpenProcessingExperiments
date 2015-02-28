
void setup() {
size(600, 600);
smooth();
}
 
void draw() {
background(map(mouseY,0,800,255,0), map(mouseY,0,800,255,0), map(mouseY,0,800,255,0));
strokeWeight(2);
for(int x = 50+50; x < 600; x += 100){
   for(int y = -60; y < 300; y += 100){
     
   fill(map(mouseY,0,800,255,10),0,10);
   ellipse(x,150, 70,40);
   //fill(251,255, map(mouseY,0,800,190,20));
   
   fill(random(255));
   ellipse(map(mouseY,0,600,x,100),0,20,20);
   
   fill(map(mouseY,0,800,255,10),0,10);
   
   fill(map(mouseY,0,800,255,10),0,10);
   ellipse(x,50,70,40);
   
   fill(random(255));
   ellipse(map(mouseY,0,600,100,x),100,20,20);
   
   fill(random(255));
   ellipse(map(mouseY,0,600,x,100),200,20,20);
   
   fill(map(mouseY,0,800,255,10),0,10);
   ellipse(x,250,70,40);
   
   fill(random(255));
   ellipse(map(mouseY,0,600,100,x),300,20,20);
   
   fill(map(mouseY,0,800,255,10),0,10);
   ellipse(x,350,70,40);
   
   fill(random(255));
   ellipse(map(mouseY,0,600,x,100),400,20,20);
   
   fill(map(mouseY,0,800,255,10),0,10);
   ellipse(x,450,70,40);
   
   fill(random(255));
   ellipse(map(mouseY,0,600,100,x),500,20,20);
   
   fill(map(mouseY,0,800,255,10),0,10);
   ellipse(x,550,70,40);
   
   fill(random(255));
   ellipse(map(mouseY,0,600,x,100),600,10,10);
   }
  }
     //fill(255);
     
     //ellipse(map(mouseY,0,390, 590,-50),200, 7,7);
     
     //ellipse(map(mouseY,0,400,600, -50), 100,70,40);
     
     //ellipse(map(mouseY,0,400,0,650),150,70,40);
     
     //ellipse(map(mouseY,0,400,0,650),250,70,40);
     
     //ellipse(map(mouseY,0,400,600,-50),300,70,40);
     
     //ellipse(map(mouseY,0,400,0,650),350,70,40);
}

