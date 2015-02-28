

int a=450;
int b=225;

void setup(){
  size(900, 450);
  background(180,20,25);
}
void draw(){
  
    
  stroke(random(10),random(10),30,random(10)); 

  strokeWeight(abs((pmouseX-mouseX)));
   
}

void keyPressed  () {
  if (key==ENTER){
    saveFrame("output.png");
        background(180,20,25);

   }

}



void mousePressed(){
    
    a=mouseX;
    b=mouseY;
}

void mouseDragged(){
  line(a,b, mouseX,mouseY);
}

