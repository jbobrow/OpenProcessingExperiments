
String[] headlines={
  "THIS IS NOT A DRILL.",
  "SECURITY COMPROMISED.",
  "REPORT TO ACTION STATIONS.",
};
PFont f;
float x;
int A= 1;
int B=10;
int index = 0;

void setup(){
    size(600, 400);
    background(50);
    f = createFont("Courier New", 16, true); 
       
}


void draw(){
  textFont(f,16);
  textAlign(CENTER);
  fill (50, 50);
  rect (0,0,width,height);
  
  fill(255,30,30);
  //text marching down
    fill(255,30,30);
 for (int B=0 ; B < height ; B+=18){
     text("DANGER DANGER DANGER DANGER DANGER DANGER DANGER DANGER DANGER DANGER DANGER DANGER",300,B++);
    B = B % height;
 }
 
 //display headline at X location
 fill(255,70,70);
 textFont (f,70);
 textAlign(LEFT);
 text (headlines[index],x,180);
 //decremet x
 x=x-3;
 //if  less
 if(x < -600) {
   x = width;
   index = (index+1) % headlines.length;
 }
  //scanlines
  for (int A=0 ; A < height ; A+=2){
   line (0, A,width,A); 
  }
}

