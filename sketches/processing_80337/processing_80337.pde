

void setup (){
 size (400,200);
 noStroke(); 
}

void draw(){
  background (255);
  int i = 0;  
  while (i<400){
     fill (random(200),random(200),random(200));
     rect (i,0,mouseX/10,200);
     i = i +10;
     if (mousePressed&&(mouseButton==LEFT)){
       fill (255,0,0);
       rect (i,0,mouseX/10,mouseY/2);
       i = i +10;
     }
     if (mousePressed&&(mouseButton==RIGHT)){
        fill (#0311FF);
        rect (i,0,mouseX/10,mouseY/2);
        i = i +10; 
     }
   }
}
 

