
int count = 0;

void setup(){
 size(500, 500);
 rectMode(CENTER);
 smooth(); 
}

void draw(){
  background(255);
  translate(width/2, height/2);
  if(mousePressed==true){
   translate(mouseX, mouseY);
  }
  fill(0);
  noStroke();
 //rect(width/2,mouseY, 50,50);
 for(int i = 0; i < height; i++){
   if(mousePressed==true){
    //i = i*i; 
   }
   rotate(i/500+count);
   fill(random(map(mouseY,0,height,230,255)),random(map(mouseY,0,height,0,50)),random(map(mouseY,0,height,100,150)));
   rect(map(mouseX,0,width,0,i), map(mouseY,0, height, 0, i), 
        map(mouseY,0, height, 0, i), map(mouseY,0, height, 0, i));
 }
  count++;
}

