
int mode = 1;
int numLoops;
float x,y,zig,zag;
 
void setup (){
  size(600,800);
  numLoops = 10;
  smooth();
}
 
void draw(){
  translate(width/2,height/2); 
for(int i = 0 ; i < mouseX ; i++){
 rotate(radians(10));
  if(mode ==1){
  x = x + zig*5;
  y = y + zag*5;
  fill(255);
  ellipse(mouseX,mouseY,40,40);
   
   } else if(mode == 2){
    //numLoops += 1;
    for(int t = 0 ; t < mouseX; t ++){
      rotate (radians(15));
    fill(198,6,6);
    rect(x,mouseX,mouseY,50);
    }
     
   } else if(mode == 3){
      zig = mouseX - x;
  zag = mouseY - y;
   x = x + zig*2;
  y = y + zag*2;
  line(x,y,mouseX,mouseY);
  // ellSize (random);
  smooth();
   }
   }
}
 
void keyPressed(){
  if(key == '1'){
  mode = 1;
  background(255);
  
  } else if(key == '2'){
    mode = 2;
    //background(255,6,88);
    smooth();
    numLoops++;
  } else if(key == '3'){
      mode = 3;
      //background(3,67,8);
  }
}
 
void mousePressed(){
  if(mode == 2){
 // ellsize (random);
   numLoops += 10;
  } else if(mode == 3){
    numLoops +=100;
    // background(33,92,38);
   }
  }


