
float angle = 0.0;
int lum = 255;
int blum = 51;


void setup (){
  size (400,400);
  noStroke();
  
}



void draw() {
  background(255);
  if(mousePressed){
    angle = angle +50*(mouseX);
  }else{
    angle = angle+1*(mouseX);
  }

  translate(200,200);
  rotate(angle);
  noStroke();
  fill(lum);
  
  
 for (int y=0; y<400 ; y+=50){
   for (int x=0; x<400 ; x+=50){
     
     fill (random (0),random(5), random(95));
     //fill ((x+y)*1.4);  // dark blue
     
 rect(x,y,40,40);
   
 }
}

for (int y=50; y<400 ; y+=50){
   for (int x=50; x<400 ; x+=50){
     
     //fill (random (255),random(255), random(255));
     fill ((x+y)*.8,20,8); //dark red
     
 rect(x,y,100,100);
   }
}


for (int y=150; y<400 ; y+=50){
   for (int x=150; x<400 ; x+=50){
     
     //fill (random (255),random(255), random(255));
     fill ((x+y)*.1);// light gray
     
 rect(x,y,50,50);
   }
}
 
 
 for (int y=10; y<300 ; y+=50){
   for (int x=10; x<300 ; x+=50){
     
     //fill (random (0),random(5), random(95));
     fill ((x+y)*1.4); //gray
     
 rect(x,y,40,40);
   
 }
}


 for (int y=20; y<300 ; y+=50){
   for (int x=20; x<300 ; x+=50){
     
     //fill (random (0),random(5), random(95));
     fill ((x+y)*1,255,5);  //green,yellow
     
 rect(x,y,20,20);
   
 }
}


 for (int y=20; y<300 ; y+=50){
   for (int x=-20; x<300 ; x+=50){
     
     //fill (random (0),random(5), random(95));
     fill ((x+y)*1,25,5); // red
     
 rect(x,y,20,20);
   
 }
}



//REFLECT REAL

  
 for (int y=0; y<400 ; y+=50){
   for (int x=0; x<400 ; x+=50){
     
     fill (random (0),random(5), random(95));
     //fill ((x+y)*1.4);  // dark blue
     
 rect(-x,y,40,40);
   
 }
}

for (int y=50; y<400 ; y+=50){
   for (int x=50; x<400 ; x+=50){
     
     //fill (random (255),random(255), random(255));
     fill ((x+y)*.8,20,8); //dark red
     
 rect(x,-y,100,100);
   }
}


for (int y=150; y<400 ; y+=50){
   for (int x=150; x<400 ; x+=50){
     
     //fill (random (255),random(255), random(255));
     fill ((x+y)*.1);// light gray on the right corner
     
 rect(-x,-y,50,50);
   }
}
 
 
 for (int y=10; y<300 ; y+=50){
   for (int x=10; x<300 ; x+=50){
     
     //fill (random (0),random(5), random(95));
     fill ((x+y)*1.4); //gray
     
 rect(-x,-y,40,40);
   
 }
}


 for (int y=20; y<300 ; y+=50){
   for (int x=20; x<300 ; x+=50){
     
     //fill (random (0),random(5), random(95));
     fill ((x+y)*1,255,5);  //green,yellow
     
 rect(-x,-y,20,20);
   
 }
}


 for (int y=20; y<300 ; y+=50){
   for (int x=-20; x<300 ; x+=50){
     
     //fill (random (0),random(5), random(95));
     fill ((x+y)*1,25,5); // red
     
 rect(-x,-y,20,20);
   
 }
}

for (int y=15; y<400 ; y+=50){
   for (int x=15; x<400 ; x+=50){
     
     //fill (random (255),random(255), random(255));
     fill ((x+y)*1.4); //dark red
     
 rect(x,-y,20,20);
   }
}


}



