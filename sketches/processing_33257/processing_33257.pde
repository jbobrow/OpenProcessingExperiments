
// Modern Sound, disgusting tribute to Ancient Sounds of Paul Klee

int line_distance=10;
  int line_space=10;


void setup () {
  size(300,300);
//  noLoop();
  frameRate (10);
  background(0);
}

void draw () {
 // fill(random(256),random(256),random(256));
  
 /* for (int i=0;i<120; i++) {
    fill(random(256),random(256),random(256));
      ellipse(random(width),random(height),25,25);
      ellipse(i+i*10,height-5*i,20,20);
     
  }
 */ 
  for(int line_distance=10;line_distance<height;line_distance=line_distance+10) {
      line(0,line_distance,width,line_distance);
      line(line_distance*2,0,width,height);
      line(0,0,line_distance*2,height);
      line(5,0,width-5,height);
  }
  
  for(int p=0;p<15;p=p+1) {
  for(int i=0;i<15;i=i+1) {
    fill(random(256),random(256),random(256));
    ellipse (150-75+p*10,150-75+(i*10),10,10);
  }}
   
  //   for (int i=0;i<15; i++) {
    //  ellipse(random(width),random(height),30,30);
   // }
      
      
      
//  if (line_distance<height) {
    
//    line_distance=line_distance+line_space;
  }
                                
