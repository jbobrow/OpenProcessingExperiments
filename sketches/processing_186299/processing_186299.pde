
Swirler[] ss = new Swirler[200];

void setup(){
  //size of sketch, initial bgcolor
  size(800,800);
  background(0);
 
for(int i = 0; i < ss.length; i++){
 ss[i] = new Swirler(i*2); 
}
  

   
}

void draw(){
//  background(0);
noStroke();
fill(0,128);
rect(0,0,width,height);
 
  for(int i = 0; i < ss.length; i++){
  ss[i].update(); 
  ss[i].display();
 }

  
}




class Swirler{
  
float xpos, ypos, mag, rot, mxe, mm;

int r,g,b;

 Swirler(float m){
   
   r = int(random(255));
   g = int(random(255));
   b = int(random(255)); 
   
  xpos = width/2;
  ypos = height/2;
  mxe = xpos;
  mm = xpos;
  
  mag = m;
 }

void update(){
  

    
    
  if(mousePressed){
    mm = mouseX;
  }else{
 //   mm = xpos;
  }
  
  
  mxe += (mm - mxe) * .005;
  
  rot+=.1;
  
  
  if(mag > 400){
    mag = 1;
       r = int(random(255));
   g = int(random(255));
   b = int(random(255)); 
   xpos = mxe;
   

  }else{
    mag+=.5;
  }

}

void display(){


particle(xpos,ypos,mag,rot,r,g,b);
}
  
  
  
}
void particle(float x,float y,float m,float r,int rr,int gg, int bb){

pushMatrix();
translate(x,map(m,0,400,height,0));
scale(1,.25);
rotate(r+map(m,0,400,1,50));
stroke(rr/2,gg,255,map(m,0,400,255,0));
strokeWeight(map(m,0,400,1,300));
point(0,m*map(m,0,400,.25,1));  
popMatrix();
  
}

