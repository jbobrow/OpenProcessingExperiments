
void setup(){
  size(900,900);
   
   
}

void draw(){
  background(0,0,255);
  if(mousePressed==true){
  for(int x =50;x<1000;x+=200){
    
    for(int y=100;y<1000;y+=250){
     loliPop(x,y);
  }
  } 
  }
  fill(237,230,31);
   ellipse(450,450,900,900);
   fill(255);
   ellipse(250,250,200,200);
   ellipse(650,250,200,200);
   fill(0);
   ellipse((((mouseX-360)/20)*1)+250, ((((-mouseX)/20)+((mouseY-100)/20)*2)+250), 50, 50);
   
   ellipse((((mouseX-360)/20)*1)+650, ((((-mouseX)/20)+((mouseY-100)/20)*2)+250), 50, 50);
   fill(0);
   ellipse(450,650,200,200);
   noFill();
  
   if(mousePressed==true){
     fill(0);
     ellipse(450,650,300,300);
     fill(255);
   ellipse(250,250,300,300);
   ellipse(650,250,300,300);
   fill(0);
   ellipse((((mouseX-360)/20)*1)+250, ((((-mouseX)/20)+((mouseY-100)/20)*2)+250), 100, 100);
   
   ellipse((((mouseX-360)/20)*1)+650, ((((-mouseX)/20)+((mouseY-100)/20)*2)+250), 100, 100);
   }
 loliPop(mouseX, mouseY);
}

void loliPop(int x, int y){
  fill(255);
  rect(x-20,y+90,40,200);
  fill(random(0,255)); 
   ellipse(x,y,200,200);
   fill(random(0,255)); 
   ellipse(x,y,150,150);
fill(random(0,255));   
ellipse(x,y,100,100);
   fill(random(0,255));
   ellipse(x,y,50,50);
   
}



