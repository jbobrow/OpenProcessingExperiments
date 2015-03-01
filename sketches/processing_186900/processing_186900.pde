
void setup(){
size (500, 500);
colorMode (HSB);
}


void draw(){
fill (250,0,0);
for (int i= 300; i>20; i=i-5) { 

stroke((mouseY/5),250,random(250));
   rect(width/2,height/2, i, i);
   
     stroke(random(200),300,(mouseY/5));
   rect(width/2,height/2, - i, - i);
   
     stroke(random(250),(mouseY/5),300);
   rect(width/2,height/2,  i, - i);
   
    stroke((mouseY/5),random(250),300);
   rect(width/2,height/2, - i, i);
   
   
   
   
  }
  }
  
   
