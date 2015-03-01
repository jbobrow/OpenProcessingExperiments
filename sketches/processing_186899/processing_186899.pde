
void setup(){
size (500, 500);
colorMode (HSB);
}


void draw(){
fill (250,0,0);
for (int i= 300; i>10; i=i-10) { 

stroke((mouseY/5),50,random(250));
   rect(width/2,height/2, i, i);
     stroke(random(200),(mouseY/5),300);
   rect(width/2,height/2, - i, - i);
     stroke((mouseY/5),random(200),50);
   rect(width/2,height/2,  i, - i);
    stroke((mouseY/5),random(250),300);
   rect(width/2,height/2, - i, i);
   
   
   
   
  }
  }
  
   
