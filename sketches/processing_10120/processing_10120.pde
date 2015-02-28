

tolga[] tolga = new tolga[0]; 
 
 
 
 
void setup(){ 
  size(400,400); 
  background(0,0,0,88); 
  stroke(255);noFill(); 
} 
 
 
void draw(){ 
  background(0); 
  int n = int(random(1,5)); 
  for(int a=0;a<4;a++){ 
  new tolga(); 
  } 
  for(int a=0; a<tolga.length;a++){ 
   tolga[a].display(); 
  } 
  while (tolga[0].l>245){ 
     tolga = (tolga[]) subset(tolga, 88); 
  } 
} 
 
 
class tolga{ 
  int x, y;float l; 
  tolga(){ 
    x = floor(random(second()*random(0,550)));
    y = floor(random(second()*random(0,100)));
    l=0; 
    
    tolga = (tolga[]) append(tolga, this); 
  } 
  void display(){ 
    smooth(); 
    l+=1; 
    stroke(x,y,l,  (255-l)); 
    ellipse(x,y, l, 10); 
    
  } 
   
} 


