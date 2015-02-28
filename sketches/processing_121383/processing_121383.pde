
int t,w = 255;
int arr[] =new int[300*300];

void setup(){
 size(600,600);
}


void draw(){
 smooth();
 background(0);
 stroke(w);
 textSize(30);
 text("Space=Delete", 50, 30);
 
 if((mousePressed== true) && (mouseButton == LEFT)){
  arr[t]=mouseY;
  arr[t+1]=mouseX-w;
 }
  fill(random(w),random(w),random(w),100);
  stroke(random(w),random(w),random(w),100); 
  strokeWeight(10);
  beginShape(POINTS);
  for(int i=0 ; i<t ; i+=2)
  vertex(w+cos((t-i)/99f)*arr[i+1],arr[i]);
  if(arr[t]>0)t+=2;
  endShape();

 }

void keyPressed(){
   if (key == ' '){
  t=0;
  w = 255;
  arr =new int[300*300];
  }
}









