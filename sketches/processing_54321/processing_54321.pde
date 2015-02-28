
size(800,600);
background(255);
float a;
a=1;
smooth();
noStroke();

translate (400,300);
for(float i=0;i<800;i++){
 
  rotate(0.1);
   fill (0,0,random(200,255),random(10));
        ellipse (i,i,i+50,i+50);
     fill (random(100,255),0,0,random(50));
 // ellipse(i,i,a,a);
   //     ellipse(i+10,a+5,a+5,a+5);
     //   ellipse(i,i,a+55,a+55);
    fill (0,random(100,255),0,random(10));
       ellipse(i+2,i+2,a+2,a+2);
        ellipse(i+25,25,a+25,a+25);
        fill (random(100,255),0,0,random(100,255));
      ellipse(i,i,a,a);
      fill(255,255,255,random(100));
      ellipse (i,i,a+5,a+5);
        
        
      
    a=a+0.1;
}

