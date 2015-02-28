
int xDim;
int yDim;
int diam;

void setup(){
  size (600,600);
  xDim = 20;
  yDim = 30;
  diam = 25;
  frameRate (15);
}

void draw(){
  
  if (keyPressed == true){
     diam += 2;
     if (key == 't'){
     
       fill(255,255,255,60);  
     }
     
    
    if (key == 'w'){
      
       fill(random(0,255),random(0,255),random(0,255),60);
    }
}
  
  if (keyPressed == false){
    if(diam > 25){
      diam -= 2;
     }
     
     fill(255,255,255);
     if(diam == 25){
        diam = 25;
    }
}
   
   noStroke();
   rect(0,0,600,600);
   
   if (mousePressed == true){
    fill(0,0,random(0,255));
   } 
   
   else{
     fill(0,255,0);
   }

  yDim += 10;
  ellipse(xDim, yDim, diam, diam);
  ellipse(xDim + 30, yDim, diam, diam);
  ellipse(xDim + 80, yDim, diam + 20, diam + 20);
  ellipse(xDim + 150, yDim, diam + 20, diam + 20);
  ellipse(xDim + 190, yDim, diam + 20, diam + 20);
  ellipse(xDim + 270, yDim, diam + 20, diam + 20);
  ellipse(xDim + 390, yDim, diam + 10, diam + 10);
  ellipse(xDim + 450, yDim, diam + 2, diam + 2);
  ellipse(xDim + 520, yDim, diam + 7, diam + 7);
}

