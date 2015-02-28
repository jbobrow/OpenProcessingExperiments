
Fly [] flys =new Fly[50];

void setup(){
    size(400,400);
    for (int i=0;i<flys.length;i++){
      flys[i]=new Fly();
    }
  }
    
void draw(){
  background(0);
  fill(255);
//noStroke();
//fill(255,10);
//rect(0,0,width,height);

for (int i=0;i<flys.length;i++){
  flys[i].update();
  flys[i].checkEdges();
  flys[i].display();
  flys[i].buzz();
}
}
  
  
//  fly.buzz();
//  fly.display();
//}
  



