

size(250, 250); 
background(99,206,260,9); 
stroke(255);
smooth(); //basic background

  for(int i = 1/2; i <300; i += 9) {
   for(int x=0;x<=300;x+=70){
    fill(x,30,220,11);
    //stroke(x+70,i+100,i,x);
    stroke(225,x+55,i,x);
    strokeWeight(3);
    triangle(250,0,x*2.5,i*2,i,0); // back ground pattern
}
  
}
for(int y=0;y<=400;y+=40){
    for(int x=0;x<=400;x+=40){
      fill(x-9,y,1,21);
      strokeWeight(3);
      stroke(x,y,x,22);// color for lines
      
    }
  }

for(int y=2;y<=250;y*=2){
    for(int x=2;x<=250;x*=2){
    
    //ellipse(125+x/1.1,125-x/1.1,x/2,x/2);
    ellipse(100,70,x/9,x/3);
    ellipse(30,5,x/3,x/7);
    ellipse(20,236,x/5,x/2);
     ellipse(30,155,x/7,x/7);
     ellipse(220,193,x/6,x/9);
    ellipse(150,220,x/4,x/4);
    ellipse(220,40,x/1.5,x/1.5);
    //fill(x/3,y,203,22);
    ellipse(150-x/1.1,100+x/1.1,x/2.5,x/2.5); // all yellow circles
  }
}

