
int x;
int dir;
boolean myDisplay;
void setup(){
 size(800,700);
 dir=4;
 background(240,245,116);
 myDisplay=false;
strokeWeight(random(3));
}
 void draw(){

   x+=dir;
  
     if (mousePressed){
fill(random(255),random(255),random(255));
     }
 ellipse(x,x,70,100);
  if(x>=width){
    dir=-6;
  }else if(x<=0)
  dir=4;

  stroke(random(255),random(255),random(255));
  strokeWeight(random(25));
    if(mousePressed){
  
        line(mouseX,mouseY,pmouseX,pmouseY);
  }
  
  
rect(100,150,20,20);

if(mouseX>100 && mouseX<120 && mouseY>150 && mouseY<170){
  //fill
  if(mouseX>100 && mouseX<120 && mouseY>150 && mouseY<170){
    println("YES!");
  }
  if(mousePressed){
   background(random(255));
    } 
  }
rect(20,20,20,40);
  if(mouseX>20 && mouseX<40 && mouseY>40 && mouseY<60){
    if(mouseX>20 && mouseX<40 && mouseY>40 && mouseY<60)
    println("YEEE");
     if(mousePressed){
 dir=0;

     }else if(mousePressed){ dir=1;

  }}

  
  rect(60,60,20,40);
  if(mouseX>60 && mouseX<80 && mouseY>80 && mouseY<100){
   
      if(mousePressed){
     
  noFill();
  for(int i =0; i< 200; i++){
    ellipse(width/2,height/2,i*7,i*7);

  }
  
 
   for(int i =0; i< 200; i++){
     stroke(random(201),37,119);
     ellipse(mouseX,mouseY, i*10,i*10);
   }
   if(mousePressed){
background(0);
     for(int i =0; i< 200; i++){
      stroke(37,201,101);
       ellipse(mouseX,mouseY, i*10,i*10);
     }
   }
}
  }
   rect(620,640,20,20);
  if(mouseX>620 && mouseX<640 && mouseY>640 && mouseY<660){
   
      if(mousePressed){
         
        translate(200,200);
for(int i=0; i<180; i++){
 fill(random(255));
  rect(i++,i++,100,20);
rotate(radians(45));
}
      }

  }
 if(mouseX>width/2){
   strokeWeight(2);
   stroke(1);
}}
