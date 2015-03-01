
void setup(){
size(1000,1000);
background(0);

}
 
void draw(){
  background(0);
  int counter = 0;
  int space = 20;
 strokeWeight(3);
 
//  while(counter <200){
//    rect(0,counter*space,15,space);
//    counter = counter+8;
//  }
//  
//  counter = 0;
  
  while(counter <200){
    rect(0+30,(counter*space)+(counter*space),15,space);
    counter = counter+8;
  }
  
  counter = 0;
  while(counter <200){
    rect(0+(4*15),2*(counter*space),15,space);
    counter = counter+8;
  }
  
  counter=0;
  while(counter <200){
    rect(0+(6*15),2*(counter*space),15,space);
    counter = counter+5;
  }
  
  counter = 0;
  while(counter <200){
    rect(0+(8*15),2*(counter*space),15,space);
    counter = counter+5;
}

counter = 0;
  while(counter <200){
    rect(0+(10*15),2*(counter*space),15,space);
    counter = counter+5;
}

counter = 0;
  while(counter <200){
    rect(0+(12*15),2*(counter*space),15,space);
    counter = counter+5;
}

counter = 0;
  while(counter <200){
    rect(0+(14*15),2*(counter*space),15,2*space);
    counter = counter+4;
}

counter = 0;
  while(counter <200){
    rect(0+(16*15),2*(counter*space),15,2*space);
    counter = counter+4;
}
counter = 0;
  while(counter <200){
    rect(0+(18*15),2*(counter*space),15,2*space);
    counter = counter+4;
}
counter = 0;
  while(counter <200){
    rect(0+(20*15),2*(counter*space),15,2*space);
    counter = counter+4;
}

counter = 0;
  while(counter <200){
    rect(0+(22*15),2*(counter*space),15,2*space);
    counter = counter+4;
}

counter = 0;
  while(counter <200){
    rect(0+(24*15),4*(counter*space),15,4*space);
    counter = counter+4;
}

counter = 0;
  while(counter <200){
    rect(0+(27*15),4*(counter*space),15,4*space);
    counter = counter+4;
}

//counter = 0;
//  while(counter <200){
//    rect(0+(30*15),4*(counter*space),15,4*space);
//    counter = counter+4;
//}

counter = 0;
  while(counter <200){
    rect(0+(33*15),4*(counter*space),15,4*space);
    counter = counter+4;
}

//counter = 0;
//  while(counter <200){
//    rect(0+(36*15),4*(counter*space),15,4*space);
//    counter = counter+4;
//}

counter = 0;
  while(counter <200){
    rect(0+(39*15),4*(counter*space),15,4*space);
    counter = counter+4;
}

counter = 0;
  while(counter <200){
    rect(0+(42*15),4*(counter*space),15,4*space);
    counter = counter+4;
}

//one more x over than symmetrical would be
counter = 0;
  while(counter <200){
    rect(0+(45*15),2*(counter*space),15,2*space);
    counter = counter+4;
}

counter = 0;
  while(counter <200){
    rect(0+(47*15),2*(counter*space),15,2*space);
    counter = counter+4;
}

counter = 0;
  while(counter <200){
    rect(0+(49*15),2*(counter*space),15,2*space);
    counter = counter+4;
}

counter = 0;
  while(counter <200){
    rect(0+(51*15),2*(counter*space),15,2*space);
    counter = counter+4;
}


counter = 0;
  while(counter <200){
    rect(0+(53*15),2*(counter*space),15,2*space);
    counter = counter+4;
}

counter = 0;
  while(counter <200){
    rect(0+(55*15),2*(counter*space),15,space);
    counter = counter+5;
}

counter = 0;
  while(counter <200){
    rect(0+(57*15),2*(counter*space),15,space);
    counter = counter+5;
}

counter = 0;
  while(counter <200){
    rect(0+(59*15),2*(counter*space),15,space);
    counter = counter+5;
}

counter = 0;
  while(counter <200){
    rect(0+(61*15),2*(counter*space),15,space);
    counter = counter+5;
}

 counter=0;
  while(counter <200){
    rect(0+(63*15),2*(counter*space),15,space);
    counter = counter+8;
  }
  
   counter=0;
  while(counter <200){
    rect(0+(65*15),2*(counter*space),15,space);
    counter = counter+8;
  }

//gradient purple circles bullseye
counter = 0;
while (counter<100){
  fill(223,185,247, 35);
  ellipse(width/2, height/2, counter*space, counter*space);
  counter=counter+8;}
//NVM no circle lines?
//counter=0;
//stroke(1);
//while(counter <100){
//  ellipse(width/2, height/2, counter*space, counter*space);
//  counter=counter+5;
//}
}


