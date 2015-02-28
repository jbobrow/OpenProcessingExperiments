
int i;

void setup(){
  size(600,600);
  background(0);
  smooth();
  //frameRate (20);
}

void draw(){
  for (int i = 0; i<width; i+= 10){
    fill(i++,178,mouseX,54/i+i++);
    strokeWeight(50);
  
}
if (-i > 30 & i < 200){
}else{
  for(int i=1; i<height; i += 6){
     fill(i++,78,mouseX,50);
    noStroke();
 bezier(i++,mouseX,i,mouseY,i++,mouseX,i,mouseY);
 bezier(i,i,i,i++, i,i,i,i++);
  bezier(-i,-i,-i,-i++, -i,-i,-i,-i++);

 bezier(i++, mouseX, mouseY, i++, i++, mouseX, mouseY, i++);
  }

i++;
line (i , 20, i , 80);
if (i >width){
i =0;
}
}
}

