
int rectX[] = {0, 750};
int rectY[] = {0, 750};
int velX[] = {5, -5};
int velY[] = {5, -5};
int mode = 0;
int rects[] = {500, 200};
int rectsv[] = {0, 0};
int curRect = 0;
void setup(){
 size(800, 800); 
  
}
void draw(){
if(mode == 0){
  background(0, 255, 255);
  for(int i = 0; i < rectX.length; i++){
   rect(rectX[i], rectY[i], 50, 50); 
    
  }
     rect(rectX[curRect], rectY[curRect], 50, 50);
     rectX[curRect] += velX[curRect];
     rectY[curRect] += velY[curRect];       
fill(0, 0, 0);
ellipse(200, 200, sizes[0], sizes[0]);
fill(255, 255);
ellipse(600, 600, sizes[1], sizes[1]);
sizes[0]++;
sizes[1]--;
if(sizes[0] == 200){
 sizes[0] = 0; 
}
if(sizes[1] == 0){
 sizes[1] = 200; 
}
}
if(mode == 1){
 background(255, 255, 255); 
 fill(255, redness, redness);
 ellipse(rects[0], rects[1], 50, 50);
 rectsv[0] = (mouseX - rects[0])/10;  
 rectsv[1] = (mouseY - rects[1])/10;
 rects[0] += rectsv[0];
 rects[1] += rectsv[1]; 
}
redness--;
if(redness == 55){
 redness = 255; 
  
}
}


/*

  variables---
  meaningful short and descriptive

*/
void keyTyped(){
  int i = parseInt(key) - 49;
if(i > -1 && i < rectX.length){
curRect = i;
}
}
void mouseClicked(){
  mode = 1;
  
}
