
void setup() {  //setup function called initially, only once
  size(350, 250);
}

void draw() {  //draw function loops 
     background(200,234,100);
     ellipse(mouseX+20,mouseY+20,100,100);
     
     if (mousePressed){
         fill(200,200,200);
     } else{
         fill(0,250,0);
     }
     
     
     
     ellipse(mouseX+20,mouseY+20,90,90);
     
     if (mousePressed){
         fill(100,200,200);
     } else{
         fill(50,250,0);
     }
     
     
     ellipse(mouseX+20,mouseY+20,80,80);
     
     if (mousePressed){
         fill(60,200,200);
     } else{
         fill(60,250,0);
     }
     
     
     ellipse(mouseX+20,mouseY+20,70,70);
     
     if (mousePressed){
         fill(200,200,20);
     } else{
         fill(0,200,0);
     }
     
     
     ellipse(mouseX+20,mouseY+20,60,60);
     
     if (mousePressed){
         fill(30,200,200);
     } else{
         fill(0,50,0);
     }
     
     
     
     ellipse(mouseX+20,mouseY+20,50,50);
     
     if (mousePressed){
         fill(15,200,200);
     } else{
         fill(200,250,0);
     }
     
     
     
     ellipse(mouseX+20,mouseY+20,40,40);
     
     if (mousePressed){
         fill(200,100,200);
     } else{
         fill(100,250,200);
     }
     
     
     
     ellipse(mouseX+20,mouseY+20,30,30);
     
     if (mousePressed){
         fill(200,200,20);
     } else{
         fill(0,25,0);
     }
     
     
     
     ellipse(mouseX+20,mouseY+20,20,20);
     
     if (mousePressed){
         fill(100,20,200);
     } else{
         fill(0,250,120);
     }
     
     
     
     ellipse(mouseX+20,mouseY+20,10,10);
     
     if (mousePressed){
         fill(20,200,20);
     } else{
         fill(0,50,0);
     }
}
