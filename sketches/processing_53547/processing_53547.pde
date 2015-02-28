

size(800,800);      //, PDF, "abc.pdf");
background(0);
smooth();

int a= width/2;
int b= height/2;



ellipseMode(CENTER);
stroke (255);
 strokeWeight(0.6);
 //noStroke();
 //fill(220,56,34,90);
for (int c=1; c<=1000; c +=10){
  for (int d =200; d <=1000; d +=100){
    //fill(d/5,c/10,d/10,c/20);
    //rect (d/8,d/8,d/2,d/2);
    stroke(d/5,c/4,c/5,d/4);
    fill(d/10,c/8,d/8,20);
   rect (c/2,d/4,d/4,c/2);
   //rect (c/20,c/2,c/4,c/4);
    //rect (d*2,d/2,d/40,d/20);
    //rect (c/3,c/d,c/2,d/2);
    //ellipse(c/2,d/2,c/2,d/2);
     //fill(d/10,c/5,d/5,20);
     
   //ellipse (d/2,c/2,d/2,c/2);
}
}
//saveFrame ("013.tiff");
// probati razlicite kombinacije stroke, fill, rect, ellipse..


