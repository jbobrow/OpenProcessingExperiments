

 void setup(){
 
size(600,600);
}
void draw(){
 for(int i=0; i<600; i = i +10){
   
   for(int j=0; j<600; j=j+10){
     
     fill(random(mouseX),mouseY,random(mouseY));
     rect(i,j,10,10);
     fill(random(255),0,0);
     rect(i,10,10,10);
     fill(random(255),0,0);
     rect(i,50,10,10);
     rect(i,90,10,10);
     rect(i,130,10,10);
    rect(i,170,10,10);
    rect(i,210,10,10);
     rect(i,250,10,10);
    rect(i,290,10,10);
    rect(i,330,10,10);
    rect(i,370,10,10);
    rect(i,410,10,10);
    rect(i,450,10,10);
    rect(i,490,10,10);
rect(i,530,10,10);
    rect(i,570,10,10);
 
}
}
}
